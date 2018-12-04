<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--导航部分  begin-->


<div class="container" style="margin-top: 5px;">
	<nav class="navbar navbar-default well-sm" style="padding-left: 0px;"
		role="navigation">
		<div class="container-fluid">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${path}/book/index">在线书城</a>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav pull-left" id="navbarrr">
					<li><a href="${path}/book/index">首页</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 图书类型 <b class="caret"></b>
					</a> <input type="hidden" id="cat" value="${cat}">
						<ul class="dropdown-menu">
							<li><a href="javascript:changeCat(1)">精选图书</a></li>
							<li class="divider"></li>
							<li><a href="javascript:changeCat(2)">推荐图书</a></li>
							<li class="divider"></li>
							<li><a href="javascript:changeCat(3)">特价图书</a></li>
						</ul></li>
					<c:if test="${empty user}">
						<li><a href="javascript:openLogin()">登录</a></li>
						<li><a href="#" data-toggle="modal" data-target="#register">注册</a></li>
						<li><a href="javascript:openLogin()">我的订单</a></li>
						<li><a href="javascript:openLogin()"><span
								class="glyphicon glyphicon-shopping-cart"> </span>我的购物车</a></li>
					</c:if>
					<c:if test="${!empty user}">
						<li><a href="#">${user.userName}</a></li>
						<li><a href="${path}/user/logout">安全退出</a></li>
						<li><a href="${path}/permission/order/orderlist">我的订单</a></li>
						<li><a href="${path}/permission/cart/showcart"><span
								class="glyphicon glyphicon-shopping-cart"> </span>我的购物车</a></li>
					</c:if>


				</ul>
				<div class="input-group col-md-3 pull-right"
					style="positon: relative; padding: 7px;">
					<input type="text" class="form-control" placeholder="请输入图书名"
						id="keyWord" value="${keyWord}" /> <span class="input-group-btn">
						<button class="btn btn-info btn-search" onclick="sendParams(1)">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</div>
	</nav>
</div>
<!--导航部分 end-->

<!--最顶端轮播图片 begin-->
<div id="gcarouse" class="container">
	<!--轮播-->
	<div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<a href="details.html"><img src="${path}/images/advert1.jpg"
					class="pull-left" alt="First slide"></a>

			</div>
			<div class="item">
				<a href="details.html"><img src="${path}/images/advert2.jpg"
					class="pull-left" alt="First slide"></a>

			</div>
			<div class="item">
				<a href="details.html"><img src="${path}/images/advert3.jpg"
					class="pull-left" alt="First slide"></a>

			</div>
		</div>

		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
</div>
<!--最顶端轮播图片 end-->

<!-- 登录模态框（Modal） -->
<div class="modal fade" id="login" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">用户登录</h4>
			</div>
			<div class="modal-body">
				<!--登录的form表单-->
				<form class="form-horizontal" role="form" action="">
					<div class="form-group has-feedback">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-5">

							<input type="text" class="form-control" id="username"
								placeholder="请输入用户名"> <span
								class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="col-sm-3" style="padding-top: 10px;">
							<label class="alert-danger" id="unameinfo"></label>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="password"
								placeholder="请输入密码"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="col-sm-3" style="padding-top: 10px;">
							<label class="alert-danger" id="pwdinfo"></label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox" id="remmberme">请记住我
								</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input type="button" class="btn btn-primary" onclick="login()"
							value="登录">
					</div>
				</form>
				<!--form结束-->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
</div>
<!-- 登录modal end/.modal -->

