<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书详情</title>
<link type="text/css" rel="stylesheet"
	href="${path}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/animate.css" />
</head>

<body>
	<%@ include file="common/navbar.jsp"%>
	<div class="container">
		<!--左边-->
		<div class="col-md-8 col-sm-12">
			<ol class="breadcrumb">
				<li><a href="#">图书详情</a></li>
				<li><a href="#">${book.name}</a></li>
			</ol>

			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="thumbnail">
						<a><img src="${path}/images/${book.images[0].url}"
							style="height: 200px;" alt="通用的占位符缩略图"></a>
						<div class="caption">
							<h3>${book.name}</h3>
							<p>
								双十一特价,包邮哟!亲<img src="${path}/images/3.gif"
									style="width: 24px; height: 24px;">
							</p>
							<p>
							<div style="margin-bottom: 5px; width: 100px;">
								<input type="number" class="form-control" placeholder="购买数量"
									min="1" max="100" value="1" id="addNum">
							</div>
							<div style="clear: both;">
								<!--<input type="number" class="form-control" placeholder="请输入" min="1" max="100" onclick="selectByCount(this)">-->
								<a href="confirm_order.html" class="btn btn-default"
									role="button"> <span class="glyphicon glyphicon-usd"></span>
									立即购买
								</a>
								<c:if test="${empty user}">
									<a href="javascript:alarm2()" class="btn btn-default"
										role="button"> <span
										class="glyphicon glyphicon-shopping-cart"></span> 加入购物车
									</a>
								</c:if>
								<c:if test="${!empty user}">
									<input type="hidden" value="${book.bookId}" id="hid">
									<a href="javascript:addCart()" class="btn btn-default"
										role="button"> <span
										class="glyphicon glyphicon-shopping-cart"></span> 加入购物车
									</a>
								</c:if>
							</div>
							</p>
						</div>
					</div>
				</div>

				<div class="col-sm-12 col-md-6">
					<div class="thumbnail">
						<ul class="list-group">
							<li class="list-group-item"><span class="text-success">图书名称:${book.name}</span></li>
							<li class="list-group-item"><span class="text-info">作者:</span>${book.author}</li>
							<li class="list-group-item"><span class="text-info">出版日期:${book.publish_date}</span></li>
							<li class="list-group-item"><span class="text-info">出版社:</span>${book.publisher}</li>
							<li class="list-group-item"><span class="text-info"
								style="text-decoration: line-through;">原价:</span><span
								style="text-decoration: line-through;">$${book.oldPrice}元</span></li>
							<li class="list-group-item"><span class="text-info">现价:</span>$${book.newPrice}元</li>
							<li class="list-group-item"><span class="text-info">说明:</span>${book.info}</li>
						</ul>
					</div>
				</div>
			</div>
			<!--<hr>-->
			<!--折叠部分 begin-->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo"> 展开详细信息 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<!--tab选项卡 begin-->
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab">
									商品详情 </a></li>
							<li><a href="#ios" data-toggle="tab"> <span
									class="badge pull-right">50</span>累计评价
							</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home">
								<p>
									<em>产品参数：</em>
								</p>
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<ul class="nav navbar-collapse" style="line-height: 3;">
											<li class="text-info">产品名称：${book.name}</li>
											<li class="text-info">是否是套装: ${book.suit}</li>
											<li class="text-info">书名:${book.name}</li>
											<li class="text-info">定价: ${book.oldPrice}元</li>
											<li class="text-info">出版社名称: ${book.publisher}</li>
											<li class="text-info">出版时间: ${book.publish_date}</li>
											<li class="text-info">作者: ${book.author}</li>
											<li class="text-info">作者地区: ${book.author_loc}</li>
											<li class="text-info">ISBN编号: ${book.isbn}</li>
										</ul>
									</div>
									<span class="visible-sm visible-xs"></span>
									<hr>

								</div>
								</p>
							</div>
							<div class="tab-pane fade" id="ios">
								<p>
								<ul class="list-group">
									<li class="list-group-item"><span class="text-info">小明:</span><span
										class="text-success ">这真的是一本好书<img
											src="${path}/images/emotions/1.gif "></span></li>
									<li class="list-group-item"><span class="text-info">success:</span><span
										class="text-danger ">书的质量很差<img
											src="${path}/images/emotions/2.gif "></span></li>
									<li class="list-group-item"><span class="text-info">叶老师:</span><span
										class="text-success ">很值得初学者学习<img
											src="${path}/images/emotions/13.gif "></span></li>
									<li class="list-group-item"><span class="text-info">amdin:</span><span
										class="text-danger ">被坑大发了.<img
											src="${path}/images/emotions/17.gif "></span></li>
									<li class="list-group-item"><span class="text-info">rose:</span><span
										class="text-danger ">卖家态度恶劣.<img
											src="${path}/images/emotions/11.gif "></span></li>
								</ul>
								</p>
								<p>
								<ul class="pager">
									<li><a href="# ">&larr;上一页</a> <a href="# ">下一页 &rarr;</a>
									</li>
								</ul>
								</p>
							</div>
						</div>
						<!--tab选项卡 end-->
					</div>
				</div>
			</div>
			<!--折叠部分end-->
		</div>

		<%@include file="common/sidebar.jsp"%>
	</div>

	<%@include file="common/footer.jsp"%>


	<script src="${path}/dist/js/jquery.min.js"></script>
	<script src="${path}/js/carousel.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${path}/dist/js/bootstrap.min.js"></script>
	<script src="${path}/js/wow.js"></script>
	<script type="text/javascript">
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};
	</script>
	<script type="text/javascript">
		function addCart() {
			var addNum = document.getElementById("addNum");
			var hid = document.getElementById("hid");
			var xmlhttp=new XMLHttpRequest();
			
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState==4&&xmlhttp.status==200) {
					var carttag=document.getElementById("carttag");
					var text=xmlhttp.responseText;
					var arr=text.split(":");
					var str="<li><a href='${path}/permission/cart/showcart' class='text-success '>";
					str+="<span class='glyphicon glyphicon-shopping-cart '></span>我的购物车</a></li>";
					str+="<li><a href='# '>"+arr[0]+"个商品</a></li>";
					str+="<li><a href='# '>总价￥"+arr[1]+"元</a></li>";
					carttag.innerHTML=str;
					alarm3();
				}	
			};
			
			xmlhttp.open("get", "${path}/permission/cart/addCartAjax?id="+hid.value+"&num="+addNum.value, true);
			
			xmlhttp.send();
		}
		
		function alarm3(){
				var alarm = document.getElementById("alarm");
				alarm.innerText = "添加成功";
				$('#alarmModal').modal('show');
		}
	</script>
</body>
</html>