<h1> Backend Task </h1>
<p> In this task, you are required to solve multiple questions with specific input/output formats and
well-defined requirments and constraints. Your solutions will be measured for efficiency and
optimality using test cases.</p>

<h2> Question 1: "Where Am I" API </h2>
<h3> Question description </h3>
<p> In this challenge, you are developing a platform that provides information about a user's location
and language.</p>
</br>
<p> In this challenge, you are developing a platform that provides information about a user's location
and language.</p>
<h5> User information is a JSON object, which contains following properties: </h5>
<ul> 
  <li> 
    ip: the IP address of the user
 </li>
  <li>
    country: the ISO code of the user's country, derived from the IP address
 </li>
  <li>
    language: the preferred language of the user
 </li>
</ul>

<h4> Requiremnets </h4>
<p>The REST service should implement the following endpoint:</p>
<p>GET /whereami :</p>
<ul> 
  <li> 
    returns response code 200
 </li>
  <li>
    returns the user's IP address
 </li>
  <li>
    returns the ISO code of the user's country based on the IP address. If a country is not detected
by IP, it returns null .
 </li>
  <li>
    returns the preferred language of the user (see the Accept-Language request header). If the
user has multiple preferred languages, the endpoint returns only the one that is used the most.
  </li>
</ul>

<p> In order to fetch country code by the IP address, you should use the service
https://jsonmock.hackerrank.com. For example,
https://jsonmock.hackerrank.com/api/ip/172.217.20.46. Note that this is a mock service and might
not contain specific IP address information. </p>
