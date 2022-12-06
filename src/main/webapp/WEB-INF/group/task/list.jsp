<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*, model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/task.css' />"
	type="text/css">
<link rel=stylesheet href="<c:url value='/css/modal.css' />"
	type="text/css">
<title>StudySet: ${studyGroup.groupName}_과제 홈</title>
<script>
	window.onload = function() {

		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
		}
		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);
	};
</script>
</head>
<body leftmargin="0" bgcolor="#DFE5DD">
	<br>
	<table style="width: 100%; border-collapse: collapse">
		<tr>
			<td rowspan='2' style="text-align: left; width: 130px;"><a
				href="<c:url value='http://localhost:8080/StudySet/user/group/list' />">
					<img src="<c:url value='/images/studysetlogo.png'/>" width="130px" />
			</a></td>
			<td class="title" style="text-align: left; vertical-align: top;"><br>
				<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;${studyGroup.groupName}
				스터디</td>
		</tr>
		<tr>
			<td class="title">&nbsp;&nbsp;&nbsp;&nbsp;과제</td>
			<td>
				<p id="modal_btn" class="btn">
					<a href="#modal1" rel="modal:open" type="button"
						style="color: white;">과제 생성</a>
				</p>
			</td>
		</tr>
		<tr>
			<td style="height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><jsp:include page="../menu.jsp" flush="false" /></td>
		</tr>
		<tr>
			<td class="back">
				<table
					style="border-collapse: collapse; border-spacing: 0; width: 90%; margin-left: 58px; margin-top: 15px;">
					<c:forEach var="task" items="${list}">
						<tr valign="top">
							<td colspan="4" class="contents"
								style="margin-bottom: 10px; vertical-align: middle"><a
								href="<c:url value='/group/task/detail'>
								<c:param name="taskId" value="${task.taskId}" />
								</c:url>">&nbsp;&nbsp;&nbsp;&nbsp;${task.name}</a></td>
							<td class="contentsTime2"
								style="vertical-align: middle; text-align: -webkit-center;">
								&nbsp;&nbsp;&nbsp;&nbsp;제출기한:&nbsp;&nbsp;<fmt:parseDate
									value="${task.startDate}" pattern="yyyy-MM-dd"
									var="parsedRegDate" type="date" /> <fmt:formatDate
									value="${parsedRegDate}" pattern="yyyy/MM/dd" />&nbsp;&nbsp;~&nbsp;&nbsp;
								<fmt:parseDate value="${task.endDate}" pattern="yyyy-MM-dd"
									var="parsedRegDate" type="date" /> <fmt:formatDate
									value="${parsedRegDate}" pattern="yyyy/MM/dd" />
							</td>
						</tr>
						<tr style="height: 10px;">
							<td></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<div style="display: none; height: 550px;" class="modal_wrap">
		<!--과제 생성 모달창 영역-->
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div align="center">
			<jsp:include page="create.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>