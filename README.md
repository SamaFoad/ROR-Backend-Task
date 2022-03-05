<h1> Backend Task </h1>
<!-- <h1 style="color:blue">Chest X-ray Diagnosis 💊😷👨‍⚕️ </h1><br>
<h2>Problem description : </h2>
<p>Given the chest X-ray dataset, our goal is to build a range of neural networks to diagnose chest
X-rays. Our database consists of patients suffering from COVID-19, Pneumonia, and normal Patients</p><br>
<h2>Procedure 🤔💡</h2>
<ol>
  <li>Get our Kaggle dataset that contains the COVID-19 database </li> 
  <li> We do some pre-cleaning to our dataset like: creating the train,validate,test arrays from </li>
</ol>    
   
 
# URL_Monitoring# URL Monitoring API 💡🤔

<p> This is a project where the user can check the status of his targeted URL by calling the corresponding API</p>

<h2> Features 🧾 </h2>
<li> Signup verification through One Time Password (OTP) send to the user's email </li>
<li> JWT verfication token for the Authenticated Users </li>
<li> A middleware to add another security layer to the URL routes</li>
<li> A User schema that contains all the user's subscriped URLs </li>
<li> A URL schema that contains all of its subscriped users , number of it being up or down for service , and other information </li>
<li> The ability for the user to check his desired URL , edit his previously visited URLs , delete one of his previously visited URLs , get Full report of his/her URLs</li>

<h2>User Manual 📓 </h2>
<ol>
  <li> The user register to the system with his email and password through this route <code> /signup </code>  </li>
  <li> The user enter the OTP that was sent to his email to complete his verification process through this route <code> /CheckOTP </code>  </li>
  <li> Verified users can access the <code> Monitored Urls controller </code> by calling its APIs
    <ul> 
      <li> If a user wishes to check a URL , he has to call the route<code>/getUrlinfo</code> and pass to it the "URL" he wishes to check </li> 
      <li> To update a URL , the user has to call the <code>/updateURL</code> route and pass to it both the old URL and the updated one </li> 
      <li> Deleting a URL can be accomplished by calling <code>/deleteURL</code> and only pass the targeted URL to it </li> 
      <li> <code>/getReport</code> can be used to get a full report for all his subscriped URLs</li> 
    </ul>
  </li> 
</ol> 
<h4> 🎈🎉And by the end of these approaches we can check our users' targeted URLS🎈🎉</h4> -->
