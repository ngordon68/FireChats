//
//  StoreKitManager.swift
//  FireChats MessagesExtension
//
//  Created by Nick Gordon on 6/15/23.
//

import Foundation
import StoreKit
import StoreKitTest

class StoreKitManager: ObservableObject {
    
    @Published var storeProducts: [Product] = []
    @Published var purchasedCourses: [Product] = []
    
    var updateListenerTask: Task<Void, Error>? = nil
    
    private let productDict: [String : String]
    
    init() {
        //check the path for the plist
        
        if let plistPath = Bundle.main.path(forResource: "PropertyList", ofType: "plist"),
           //get the list of products
        
        let plist = FileManager.default.contents(atPath: plistPath) {
            productDict = (try? PropertyListSerialization.propertyList(from: plist, format: nil) as? [String: String]) ?? [:]
        }
        else {
            productDict = [:]
        }
        
        updateListenerTask = listenForTransactions()
        
        Task {
            await requestProduct()
            
            await updateCustomerProductStatus()
        }
    }
    
    
    deinit {
        updateListenerTask?.cancel()
    }
    
    func listenForTransactions() -> Task<Void, Error> {
        return Task.detached {
            //iterate through any transactions that dont come for a direct call to "purchase()"
            
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    
                    //the transaction is verified, deliver the content to the user
                    
                    await self.updateCustomerProductStatus()
                    
                    //always finish a transaction
                    
                    await transaction.finish()
                } catch {
                    //storekit has a transaction that fails verification, don't deliver content to the user
                    
                    print("Transaction failed verification")

                }
            }
        }
    }
    
    @MainActor
    func requestProduct() async {
        do {
            //using the Product static method products to retrieve the lsit of products
            
            storeProducts = try await Product.products(for: productDict.values)
            
            //iterate the type if there are multiple product types.
        } catch {
            print("failed")
            
        }
        
    }
    
    //call the product purchase and return an optional transaction
    
    func purchase(_ product: Product) async throws -> Transaction? {
        //make a purhcase request - optional parameters available
        
        let result = try await product.purchase()
        
        //check the results
        
        switch result {
        case .success(let verificationResult):
            //Transction will be verified for automatically using JWT(jwsRepresentation - we can check the result)
            
            let transaction = try checkVerified(verificationResult)
            
            //the transaction is verified, deliver the content to the user
            
            await updateCustomerProductStatus()
            
            await transaction.finish()
            
            return transaction
            
        case .userCancelled, .pending:
            return nil
            
        default:
            return nil
        

        }
    }
    
    //Generics - check the verificationResults
    func checkVerified<T>(_ result: VerificationResult<T>) throws   -> T {
        //check if the KWS passes the Storekit Verification
        
        switch result {
        case .unverified:
            //failed verification
            
            throw StoreError.failedVerification
            
        case .verified(let signedType):
            return signedType
        }
    }
    
    @MainActor
    
    func updateCustomerProductStatus() async {
        var purchasedCourses: [Product] = []
        //iterate through all the users purchased content
        
        for await result in Transaction.currentEntitlements {
            do {
                
                //again check if transaction is verified
                let transaction = try checkVerified(result)
                
                //since we only have one type of productype - .noncosunables -- check if any storeProducts matches the transaction.productId then add to the purchases items
                
                if let course = storeProducts.first(where: { $0.id == transaction.productID}) {
                    purchasedCourses.append(course)
                }
            }
                
                catch {
                    //storekit has a transaction that failed verification, dont deliver content to the user
                    print("Transaction failed verification")
                }
                
                //finally assigned the purchased products
                
                self.purchasedCourses = purchasedCourses
            }
        }
    
    //check if product has already been purchased
    func isPurchase(_ product: Product) async throws -> Bool {
        //as we only have one product type grouping. nonconsumble - we check if it belongs to the purchasedCourses which ran init()
        
        return purchasedCourses.contains(product)
    }
    }


public enum StoreError: Error {
    case failedVerification
}

