<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Setting</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
     <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<body>
<div class="pre-2" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods" class="logo">
                <%--				<em class="em1"></em>--%>
                <em class="em2">Unipath</em>
                <em class="em3"></em>
            </a>
<%--            <a href="<%=basePath%>goods/homeGoods">--%>
<%--                <h1 class="logo"></h1>--%>
<%--            </a>--%>
<%--            <a href="<%=basePath%>goods/homeGoods">--%>
<%--                 <img src="<%=basePath%>img/home_header.png"  style="margin-left: 20px;" >--%>
<%--            </a>--%>
<%--            <a href="<%=basePath%>user/home">--%>
<%--                <div class="home"></div>--%>
<%--            </a>--%>
        </div>

        <div id="user_nav">
            <div class="user_info">
                <div class="head_img">
                    <img src="<%=basePath%>img/photo.jpg">
                </div>
                <div class="big_headimg">
                    <img src="">
                </div>
                <span class="name">${cur_user.username}</span><hr>

                  <a class="btn" style="width: 98%;background-color: rgb(79, 190, 246);color:rgba(255, 255, 255, 1);" href="<%=basePath%>user/myPurse">My Purse：$${myPurse.balance}</a>
                <input type="hidden" value="${myPurse.recharge}" id="recharge"/>
                <input type="hidden" value="${myPurse.withdrawals}" id="withdrawals"/>
<%--                <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%;background-color: rgb(79, 190, 246); color:rgba(255, 255, 255, 1);margin-top:0.5cm;">我的信用积分：${cur_user.power}</span>--%>
                
            </div>
            <div class="home_nav">
                <ul>
                    <a href="<%=basePath%>orders/myOrders">
                        <li class="notice">
                            <div></div>
                            <span>Orders</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allFocus">
                        <li class="fri">
                            <div></div>
                            <span>My list</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>goods/publishGoods">
                        <li class="store">
                            <div></div>
                            <span>Upload</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allGoods">
                        <li class="second">
                            <div></div>
                            <span>My Items</span>
                            <strong></strong>
                        </li>
                    </a>
                     <a href="<%=basePath%>user/basic">
                        <li class="set">
                            <div></div>
                            <span>Settings</span>
                            <strong></strong>
                        </li>
                    </a>
                </ul>
            </div>
        </div>

        <div id="user_content">
            <div class="basic">
                <form:form action="../user/updateInfo" method="post" commandName="user" role="form">
                    <h1>Modify personal info</h1><hr />
                    <div class="changeinfo">
                        <span>Username：</span>
                        <input class="in_info" type="text" name="username" placeholder="Enter username" value="${cur_user.username}"/>
                    </div><hr />
                    <div class="changeinfo">
                        <span>Created at：</span>
                        <input class="in_info" type="text" name="createAt" value="${cur_user.createAt}" readonly="true"/>
                    </div><hr />
                    <div class="changeinfo">
                        <span>phone number：</span>
                        <input class="in_info" type="text" name="phone" value="${cur_user.phone}" readonly="true"/>
<%--                        <span id="checkphone">已验证</span>--%>
                    </div><hr />
<%--                    <div class="changeinfo">--%>
<%--                        <span>QQ：</span>--%>
<%--                        <input class="in_info" type="text" name="qq" placeholder="请输入QQ" value="${cur_user.qq}"/>--%>
<%--                    </div>--%>
                    <input type="submit" class="setting-save" value="Save" />
                </form:form>
            </div>

        </div>
    </div>
</div>

</body>
</html>