<!-- 注册模态框 -->
<div class="modal fade" id="register" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">用户注册</h4>
			</div>
			<div class="modal-body">
				<!--注册的form表单-->
				<form action="${path}/user/register" method="post"
					class="form-horizontal" role="form"
					onsubmit="return doRegister('p')">
					<div class="form-group has-feedback">
						<label for="firstname" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="usernamer"
								name="username" placeholder="小写字母开头,不含中文."> <span
								class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="col-sm-5" style="padding-top: 10px;">
							<label class="alert-danger" id="labelu"></label>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="lastname" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-5">
							<input type="password" name="password" class="form-control"
								id="pwdr" placeholder="密码长度6-8位" minlength="6" maxlength="8">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="col-sm-5" style="padding-top: 10px;">
							<label class="alert-danger"></label>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="pwdr2"
								minlength="6" maxlength="8" placeholder="和密码保持一致"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="col-sm-5" style="padding-top: 10px;">
							<label class="alert-danger"></label>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-5">
							<input type="email" name="email" class="form-control" id="email"
								placeholder="合法邮箱格式"> <span
								class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
						<div class="col-sm-5" style="padding-top: 10px;">
							<label class="alert-danger"></label>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">电话</label>
						<div class="col-sm-5">
							<input type="tel" name="tel" class="form-control" id="tel"
								placeholder="合法手机格式"> <span
								class="glyphicon glyphicon-earphone form-control-feedback"></span>
						</div>
						<div class="col-sm-5" style="padding-top: 10px;">
							<label class="alert-danger"></label>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">公司</label>
						<div class="col-sm-5">
							<input type="text" name="company" class="form-control"
								id="company" placeholder="请输入公司地址"> <span
								class="glyphicon glyphicon-home form-control-feedback"></span>
						</div>
						<div class="col-sm-5" style="padding-top: 10px;">
							<label class="alert-danger"></label>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">地址</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="addr" id="addr"
								placeholder="请输入收货地址"> <span
								class="glyphicon glyphicon-home form-control-feedback"></span>
						</div>
						<div class="col-sm-5" style="padding-top: 10px;">
							<label class="alert-danger"></label>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input type="submit" class="btn btn-primary" value="注册">
					</div>
				</form>
				<!--form结束-->
			</div>
		</div>
	</div>
</div>
<!-- /.modal-content -->
<!--警告模态框（Modal） -->
<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title text-primary" id="myModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<span id="alarm" class="text-primary"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script type="text/javascript">
	function openLogin() {
		var user = document.getElementById("username");
		var pwd = document.getElementById("password");
		if ("${cookie.login.value}".trim().length > 0) {
			var arr = "${cookie.login.value}".split(":");
			user.value = decodeURI(arr[0]);
			pwd.value = arr[1];
		}
		$('#login').modal('show');
	}

	function login() {
		var userName = document.getElementById("username").value;
		var passWord = document.getElementById("password").value;
		var userInfo = document.getElementById("unameinfo");
		var pwdInfo = document.getElementById("pwdinfo");
		var rm = document.getElementById("remmberme");
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				if (str == "0") {
					userInfo.innerHTML = "用户名不存在！";
					pwdInfo.innerHTML = "";
				}
				if (str == "1") {
					userInfo.innerHTML = "";
					pwdInfo.innerHTML = "密码错误！";
				}
				if (str == "2") {
					window.location.href = "${path}/book/index";
				}
			}
		};
		xmlhttp.open("post", "${path}/user/login", true);

		xmlhttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("userName=" + userName + "&passWord=" + passWord + "&rm="
				+ rm.checked);
	}
