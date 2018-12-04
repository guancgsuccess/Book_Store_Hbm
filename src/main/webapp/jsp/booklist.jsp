<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书列表</title>
<link type="text/css" rel="stylesheet"
	href="${path}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/animate.css" />

</head>
<body>
	<%@ include file="common/navbar.jsp"%>

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="#">图书列表</a></li>
			<li><a href="#">${cat}</a></li>
		</ol>
	</div>

	<!--图书列表 begin-->
	<div class="container">
		<div class="row">
			<c:forEach items="${page.list}" var="b">
				<div class="col-sm-6 col-md-3 wow fadeInRight animated">
					<div class="thumbnail">
						<a href="${path}/book/details?id=${b.bookId}"><img
							src="${path}/images/${b.images[0].url}" alt="通用的占位符缩略图"></a>
						<div class="caption">
							<h4>${b.name}</h4>
							<p>价格:${b.newPrice}元&nbsp;&nbsp;作者:${b.author}&nbsp;&nbsp;</p>
							<p>
								<a href="${path}/book/details?id=${b.bookId}"> 更多信息 </a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!--图书列表end-->

	<!--分页begin-->
	<%@include file="common/pages.jsp"%>
	<!--分页end-->

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

</body>
</html>