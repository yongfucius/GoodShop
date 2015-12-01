<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.find{
	width: 750px;
	margin: 50px auto;
}

.find_table{
	width: 750px;
	border-spacing: 5px;
}
.find_table th{
	height: 30px;
}
.find_table td{
	border: 1px solid black;
}

.find_img{
	width: 100px;
	max-height: 100%;
}

.find_x{
	width: 35px;
	cursor: pointer;
}

</style>
<div class="find">
	<table class="find_table">
	<colgroup>
		<col style="width:100px;">
		<col style="width:320px;">
		<col style="width:250px;">
		<col style="width:70px; ">
	</colgroup>
	<tr>
		<th>사진</th>
		<th>업소</th>
		<th>메뉴</th>
		<th>즐겨찾기</th>
	</tr>
	<c:choose>
		<c:when test="${fn:length(list) == 0 }">
			<tr>
				<td colspan="4">즐겨찾기한 목록이 없습니다. </td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="find">
				<tr>
					<td>
						<a href="/GoodShop/goodshopview.do?dataSid=${find.dataSid}">
							<img class="find_img" src="/GoodShop/images/photos/${find.dataSid}/${find.dataSid}_01.png">
						</a>
					</td>
					<td style="padding-left:20px; font-size: 13px;">
						${find.dataTitle}<br>
						${find.adres}<br>
						${find.area}<br>
						${find.telNo}<br>
					</td>
					<td style="font-size: 13px;">${find.appnPrdlstPc}</td>
					<td style="text-align:center">
						<a href="findDelete.do?dataSid=${find.dataSid}" onclick="return confirm('즐겨찾기에서 삭제하시겠습니까?')">
							<img class="find_x" src="/GoodShop/images/find/x_mark.png">
						</a>
					</td>
				</tr>
			</c:forEach>
			<script>
			
			</script>
		</c:otherwise>
	</c:choose>
	</table>
</div>