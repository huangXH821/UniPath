<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Orders</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />

    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

    <script type="text/javascript">

        $("#buy").click(function(){
            window.location.href="/orders/myOrders?currentPage=1&pageNum=3&type=buy";
        });

        $("#sell").click(function(){
            window.location.href="/orders/myOrders?currentPage=1&pageNum=3&type=sell";
        });

        function ordersDeliver(orderNum){

            location.href ='<%=basePath%>orders/deliver/'+orderNum

            alert("Product is out for delivery")
        }

        function ordersReceipt(orderNum,orderPrice,goodsId){
            location.href ='<%=basePath%>orders/receipt?orderNum='+orderNum+'&orderPrice='+orderPrice+'&goodsId='+goodsId;

            alert("Receive successful!")
        }


    </script>

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
        </div>
        <!--

            描述：左侧个人中心栏
        -->
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
                <%--               <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%;background-color: rgb(79, 190, 246); color:rgba(255, 255, 255, 1);margin-top:0.5cm;">我的信用积分：${cur_user.power}</span>--%>

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
                            <span>My List</span>
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

            <div class="share">


                <h1 style="text-align: center">Orders</h1>
                <hr />
                <div class="share_content">
                    <c:if test="${empty orders and empty ordersOfSell}">
                        <div class="no_share">
<%--                            <span>Nothing</span>--%>
                        </div>
                    </c:if>

                    <div class="story">

                        <div class="container">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist" style="width: 46%">
                                <!-- <li class="nav-item"><a class="nav-link active"
                                    data-toggle="tab" href="#home">全部订单</a></li> -->
                                <li class="nav-item <c:if test="${param.type=='buy' or empty param.type}">active</c:if>" id="buy"><a class="nav-link active" data-toggle="tab"
                                                                                                                                     href="/orders/myOrders?currentPage=1&pageNum=3&type=buy#orders_my" >Purchase History</a></li>
                                <li class="nav-item <c:if test="${param.type=='sell'}">active</c:if>" id="sell"><a class="nav-link" data-toggle="tab"
                                                                                                                   href="/orders/myOrders?currentPage=1&pageNum=3&type=sell#orders_other" >Sold history</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content" style="width: 46%">
                                <!-- <div id="home" class="container tab-pane active"
                                    style="width: 100%">
                                    <br>
                                    <from>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                        elit, sed do eiusmod tempor incididunt ut labore et dolore
                                        magna aliqua.</p>
                                    </from>
                                </div> -->
                                <!-- 买家订单中心 -->
                                <div id="orders_my" class='container tab-pane <c:if test="${param.type=='buy' or empty param.type}">active in</c:if>'
                                     style="width: 100%">
                                    <br>
                                    <form class="form-horizontal" role="form">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                </tr>
                                                <tr>
                                                    <th >Order num</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Address</th>
                                                    <th>Status</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="items" items="${pageOrdersInfo.data}">
                                                    <tr>
                                                        <td>${items.orderNum}</td>
                                                        <td>${items.goods.name}</td>
                                                        <td>${items.goods.price}</td>
                                                        <td>${items.orderInformation}</td>
                                                        <td>
                                                            <c:if test="${items.orderState==1}"><input type="button" value="Waiting" class="btn btn-info"/></c:if>
                                                            <c:if test="${items.orderState==2}"><input type="button" value="Arrived" onclick="ordersReceipt(${items.orderNum},${items.orderPrice},${items.goods.id})" class="btn btn-info"/></c:if>
                                                            <c:if test="${items.orderState==3}"><input type="button" value="Completed" class="btn btn-info"/></c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <td><a href="/orders/myOrders?currentPage=1&pageNum=3&type=buy">First</a> </td>
                                                    <c:if test="${pageOrdersInfo.currentPage>1}">
                                                        <td><a href="/orders/myOrders?currentPage=${pageOrdersInfo.currentPage-1}&pageNum=3&type=buy">prev</a> </td>
                                                    </c:if>
                                                    <c:if test="${pageOrdersInfo.currentPage<pageOrdersInfo.lastPage}">
                                                        <td><a href="/orders/myOrders?currentPage=${pageOrdersInfo.currentPage+1}&pageNum=3&type=buy">next</a> </td>
                                                    </c:if>
                                                    <td><a href="/orders/myOrders?currentPage=${pageOrdersInfo.lastPage}&pageNum=3&type=buy">Last</a> </td>
                                                </tr>
                                                </tbody>
                                            </table>

                                        </div>

                                    </form>
                                </div>
                                <%--									卖--%>
                                <%--		<div id="orders_other" class='container tab-pane <c:if test="${param.type=='sell'}">active</c:if>
                                    <c:if test="${param.type!='sell'}">fade</c:if>'--%>
                                <div id="orders_other" class='container tab-pane fade <c:if test="${param.type=='sell'}">active in</c:if>'
                                     style="width: 100%">
                                    <br>
                                    <form class="form-horizontal" role="form">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                </tr>
                                                <tr class="text-center">
                                                    <th>Order num</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Address</th>
                                                    <th>Status</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="items" items="${sellPageOrdersInfo.data}">
                                                    <tr>
                                                        <td>${items.orderNum}</td>
                                                        <td>
                                                                ${items.goods.name}
                                                        </td>
                                                        <td>${items.goods.price}</td>
                                                        <td>${items.orderInformation}</td>
                                                        <td>

                                                            <c:if test="${items.orderState==1}"><input type="button" value="Ship" onclick="ordersDeliver(${items.orderNum})" class="btn btn-info"/></c:if>
                                                            <c:if test="${items.orderState==2}"><input type="button" value="Shipping"  class="btn btn-info"/></c:if>
                                                            <c:if test="${items.orderState==3}"><input type="button" value="Completed" class="btn btn-info"/></c:if>


                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <td><a href="/orders/myOrders?currentPage=1&pageNum=3&type=sell">First</a> </td>
                                                    <c:if test="${sellPageOrdersInfo.currentPage>1}">
                                                        <td><a href="/orders/myOrders?currentPage=${sellPageOrdersInfo.currentPage-1}&pageNum=3&type=sell">prev</a> </td>
                                                    </c:if>
                                                    <c:if test="${sellPageOrdersInfo.currentPage<sellPageOrdersInfo.lastPage}">
                                                        <td><a href="/orders/myOrders?currentPage=${sellPageOrdersInfo.currentPage+1}&pageNum=3&type=sell">next</a> </td>
                                                    </c:if>
                                                    <td><a href="/orders/myOrders?currentPage=${sellPageOrdersInfo.lastPage}&pageNum=3&type=sell">Last</a> </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    $("#buy").click(function(){
        window.location.href="/orders/myOrders?currentPage=1&pageNum=3&type=buy";
    });

    $("#sell").click(function(){
        window.location.href="/orders/myOrders?currentPage=1&pageNum=3&type=sell";
    });
</script>
</html>