<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>

<html lang="en" dir="ltr">
  <title>Login page</title>
  <head>
    <meta charset="UTF-8">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/responsiveform.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script type="text/javascript">
      function matchpass(){
             var password=document.f1.password.value;
             
     
             if(password=="" )
             {
                alert("please enter your password");
                return false;
             }
             
         }
     </script>
   </head>
<body>
  <div class="container">
    <div class="title">LOGIN</div>
    <div class="content">
      <form action=" " name="f1" onsubmit="return matchpass()">
        <div class="user-details">
          <div class="input-box">
            <span class="details">User Name</span>
            <input type="text" placeholder="Enter your user name" required>
          </div>
          <div class="input-box">
          <span class="details"> Password</span>
          <input type="text" placeholder="Enter your password" name="password" required>
          </div>
          
          
          </div>
          
<div class="button">
          <a href="HomePage.html"></a><input type="submit" value="LOGIN">
        </div>
          </form>
          </div>
    </div>
 
          </body>
          </html>