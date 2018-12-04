<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<ul class="pagination">
		<li><a href="javascript:sendParams(1)">首页</a></li>
		<c:if test="${page.pageNow>1}">
			<li><a href="javascript:sendParams(${page.pageNow-1})">&laquo;</a></li>
		</c:if>
		<c:if test="${page.pageNow+3<page.pageCount}">
			<c:set value="${page.pageNow}" var="pagebegin"></c:set>
			<c:set value="${page.pageNow+3}" var="pageend"></c:set>
		</c:if>
		<c:if test="${page.pageNow+3>=page.pageCount}">
			<c:set value="${page.pageCount-3}" var="pagebegin"></c:set>
			<c:set value="${page.pageCount}" var="pageend"></c:set>
		</c:if>
		<c:if test="${3>=page.pageCount}">
			<c:set value="1" var="pagebegin"></c:set>
			<c:set value="${page.pageCount}" var="pageend"></c:set>
		</c:if>
		<c:forEach begin="${pagebegin}" end="${pageend}" step="1" var="p">
			<li <c:if test="${page.pageNow==p}">class="active"</c:if>><a
				href="javascript:sendParams(${p})">${p}</a></li>
		</c:forEach>

		<c:if test="${page.pageNow<page.pageCount}">
			<li><a href="javascript:sendParams(${page.pageNow+1})">&raquo;</a></li>
		</c:if>
		<li><a href="javascript:sendParams(${page.pageCount})">尾页</a></li>
		<li><a href="#">当前页${page.pageNow}/${page.pageCount}总页</a></li>
		<li><div
				style="padding: 0px; border: 0px; margin-left: 40px; margin-right: 40px"
				class="col-xs-3 col-sm-2 col-md-2">
				<form class="bs-example bs-example-form" role="form">
					<div class="row">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="跳转页" id="jumpPage">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button"
									onclick="checkInput()">Go!</button>
							</span>
						</div>
					</div>
				</form>
			</div></li>

		<li><a style="padding: 0px; border: 0px"> <span>每页显示</span> <select
				class="form-control" style="width: 70px; display: inline"
				id="pageSize" onchange="sendParams(1)">
					<option <c:if test="${page.pageSize==2}">selected</c:if> value="2">2</option>
					<option <c:if test="${page.pageSize==4}">selected</c:if> value="4">4</option>
					<option <c:if test="${page.pageSize==6}">selected</c:if> value="6">6</option>
					<option <c:if test="${page.pageSize==8}">selected</c:if> value="8">8</option>
					<option <c:if test="${page.pageSize==10}">selected</c:if> value="10">10</option>
					<option <c:if test="${page.pageSize==12}">selected</c:if> value="12">12</option>
			</select> <span>条</span>
		</a></li>
	</ul>
</div>

	<script type="text/javascript">
		function checkInput() {
			var jump = document.getElementById("jumpPage");
			var reg = /^[0-9]+$/;
			var count = ${page.pageCount};
			if (reg.test(jump.value) && jump.value != 0 && jump.value <= count) {
				sendParams(jump.value);
			} else {
				jump.parentNode.className = "input-group has-error";
				return;
			}
		}
	</script>
	
	