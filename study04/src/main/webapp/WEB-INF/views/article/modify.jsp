<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<%@ include file = "/WEB-INF/views/include/head.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<!-- main header -->
	<%@ include file = "/WEB-INF/views/include/main_header.jsp" %>
	
	<!-- left column -->
	<%@ include file = "/WEB-INF/views/include/left_column.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
		게시판
        <small>수정페이지(페이징)</small>
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-edit"></i>article</li>
        <li class="active"><a href="${path }/article/modify">modify</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="col-lg-12">
			<form role="form" id="writeForm" method="post" action="${path }/article/modify">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">게시글 작성</h3>
					</div>
					
					<div class="box-body">
						<input type="hidden" name="articleNo" value="${article.articleNo }"/>
						<input type="hidden" name="page" value="${searchCriteria.page }"/>
						<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum }"/>
						<input type="hidden" name="searchType" value="${searchCriteria.searchType }"/>
						<input type="hidden" name="keyword" value="${searchCriteria.keyword }"/>
						
						<div class="form-group">
							<label for="title">제목</label>
							<input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." value="${article.title }"/>
						</div>
						
						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" id="content" name="content" rows="30" placeholder="내용을 입력해주세요." style="resize:none;">${article.content }</textarea>
						</div>
						
						<div class="form-group">
							<label for="writer">작성자</label>
							<input class="form-control" id="writer" name="writer" value="${article.writer }" readonly="readonly"/>
						</div>
					</div>
					
					<div class="box-footer">
						<button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i>목록</button>
						<div>
							<button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i>취소</button>
							<button type="submit" class="btn btn-warning modBtn"><i class="fa fa-save"></i>저장</button>
						</div>
					</div>
				</div>
			</form>
		</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <!-- main footer -->
  <%@ include file = "/WEB-INF/views/include/main_footer.jsp" %>

</div>
<!-- ./wrapper -->

<%@ include file = "/WEB-INF/views/include/plugin_js.jsp" %>

</body>
</html>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		$(".modBtn").on("click", function(){
			formObj.submit();
		});
		
		$(".cancelBtn").on("click", function(){
			history.go(-1);
		});
		
		$(".listBtn").on("click", function(){
			self.location = "/article/listPaging?page=${searchCriteria.page}"
							+ "&perPageNum=${searchCriteria.perPageNum}"
							+ "&searchType=${searchCriteria.searchType}"
							+ "&keyword=${searchCriteria.keyword}";
		});
	});
	
</script>