<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커뮤니티 글 쓰기</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		fn_init();
	});

	function fn_save(){
		if(!fn_validation()){
			return;
		}else{
			var comuContent = String($("#comuContent").val());

			comuContent = comuContent.replace(/\n/gi, "<br/>");

			$("#comuContent").val(comuContent);

	 		$("#communityWrite").submit();
		}
	}

	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_service.png");'>
	<div class="boardText">
		<h3 class="boardTitle">COMMUNITY</h3>
		<p class="boardSub">자유 커뮤니티</p>
	</div>
</div>
<!-- title, visual end -->
<!-- Detail -->
	<div class="container">
		<!-- board title, buttons start -->
		<div class="page-header">
			<div class="row">
				<div class="col-xs-8">
					<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
					<h2 class="title eng">Community</h2>
				</div>
			</div>
		</div>
		<!-- board title, buttons end -->
		
		<form id="communityWrite" method="post" action="${context}/work/board/communityWrite.do" role="form">
			<div class="form-horizontal boardwrite">
				<div class="form-group">
					<label for="comuTitle" class="control-label">제목</label>
					<input class="form-control" name="comuTitle" id="comuTitle" required="required" maxlength="50" placeholder="제목을 입력해주세요" />
				</div>
				<div class="form-group">
					<label for="comuContent" class="control-label">내용</label>
					<textarea class="form-control" name="comuContent" id="comuContent" cols="10" rows="15" required="required" placeholder="내용을 입력해주세요"></textarea>
				</div>
				<!-- board button area start -->
				<div class="row btnarea">
					<button class="btn btn-lg boardbtn" type="button" onclick="fn_save()">글 등록하기</button>
					<button type="button" class="btn btn-lg boardbtn" onclick="fn_back()">취소</button>
				</div>
				<!-- board button area end -->
			</div>
		</form>
	</div>

	<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>