<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在线书城首页</title>
<link type="text/css" rel="stylesheet"
	href="${path}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/animate.css" />
</head>

<c:if test="${alarm=='1'}">
<body onload="alarm()">
</c:if>
<c:if test="${alarm!='1'}">
<body>
</c:if>
	<%@ include file="common/navbar.jsp"%>
	<!--图书内容部分 begin-->
	<div class="container">
		<!--精选图书 begin-->
		<div>
			<div class="text-primary">
				<img src="${path}/images/bullet1.gif" alt="" title=""> <a
					href="javascript:changeCat(1)">精选图书</a>
			</div>
			<div class="row">
				<div id="outer1">
					<c:forEach items="${page1.list}" var="b">
						<div class="col-sm-6 col-md-3 wow fadeInRight animated">
							<div class="thumbnail">
								<a href="${path}/book/details?id=${b.bookId}"><img
									src="${path}/images/${b.images[0].url}" alt="通用的占位符缩略图"></a>
								<div class="caption">
									<h4>${b.name}</h4>
									<p>价格:${b.newPrice }元&nbsp;&nbsp;作者:${b.author}&nbsp;&nbsp;</p>
									<p>
										<a href="${path}/book/details?id=${b.bookId}"> 更多信息 </a>
									</p>
									
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</div>
				<!--分页-->
				<div class="row">
				<div class="container">
					<ul class="pager">
						<li><a href="javascript:switchPage(1,false)">&larr;上一页</a> 
						<a href="javascript:switchPage(1,true)">下一页 &rarr;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--精选图书 end-->

		<!--推荐图书 begin-->
		<div>
			<div class="text-primary">
				<img src="${path}/images/bullet1.gif" alt="" title=""> <a
					href="javascript:changeCat(2)">推荐图书</a>
			</div>
			<div class="row">
				<div id="outer2">
					<c:forEach items="${page2.list}" var="b">
						<div class="col-sm-6 col-md-3 wow fadeInRight animated">
							<div class="thumbnail">
								<a href="${path}/book/details?id=${b.bookId}"><img
									src="${path}/images/${b.images[0].url}" alt="通用的占位符缩略图"></a>
								<div class="caption">
									<h4>${b.name}</h4>
									<p>价格:${b.newPrice }元&nbsp;&nbsp;作者:${b.author}&nbsp;&nbsp;</p>
									<p>
										<a href="${path}/book/details?id=${b.bookId}"> 更多信息 </a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</div>
				<!--分页-->
				<div class="row">
				<div class="container">
					<ul class="pager">
						<li><a href="javascript:switchPage(2,false)">&larr;上一页</a> 
						<a href="javascript:switchPage(2,true)">下一页 &rarr;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--推荐图书end..-->

		<!--特价图书 begin-->
		<div>
			<div class="text-primary">
				<img src="${path}/images/bullet1.gif" alt="" title=""> <a
					href="javascript:changeCat(3)">特价图书</a>
			</div>
			<div class="row">
				<div id="outer3">
					<c:forEach items="${page3.list}" var="b">
						<div class="col-sm-6 col-md-3 wow fadeInRight animated">
							<div class="thumbnail">
								<a href="${path}/book/details?id=${b.bookId}"><img
									src="${path}/images/${b.images[0].url}" alt="通用的占位符缩略图"></a>
								<div class="caption">
									<h4>${b.name}</h4>
									<p>价格:${b.newPrice }元&nbsp;&nbsp;作者:${b.author}&nbsp;&nbsp;</p>
									<p>
										<a href="${path}/book/details?id=${b.bookId}"> 更多信息 </a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</div>
				<!--分页-->
				<div class="row">
				<div class="container">
					<ul class="pager">
						<li><a href="javascript:switchPage(3,false)">&larr;上一页</a> 
						<a href="javascript:switchPage(3,true)">下一页 &rarr;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--特价图书 end-->
		<hr>

		<%@include file="common/footer.jsp"%>

	</div>
	<!--图书内容部分end-->
	
	<%session.setAttribute("alarm", "0"); %>

	<script type="text/javascript">

		var arr=new Array(1,1,1);

		function switchPage(obj,flag) {
			var c;
			switch (obj) {
			case 1:
				c = ${page1.pageCount};
				break;
			case 2:
				c = ${page2.pageCount};
				break;
			case 3:
				c = ${page3.pageCount};
				break;
			default:
				break;
			}
			
			var c = ${page1.pageCount};
			var xmlhttp = new XMLHttpRequest();
			var div=document.getElementById("outer"+obj);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var books = JSON.parse(xmlhttp.responseText);
					var str = "";
					for (var i = 0; i < books.length; i++) {
						str += "<div class='col-sm-6 col-md-3 wow fadeInRight animated'>";
						str += "<div class='thumbnail'>";
						str += "<a href='${path}/book/details?id="+books[i].bookId+"'><img src='${path}/images/"+books[i].images[0].url+"' alt='通用的占位符缩略图'></a>";
						str += "<div class='caption'>";
						str += "<h4>" + books[i].name + "</h4>";
						str += "<p>价格:" + books[i].newPrice
								+ "元&nbsp;&nbsp;作者:" + books[i].author
								+ "&nbsp;&nbsp;</p>";
						str += "<p><a href='${path}/book/details?id="+books[i].bookId+"'> 更多信息 </a></p></div></div></div>";
						div.innerHTML=str;

					}
				}
			};

			var alarm=document.getElementById("alarm");
			for (var i = 0; i < arr.length; i++) {
				if ((i+1)==obj) {
					if (flag) {
						if (arr[i] < c) {
							arr[i]++;
						} else {
							arr[i] = c;
							alarm.innerText="已到达最后一页";
							$('#alarmModal').modal('show');
							return;
						}
					}else{
						if (arr[i] > 1) {
							arr[i]--;
						} else {
							arr[i] = 1;
							alarm.innerText="已到达第一页";
							$('#alarmModal').modal('show');
							return;
						}
					}
				}

			}

			xmlhttp.open("get", "${path}/book/page?cat=" + obj + "&pageNow="
					+ arr[obj-1], true);

			xmlhttp.send();

		}
	</script>

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
		cover();
		function cover() {
			var navbarrr = document.getElementById("navbarrr");
			var lis = navbarrr.children;
			lis[0].className = "active";
		}
	</script>
</body>
</html>