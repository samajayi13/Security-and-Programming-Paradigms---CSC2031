<%--
  Created by IntelliJ IDEA.
  User: johnmace
  Date: 21/10/2020
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
    <title>Account!</title>
    <style type="text/css">
        table{
            width: 100% !important;
        }
    </style>
</head>
<body>
<div class="container main_div">
    <%
        session = request.getSession()
    ;%>
    <h1 class="text-center mb-3">User Account</h1>
    <p class="ml-5"><%= request.getAttribute("message") %></p>
    <table class="table table-striped table-dark">
        <thead>
        <tr>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Username</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= session.getAttribute("firstname") %></td>
                <td><%= session.getAttribute("lastname") %></td>
                <td><%= session.getAttribute("email") %></td>
                <td><%= session.getAttribute("phone") %></td>
                <td><%= session.getAttribute("username") %></td>
            </tr>
        </tbody>
    </table>
    <form action="UserLogin" method="post">
        <input type="submit" value="Get All Data" class="submit_btn" style="display: inline-block">
            <a href="index.jsp"><button class="submit_btn" style="display:inline-block">Home Page</button></a>
    </form>

    <form action="AddUserNumbers" method="post" class="mt-5">
        <h1 class="text-center">User Numbers</h1>
        <div><ul id="error-message" class="text-danger"></ul></div>
        <div class="form-group">
            <input type="number" min="0" max="60" class="form-control"  id="number-one" name="numberone" placeholder="Number one" required>
        </div>
        <div class="form-group">
            <input type="number" min="0" max="60" class="form-control"  id="number-two" name="numberone" placeholder="Number two" required>
        </div>
        <div class="form-group">
            <input type="number" min="0" max="60"  class="form-control"  id="number-three" name="numberone" placeholder="Number three" required>
        </div>
        <div class="form-group">
            <input type="number" min="0" max="60" class="form-control"  id="number-four" name="numberone" placeholder="Number four" required>
        </div>
        <div class="form-group">
            <input type="number" min="0" max="60" class="form-control"  id="number-five" name="numberone" placeholder="Number five" required>
        </div>
        <div class="form-group">
            <input type="number" min="0" max="60" class="form-control"  id="number-six" name="numberone" placeholder="Number six" required>
        </div>
        <button  id="random-btn" class="btn-large">Random Numbers</button>
        <input type="submit" id="submit_btn" value="Submit" name="submit">
        <h4 class="userInfo text-center mt-3"><a href="index.jsp">New user? Sign up !</a></h4>

    </form>

</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="Useful_functions.js"></script>
<script>
    var  inputs = document.getElementsByTagName("input");

    // to do : put disable submit button into a js file called useful functions
    disableSubmitButton();
    document.addEventListener("input",function(e){

        let valid = true ;
        for(var i = 0; i <= inputs.length-1; i++){
            deleteErrorMessage(inputs[i].id.replace("-"," ")+" needs to be between the range of 0 and 60");
            console.log(inputs[i].value);
            if(inputs[i].value.toString().length <= 0 && inputs[i].id.includes("number") === true){
                valid = false;
            }else if(inputs[i].value > 60 || inputs[i].value < 0){
                addToErrorMessage(inputs[i].id.replace("-"," ")+" needs to be between the range of 0 and 60");
                valid = false;
            }
        }
        if(valid === true && errorMessage.children.length <=0)
            activateSubmitButton();
        else
            disableSubmitButton();
    })

    document.querySelector("#random-btn").addEventListener("click",function(e){
        for(let i = 0; i <= inputs.length -1 ;i++){
            if(inputs[i].id.includes("number")){
                inputs[i].value = Math.floor(Math.random() * 60 )+ 1;
            }
        }
        e.preventDefault();
        activateSubmitButton();
    })

</script>
</body>
</html>
