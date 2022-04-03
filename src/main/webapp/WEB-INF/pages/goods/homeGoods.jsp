<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Unipath</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css"/>
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js"></script>
    <script type="text/javascript">
        function removeImg(){
            $("#img_ad").hide(1000);
        }
    </script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/user.css"/>
    <style>
        .img-box{

            display: inline-block;
        border: 1px solid #ececec;
            position: relative;
        }

        .cover-img{
            max-width: 800px;
            min-width: 200px;
        }


        .image-remove{
            background-color: white;
            font-color: #ececec;
            font-size: 30px;
            width: 30px;
            height: 30px;
            text-align: center;
            border-radius: 100%;
            transform: rotate(45deg);
            cursor:pointer;
            opacity: 0.5;
            top:2px;
            right:2px;
        display: block;
        position: absolute;

        }

        .re{transform:rotate(90deg);
            -ms-transform:rotate(90deg); /* Internet Explorer 9*/
            -moz-transform:rotate(90deg); /* Firefox */
            -webkit-transform:rotate(45deg); /* Safari 和 Chrome */
            -o-transform:rotate(90deg); /* Opera */
            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1);
            position: absolute;
            top: 0px;
            right: 1px;
            cursor: pointer;
            color:red;



        }


    </style>

    <script>
        function showLogin() {
            if ($("#signup-show").css("display") == 'block') {
                $("#signup-show").css("display", "none");
            }
            if ($("#login-show").css("display") == 'none') {
                $("#login-show").css("display", "block");
            } else {
                $("#login-show").css("display", "none");
            }
        }

        function showSignup() {
            if ($("#login-show").css("display") == 'block') {
                $("#login-show").css("display", "none");
            }
            if ($("#signup-show").css("display") == 'none') {
                $("#signup-show").css("display", "block");
            } else {
                $("#signup-show").css("display", "none");
            }
        }

        function ChangeName() {
            if ($("#changeName").css("display") == 'none') {
                $("#changeName").css("display", "block");
            } else {
                $("#changeName").css("display", "none");
            }
        }

        $(document).ready(function () {

            $("#phone").blur(function () {
                var phone = $(this).val();
                $.ajax({
                    url: '<%=basePath%>user/register',
                    type: 'POST',
                    data: {phone: phone},
                    dataType: 'json',
                    success: function (json) {
                        if (json.flag) {
                            $("#errorPhone").html("Account has been used!");
                            $("#register").attr("disabled", true);
                        } else {
                            $("#errorPhone").empty();
                            $("#register").attr("disabled", false);
                        }
                    },
                    error: function () {
                        alert('time exceeded!');
                    }
                });

            });

        });


    </script>
<body ng-view="ng-view">

<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope">
    <nav class="white nav1">
        <div class="nav-wrapper">
            <a href="<%=basePath%>goods/homeGoods" class="logo">
                <em class="em1"></em>
                <em class="em2">Unipath</em>
                <em class="em3"></em>
            </a>
            <div class="nav-wrapper search-bar">
                <form class="ng-pristine ng-invalid ng-invalid-required" action="<%=basePath%>goods/search">
                    <div class="input-field">
                        <input id="search" name="str" placeholder="Searching..." style="height: 40px;"
                               class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"/>
                        <input type="submit" class="btn" value="Search"/>
                        <label for="search" class="active">
                            <i ng-click="search()" class="iconfont"></i>
                        </label>
                    </div>
                </form>
            </div>
            <ul class="right">
                <li>
                    <a href="<%=basePath%>admin" target="_blank"></a>
                </li>
                <c:if test="${empty cur_user}">
                    <li class="publish-btn">
                        <button onclick="showLogin()" data-toggle="tooltip"
                                title="You need to login！" class="red lighten-1 waves-effect waves-light btn">
                            upload
                        </button>
                    </li>
                </c:if>
                <c:if test="${!empty cur_user}">
                    <li class="publish-btn">
                        <button data-position="bottom" class="red lighten-1 waves-effect waves-light btn">
                            <a href="<%=basePath%>goods/publishGoods">upload</a>
                        </button>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/allGoods">My Items</a>
                    </li>
                    <li>
                        <a>${cur_user.username}</a>
                    </li>
                    <!-- <li class="notification">
                    <i ng-click="showNotificationBox()" class="iconfont"></i>
                    </li> -->
                    <li class="changemore">
                        <a class="changeMoreVertShow()">
                            <i class="iconfont"></i>
                        </a>
                        <div class="more-vert">
                            <ul class="dropdown-content">
                                <li><a href="<%=basePath%>user/home">My home</a></li>
                                <li><a href="<%=basePath%>user/allFocus">My Wish List</a></li>
                                <li><a onclick="ChangeName()">Change Username</a></li>
                                <li><a href="<%=basePath%>user/logout">LogOut</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${empty cur_user}">
                    <li>
                        <a onclick="showLogin()">LogIn</a>
                    </li>
                    <li>
                        <a onclick="showSignup()">Register</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</div>

<div ng-controller="loginController" class="ng-scope">
    <div id="login-show" class="login stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showLogin()">
