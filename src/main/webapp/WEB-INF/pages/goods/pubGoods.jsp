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
    <title>Upload</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
   <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- 图片上传即使预览插件 -->
    <link rel="stylesheet" href="<%=basePath%>css/fileinput.min.css">
    <script type="text/javascript" src="<%=basePath%>js/fileinput.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/zh.js"></script>

    <style>
        .container{padding-top:10px}
    </style>
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
<%--            <a href="<%=basePath%>user/home">--%>
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

                 <a class="btn" style="width: 98%;background-color: rgb(79, 190, 246);color:rgba(255, 255, 255, 1);" href="<%=basePath%>user/myPurse">My purse：$${myPurse.balance}</a>
                <input type="hidden" value="${myPurse.recharge}" id="recharge"/>
                <input type="hidden" value="${myPurse.withdrawals}" id="withdrawals"/>
<%--               <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%;background-color: rgb(79, 190, 246); color:rgba(255, 255, 255, 1);margin-top:0.5cm;">My credits：${cur_user.power}</span>--%>

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
                <form:form action="../goods/publishGoodsSubmit" method="post" role="form" enctype="multipart/form-data">
                    <h1 style="margin-left: 210px;">Upload</h1><hr />
                    <div class="changeinfo">
                        <span>Item name：</span>
                        <input class="in_info" type="text" name="name" placeholder="Item name"/>
                        <span>(*required)</span>
                    </div>
                    <div class="changeinfo">
                        <span>Price：</span>
                        <input class="in_info" type="text" name="price" placeholder="Price"/>
                        <span>(*required)</span>
                    </div>
                    <div class="changeinfo">
                        <span>Original Price：</span>
                        <input class="in_info" type="text" name="realPrice" placeholder="Original price"/>
                        <span id="checkphone">(*Optional)</span>
                    </div>
                    <div class="changeinfo">
                        <span>Item Category：</span>
                        <select class="in_info" name="catelogId">
                            <option value="1">Electronics</option>


                            <option value="4">Text Books</option>
                            <option value="8">Clothes</option>


                        </select>
                    </div>
                    <div class="changeinfo" id="dir">
                        <span>Description：</span>
                        <div class="sha">
                            <div class="publ">
                                <div class="pub_con">
                                    <div class="text_pu">
                                        <textarea name="describle" class="emoji-wysiwyg-editor"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <hr />
                    <div class="changeinfo">
                        <input id='img' type="file" style="margin-left:70px" accept="image/*" name="myfile" />
                    </div>
                    <input type="submit" class="setting-save" value="Upload" style="margin-top: 20px;background-color: blue;"/>
                </form:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>