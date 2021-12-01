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
<title>My Purse</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />
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
		<img
			src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif"
			class="jcrop-preview jcrop_preview_s">
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

			<div id="user_nav">
				<div class="user_info">
					<div class="head_img">
						<img src="<%=basePath%>img/photo.jpg">
					</div>
					<div class="big_headimg">
						<img src="">
					</div>
					<span class="name">${cur_user.username}</span>
					<hr>

				   <a class="btn" style="width: 98%;background-color: rgb(79, 190, 246);color:rgba(255, 255, 255, 1);" href="<%=basePath%>user/myPurse">My Purse：￥${myPurse.balance}</a>
                <input type="hidden" value="${myPurse.recharge}" id="recharge"/>
                <input type="hidden" value="${myPurse.withdrawals}" id="withdrawals"/>
<%--               <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%; background-color: rgb(79, 190, 246); color: rgba(255, 255, 255, 1); margin-top: 0.5cm;">我的信用积分：${cur_user.power}</span>--%>

				</div>
				<div class="home_nav">
					<ul>
						<a href="<%=basePath%>orders/myOrders">
							<li class="notice">
								<div></div> <span>Orders</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/allFocus">
							<li class="fri">
								<div></div> <span>My List</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>goods/publishGoods">
							<li class="store">
								<div></div> <span>Upload</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/allGoods">
							<li class="second">
								<div></div> <span>My Items</span> <strong></strong>
						</li>
						</a>
						<a href="<%=basePath%>user/basic">
							<li class="set">
								<div></div> <span>Settings</span> <strong></strong>
						</li>
						</a>
					</ul>
				</div>
			</div>

			<div id="user_content">

				<div class="share">


					<h1 style="text-align: center">My Purse</h1>
					<hr />
					<div class="share_content">
						<div class="story">
							<form id="myUpAndDwon" class="form-horizontal" role="form" action="<%=basePath%>user/updatePurse" >
								<div class="form-group">
<%--									<div class="col-sm-12">--%>
<%--                							<img  src="<%=basePath%>img/mypurse.jpg" />--%>
<%--									</div>--%>
									<label for="firstname" class="col-sm-2 control-label">balance：</label>
									<div class="col-sm-10">
										<input type="text" name="balance" class="form-control" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.balance}" >
									</div>
									<label for="firstname" class="col-sm-2 control-label" >Recharge：</label>
									<div class="col-sm-10">
										<input name="recharge" type="number" class="form-control recharge" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.recharge}" data-toggle="tooltip"  title="请输入整数金额！"/>
									<%-- value="${myPurse.recharge}"  value="${myPurse.withdrawals}"--%>
									</div>
									<label for="firstname" class="col-sm-2 control-label" >Withdraw：</label>
									<div class="col-sm-10">
										<input name="withdrawals" type="number" class="form-control withdrawals" style="border:0px;background:rgba(0, 0, 0, 0); " value="${myPurse.withdrawals}" data-toggle="tooltip"  title="请输入整数金额！"/>
								
									</div>
								</div>
								<hr />
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
									  <%--   <a href="<%=basePath%>goods/goodsId/${goodsExtend.goods.id}" class="btn btn-danger">取消支付</a>
										<c:if test="${cur_user.money >= goodsExtend.goods.price}"><button type="submit" class="btn btn-info">立即支付</button></c:if>
										<c:if test="${cur_user.money < goodsExtend.goods.price}"><button disabled="disabled" class="btn btn-danger">余额不足，请充值！</button></c:if>
										 --%>
										 <c:if test="${myPurse.state==null}">
										 <a  onclick="upAnddown(1)" class="btn btn-danger">Recharge</a>
										 <a  onclick="upAnddown(2)" class="btn btn-danger">Withdraw</a>
										 </c:if>
										 
										 <c:if test="${myPurse.state==0}">
										 <c:if test="${myPurse.recharge!=null}">
										 <a   class="btn btn-danger">Withdrawing！</a>
										 </c:if>
										 <c:if test="${myPurse.withdrawals!=null}">
										 <a   class="btn btn-danger">Recharging！</a>
										 </c:if>
										 </c:if>
										 
										  <c:if test="${myPurse.state==1 or myPurse.state==2}">
										 <a   class="btn btn-danger btn_mypurse">Check result！</a>
										 </c:if>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">
$(".btn_mypurse").on('click',function(){
		
		if(1${myPurse.state}!=1){
			var state=1${myPurse.state}
			/* 	var recharge=${myPurse.recharge};
				var withdrawals=${myPurse.withdrawals}; */
				if(state==10){
					alert("Application is still pending！")
				}
				if(state==11){
					alert("Application failed！")
				}
				if(state==12){
					alert("Succeeded~")
				}
				if(state==11||state==12){
					/*ajax 修改数据库state==null */
					var id=${myPurse.id};
					$.ajax({
						url:'<%=basePath%>admin/updatePurseState',
						type:'GET',
						data:{id:id},
						dataType:'json'
						});
						location.reload();
					}
		}
	});
</script>
<script type="text/javascript">

	function upAnddown(num){
		var reg=/^[1-9]\d*$|^0$/;  
		if(num==1){
			var Recharge=$(" input[ name='recharge' ] ").val();
			if(Recharge==null || Recharge==""){
				alert("Enter the number！")
			}else if(reg.test(Recharge)!=true){
				alert("Wrong format！")
			}else{
				$(".withdrawals").val("");
				//提交表单
		        $("#myUpAndDwon").submit();
				alert("Recharging")
			}
			
		}
		if(num==2){
			var withdrawals=$(" input[ name='withdrawals' ] ").val();
			if(withdrawals==null || withdrawals==""){
				alert("Enter the number！")
			}else if(reg.test(withdrawals)!=true){
				alert("Wrong format！")
			}else if(withdrawals>${myPurse.balance}){
				alert("Number is too large！")
			}else{
			$(".Recharge").val("");
			//提交表单
	        $("#myUpAndDwon").submit();
	        alert("Withdrawing")
			}
		}
	
	}
</script>
</html>