<%--                    <div class="col s12 title"></div>--%>
                </a>
                <form action="<%=basePath%>user/login" method="post" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="phone" id="login_phone" required="required" pattern="^1[0-9]{10}$"
                               class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched"/>
                        <label>phone&nbsp;&nbsp;<div id="login_errorPhone" style="color:red;display:inline;"></div>
                        </label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" id="login_password" name="password" required="required"
                               class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"/>
                        <label>password&nbsp;&nbsp;<div id="errorPassword" style="color:red;display:inline;"></div>
                        </label>
                        <!--   <a ng-click="showForget()" class="forget-btn">忘记密码？</a> -->
                    </div>
                    <button type="submit" id="loginIn" class="waves-effect waves-light btn login-btn red lighten-1">
                        <i class="iconfont left"></i>
                        <em>Login</em>
                    </button>
                    <div class="col s12 signup-area">
                        <em>Don't have an account?</em>
                        <a onclick="showSignup()" class="signup-btn">register</a>
                        <em></em>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div ng-controller="signupController" class="ng-scope">
    <div id="signup-show" class="signup stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showSignup()">
<%--                    <div class="col s12 title"></div>--%>
                </a>
                <form action="<%=basePath%>user/addUser" method="POST" role="form" id="signup_form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required"
                               class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched"/>
                        <label>username</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="text" name="phone" id="phone" required="required" pattern="^1[0-9]{10}$"
                               class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched"/>
                        <label>phone&nbsp;&nbsp;<div id="errorPhone" style="color:red;display:inline;"></div>
                        </label>

                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required"
                               class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"/>
                        <label>password</label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button type="submit" id="register"
                                class="waves-effect waves-light btn verify-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>register</em>
                        </button>
                    </div>
                    <div ng-show="checkTelIsShow" class="login-area col s12">
                        <em>Already have an account</em>
                        <a onclick="showLogin()">login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div ng-controller="changeNameController" class="ng-scope">
    <div id="changeName" class="change-name stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <div class="col s12 title">
                    <h1>Change username</h1>
                </div>
                <form action="<%=basePath%>user/changeName" method="post" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required"
                               class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched"/>
                        <label>Change username</label>

                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button class="waves-effect waves-light btn publish-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>Confirm</em>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div ng-controller="sidebarController" class="sidebar stark-components ng-scope">
    <li ng-class="{true: 'active'}[isAll]">
        <a href="<%=basePath%>goods/catelog" class="index">
<%--            <img src="<%=basePath%>img/index.png">--%>
            <em>What's new</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isDigital]">
        <a href="<%=basePath%>goods/catelog/1" class="digital">
<%--            <img src="<%=basePath%>img/digital.png"/>--%>
            <em>Electronics</em>
        </a>
    </li>
<%--    try to do--%>
    <li ng-class="{true: 'active'}[isClothes]">
        <a href="<%=basePath%>goods/catelog/8" class="">
<%--            <img src="<%=basePath%>img/digital.png"/>--%>
            <em>Clothes</em>
        </a>
    </li>


    <li ng-class="{true: 'active'}[isBook]">
        <a href="<%=basePath%>goods/catelog/4" class="book">
<%--            <img src="<%=basePath%>img/book.png"/>--%>
            <em>Text Books</em>
        </a>
    </li>

    <div class="info">
        <p>Need Help?</p><em>-</em>
        <p>Contact us</p>
        <p>000-000-0000</p>
    </div>

    <div class="img-box" style="margin-top: 40px">
        <img src="/img/photo.jpg" class="cover-img" id="img_ad" width="230px"/>
        <div class="re" onclick="removeImg()" id="removeImg">+</div>


    </div>

</div>

<div class="main-content">

    <div class="slider-wapper">
        <div class="slider"
             style="height: 440px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
            <ul class="slides" style="height: 400px;">
                <li class="active" style="opacity: 1;">
                    <a href="<%=basePath%>goods/homeGoods">
                        <div class="bannerimg">
                            <ul class="bannerul">
                                <p class="text1">Hello：</p>
                                <p class="text2">Welcome to Unipath</p>
                                <p class="text3">This section is for students</p>
                                <p class="text4">who would like to——<span>buy or sell</p>
                                <p class="text5">Their used products</p>
                                <p class="text6">Join Unipath, enjoy your life.</p>
                            </ul>
                            <!--   <div class="logoimg">
                                  <img src="../img/p_logo.jpg" />
                              </div> -->
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="index-title">
        <a href="">What's new</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}"/>
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>

<%--                        <div class="card-content item-name">--%>
<%--                            <p><c:out value="${item.pho}"></c:out></p>--%>
<%--                        </div>--%>
                        <div class="card-content item-location">
                            <p>${item.num}</p>
                            <p>${item.phone}</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">Electronics</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods1}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}"/>
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>${item.num}</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>




    <div class="index-title">
        <a href="">Text Books</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods4}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}"/>
                        </div>
                    <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>${item.num}</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">Clothes</a>
        <hr class="hr1">
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods8}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image">
                            <img src="<%=basePath%>upload/${item.images[0].imgUrl}"/>
                        </div>
                        <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                        <div class="card-content item-name">
                            <p><c:out value="${item.goods.name}"></c:out></p>
                        </div>
                        <div class="card-content item-location">
                            <p>${item.num}</p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>


</div>
</body>
</html>