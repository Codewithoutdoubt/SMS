<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        html,
        body {
            width: 100%;
            height: 100%;
        }

        body {
            background-image: url(${pageContext.request.contextPath}/static/images/2.png);
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
        }

        @keyframes textanimi {
            from {
                font-size: 0px;
            }

            to {
                font-size: 80px;
            }
        }

        .div1 {
            height: 90px;
            position: relative;
        }

        .div1child1 {
            width: 20%;
            position: absolute;
            top: 5px;
            bottom: 5px;
            left: 10px;
        }

        img {
            width: 90px;
        }

        .div1child2 {
            padding-top: 10px;
            width: 92%;
            margin-left: 5%;
            font-size: 30px;
            color: whitesmoke;
        }

        .div1child3 {
            height: 90%;
            width: 50%;
            top: 15px;
            font-size: 20px;
            margin-left: 50%;
            text-align: right;
            position: absolute;
        }

        ul {
            list-style-type: none;
            margin-top: 0px;
            padding: 0;
            overflow: hidden;
            vertical-align: top;
            display: inline-block;
        }

        li {
            float: left;
        }

        li a,
        .dropbtn {
            display: inline-block;
            color: rgb(255, 255, 255);
            text-align: center;
            padding: 10px;
            text-decoration: none;
            bottom: 4px;
        }

        li a:hover,
        .dropdown:hover .dropbtn {
            background-color: #ff0000;
        }

        .div2 {
            position: relative;
            right: 0px;
            left: 15px;
            top: 60px;
            bottom: 10px;
            color: white;
            animation: textanimi ease-in 1s;
            font-size: 100px;
            font-style: italic;


        }

        img {
            margin-top: 5px;
            border-radius: 40%;
            width: 50px;
            align-items: center;
        }

        .footer {
            padding: 10px 5px;
            position: absolute;
            bottom: 0px;
            color: rgb(0, 0, 0);
            background: white;
        }
    </style>
</head>

<body>
    <div class="content">


        <div class="div1">

            <div class="div1child1">
                <img src="${pageContext.request.contextPath}/static/images/1.jpg">
            </div>
            <div class="div1child2">POLYTECHNIC COLLEGE </div>

            <div class="div1child3">
                <ul>
                    <a href="#" class="dropbtn">Home</a>
                    <a href="/loginpage" class="dropbtn">Login</a>
            </div>
        </div>
        <div class="div2">
            Welcome To <br>Polytechnic <br>College Website
        </div>
    </div>
    </div>
    <div class="footer container-fluid pt-2">
        <h4 align="center">Design And Developed by Gmd Group.</h4>
    </div>
</body>

</html>