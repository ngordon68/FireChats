# FireChats
<img width="100" alt="Screen Shot 2023-02-15 at 8 14 27 AM" src="https://github.com/ngordon68/Challenge6/assets/102773701/a7e7b6bf-ce8b-45b7-83d7-3a1610ae1e5e.png">
![FireChats](https://github.com/ngordon68/FireChats/assets/102773701/aca871b7-fba3-4aab-8b8e-4dc7bb331f93)


# 01 OverView

The idea is that you send a debatable topic to the chat and the members can tap to vote agree (🔥) or disagree (❄️).   


## 
<img width="300px; height: 500px;" alt="Screen Shot 2023-02-16 at 11 50 11 AM" src="https://github.com/ngordon68/FireChats/assets/102773701/bcec6974-955e-432a-a065-881cfe5fb9cd">
<img width="300px; height: 500px;" alt="Screen Shot 2023-02-16 at 11 50 11 AM" src="https://github.com/ngordon68/FireChats/assets/102773701/b6a7f061-8e01-4c70-a5ca-a0328382f26b)">
<img width="300px; height: 500px;" alt="Screen Shot 2023-02-16 at 11 50 11 AM" src="https://github.com/ngordon68/FireChats/assets/102773701/4af1743f-9ce7-4d72-aba2-2e6520e2b30d">
<img width="300px; height: 500px;" alt="Screen Shot 2023-02-16 at 11 50 11 AM" src="https://github.com/ngordon68/FireChats/assets/102773701/d9a9a010-4842-42bc-9013-d9efbba2c560">
<img width="300px; height: 500px;" alt="Screen Shot 2023-02-16 at 11 50 11 AM" src="https://github.com/ngordon68/FireChats/assets/102773701/6b5d60e5-d88d-4d17-8e2e-650323b27006">
<img width="300px; height: 500px;" alt="Screen Shot 2023-02-16 at 11 50 11 AM" src="https://github.com/ngordon68/FireChats/assets/102773701/b743c11d-0831-427d-8391-941d26826385">
<img width="300px; height: 500px;" alt="Screen Shot 2023-02-16 at 11 50 11 AM" src="https://github.com/ngordon68/FireChats/assets/102773701/c7f4dc96-6c62-4b88-a935-c9a809a02f90">





# 02 Objectives 
- Code up a MVP(Mininum Viable Product) of a FireChats App
- Take Hi-Fi specifications and translate to Xcode app.
- Collaboration with coders and designers to bring our Hi-Fi prototype to life.
- Test UI and UX through documentation.
- Test code to find any inconsistencies.
- Submit Project to TestFlight for UserFeedback and make changes accordingly.
- Submit to the App Store

# 03 Skills
Swift, Swift UI, XCode, Figma, Sketch.
Messages, AVKit, LottieFiles, UIKit






# 04 Project Timeline



 <table>
 <tr>


  <td>
 <img width="224" alt="week2" src="https://github.com/ngordon68/FireChats/assets/102773701/72b799b4-2107-421f-9636-ed5c05d58123">

   <td>
   
 <img width="224" alt="week2" src="https://github.com/ngordon68/FireChats/assets/102773701/59214594-305e-4da3-b434-fc97c4902def">

  <td>
  
  <img width="224" alt="week3" src="https://github.com/ngordon68/FireChats/assets/102773701/cf1875b3-2eb2-42a6-81bd-60c0267975bf">
   
   <td>
    
  <img width="224" alt="week3" src="https://github.com/ngordon68/FireChats/assets/102773701/28123804-405f-4e77-a97f-2652ae708e72">

  <tr>
   <table>  
   
# 05 Technical Walkthrough
    
The iMessage game took a lot of learning as it involed using the messages framework and a game which is completely different from the standard iOS phone apps in the past that I developed. The idea of the app is to allow the user to select prompts from a generated list of 50 to send out to the group chat. The user then can tap on the card to vote either agree or disagree with the correesponding animations and color. 
    
The app uses the Messages framework which is naturally in UIkit and Storyboard. At first, making the components took alot more work than compared to SwiftUI and we realized that our app wouldnt make the deadline of the project scope.  Using the SceneDelegate class in UIkit allowed for the bypass of using storyboard and making a UIkit view the root view when the user enteres the app. From there, there was difficuilty trying to code a view in UIkit as there was alot of unfamiliar code needed to make a view that would have taken 3x less code in SwiftUI. Trying for a few days, we realized that we would not make the deadline if we relied on UIkit as it would have taken time to learn how to make a view and making it functional to the Hi-Fi. The solution to this was to make the views in SwiftUI then to convert to a UIkit view using the UIHostingController rootview.    
    
    
# 06 Demo

    




    

https://github.com/ngordon68/FireChats/assets/102773701/eae9dd79-9f33-4e07-9819-fcd0748d87cd







    