</script>
<script type="text/javascript">
	var flag = false;
	var flag1 = false;
	doRegister();

	function checkData(obj, info, fun, param) {
		var label = obj.parentNode.nextElementSibling.children[0];
		obj.onfocus = function() {
			label.className = "text-info";
			this.parentNode.className = "col-sm-5";
		};
		obj.onblur = function() {
			if (fun(this.value)) {
				label.className = "text-success";
				this.parentNode.className = "col-sm-5 has-success";
				label.innerText = "√";
				return true;
			} else {
				label.className = "text-danger";
				this.parentNode.className = "col-sm-5  has-error";
				label.innerText = info;
				return false;
			}
		};
		if (param == "p") {
			obj.onblur();
		}
	}

	function doRegister(param) {

		var uname = document.getElementById("usernamer");
		var label = uname.parentNode.nextElementSibling.children[0];
		uname.onfocus = function() {
			label.className = "text-info";
			this.parentNode.className = "col-sm-5";
		};
		uname.onblur = function() {
			var reg = /^[a-z][a-zA-Z0-9]{5,7}$/;
			if (!reg.test(this.value)) {
				flag1 = false;
				label.className = "text-danger";
				this.parentNode.className = "col-sm-5  has-error";
				label.innerText = "×不是有效的格式";
				return;
			}

			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				var labelu = document.getElementById("labelu");
				var uname = document.getElementById("usernamer");
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var str = xmlhttp.responseText;
					if (str == "1") {
						labelu.className = "text-danger";
						uname.parentNode.className = "col-sm-5 has-error";
						label.innerText = "×用户名已存在";
						flag1 = false;
					} else {
						labelu.className = "text-success";
						uname.parentNode.className = "col-sm-5 has-success";
						label.innerText = "√";
						flag1 = true;
					}
				}
			};
			xmlhttp
					.open("get", "${path}/user/check?uname=" + uname.value,
							true);
			xmlhttp.send();

		};

		if (param == "p") {
			uname.onblur();
		}

		var pwd = document.getElementById("pwdr");
		checkData(pwd, "×密码6-12位，不能为纯数字", function(val) {
			var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$/;
			if (reg.test(val)) {
				flag = true;
				return true;
			} else {
				flag = false;
				return false;
			}
		}, param);

		var pwd2 = document.getElementById("pwdr2");
		checkData(pwd2, "×两次密码必须相同", function(val) {
			if (val == pwd.value && pwd.onblur()) {
				flag = true;
				return true;
			} else {
				flag = false;
				return false;
			}
		}, param);

		var email = document.getElementById("email");
		checkData(
				email,
				"×不是有效的邮箱格式",
				function(val) {
					var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
					if (reg.test(val)) {
						flag = true;
						return true;
					} else {
						flag = false;
						return false;
					}
				}, param);

		var tel = document.getElementById("tel");
		checkData(tel, "×不是有效的手机格式", function(val) {
			var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
			if (reg.test(val)) {
				flag = true;
				return true;
			} else {
				flag = false;
				return false;
			}
		}, param);

		var company = document.getElementById("company");
		checkData(company, "×长度必须大于0", function(val) {
			if (val.length > 0) {
				flag = true;
				return true;
			} else {
				flag = false;
				return false;
			}
		}, param);

		var addr = document.getElementById("addr");
		checkData(addr, "×长度必须大于0", function(val) {
			if (val.length > 0) {
				flag = true;
				return true;
			} else {
				flag = false;
				return false;
			}
		}, param);

		return flag && flag1;
	}

	function alarm() {
		var alarm = document.getElementById("alarm");
		alarm.innerText = "注册成功，请重新登录";
		$('#alarmModal').modal('show');
	}
	function alarm2() {
		var alarm = document.getElementById("alarm");
		alarm.innerText = "请先登录";
		$('#alarmModal').modal('show');
	}
</script>
<script type="text/javascript">
	function changeCat(cat) {
		var keyWord = document.getElementById("keyWord");
		var pageSize = document.getElementById("pageSize");
		var ps;
		if (pageSize == null) {
			ps = 4;
		} else {
			ps = pageSize.value;
		}
		window.location.href = "${path}/book/list?keyWord=" + keyWord.value
				+ "&cat=" + cat + "&pageSize=" + ps + "&pageNow=1";
	}

	function sendParams(str) {

		var keyWord = document.getElementById("keyWord");
		var category = document.getElementById("cat");
		var cat = null;
		if (category != null) {
			switch (category.value) {
			case "精选图书":
				cat = 1;
				break;
			case "推荐图书":
				cat = 2;
				break;
			case "特价图书":
				cat = 3;
				break;

			default:
				break;
			}
		}

		var pageSize = document.getElementById("pageSize");
		var ps = 2;
		if (pageSize != null) {
			ps = pageSize.value;
		}
		window.location.href = "${path}/book/list?keyWord=" + keyWord.value
				+ "&cat=" + cat + "&pageSize=" + ps + "&pageNow=" + str;
	}
</script>

