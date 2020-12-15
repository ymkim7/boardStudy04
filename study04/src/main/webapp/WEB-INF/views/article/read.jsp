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
        <small>조회페이지(페이징)</small>
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-edit"></i>article</li>
        <li class="active"><a href="${path }/article/write">read</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="col-lg-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">글제목 : ${article.title }</h3>
				</div>
				
				<div class="box-body" style="reight:700px;">${article.content }</div>
				
				<div class="box-footer">
					<div class="user-block">
						<img class="img-circle img-bordered-sm" src="/dist/img/user1-128x128.jpg" alt="user image">
						<span class="username"><a href="#">${article.writer }</a></span>
						<span class="description"><fmt:formatDate pattern="yyyy--MM-dd" value="${article.regDate }"/></span>
					</div>
				</div>
				
				<div class="box-footer">
					<form role="form" method="post">
						<input type="hidden" name="articleNo" value="${article.articleNo }"/>
						<input type="hidden" name="page" value="${searchCriteria.page }"/>
						<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum }"/>
						<input type="hidden" name="searchType" value="${searchCriteria.searchType }"/>
						<input type="hidden" name="keyword" value="${searchCriteria.keyword }"/>
					</form>
					<button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i>목록</button>
					<div>
						<button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i>수정</button>
						<button type="submit" class="btn btn-warning delBtn"><i class="fa fa-trash"></i>삭제</button>
					</div>
				</div>
				
				<div class="box box-warning">
					<div class="box-header with-border">
						<a class="link-black text-lg"><i class="fa fa-pencil"></i>댓글 작성</a>
					</div>
					
					<div class="box-body">
						<form class="box-body">
							<div class="form-horizonatal">
								<div class="col-sm-10">
									<textarea class="form-control" id="newReplyText" rows="3" placeholder="댓글내용" style="resize:none;"></textarea>
								</div>
								
								<div class="col-sm-2">
									<input class="form-control" id="newReplyWriter" type="text" placeholder="댓글작성자"/>
								</div>
								<hr/>
								
								<div class="col-sm-2">
									<button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i>저장</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
				<div class="box box-success collapsed-box">
					<!-- 댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기 -->
					<div class="box-header with-border">
						<a href="" class="link-black text-li"><i class="fa fa-comments-o margin-r-5 replyCount"></i></a>
						<div class="box-tools">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
						</div>
					</div>
					
					<!-- 댓글 목록 -->
					<div class="box-body repliesDiv">
						
					</div>
					
					<!-- 댓글 페이징 -->
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination pagination-sm no-margin">
								
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 댓글 수정 modal 영역 -->
				<div class="modal fade" id="modModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">댓글 수정</h4>
							</div>
							
							<div class="modal-body" data-rno>
								<input type="hidden" class="replyNo"/>
								<textarea class="form-control" id="replyText" rows="3" style="resize:none;"></textarea>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary modalModBtn">수정</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 댓글 삭제 modal 영역 -->
				<div class="modal fade" id="delModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">댓글 삭제</h4>
								<input type="hidden" class="rno"/>
							</div>
							
							<div class="modal-body" data-rno>
								<p>삭제하시겠습니까?</p>
								<input type="hidden" class="rno"/>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">아니요</button>
								<button type="button" class="btn btn-primary modalModBtn">네. 삭제합니다.</button>
							</div>
						</div>
					</div>
				</div>
			</div>
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

<script id="replyTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<div class="post replyDiv" data-replyNo={{repllyNo}}>
		<div class="user-block">
			<img class="img-circle img-bordered-sm" src="/dist/img/user1-128x128.jpg" alt="user image">
			<span class="username">
				<a href="#">{{replyWriter}}</a>
				<a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
					<i class="fa fa-times">삭제</i>
				</a>
				<a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
					<i class="fa fa-times">삭제</i>
				</a>
			</span>
			<span class="description>{{prettifyDate regDate}}</span>
		</div>
		<div class="oldReplyText>{{{escape replyText}}}</div>
		<br/>
	</div>
	{{/each}}
</script>

</body>
</html>

<script type="text/javascript">

	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		var articleNo = "${article.articleNo}";
		var replyPageNum = 1;
		
		$(".modBtn").on("click", function(){
			formObj.attr("action", "/article/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$(".delBtn").on("click", function(){
			formObj.attr("action", "/article/remove");
			formObj.submit();
		});
		
		$(".listBtn").on("click", function(){
			formObj.attr("action", "/article/listPaging");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		//댓글 내용 : 줄바꿈/공백처리
		Handlebars.registerHepler("escape", function(replyText) {
			var text = Handlebars.Utils.escapeExpression(replyText);
			text = text.replace(/(\r\n|\n|\r)/gm, "<br/>");
			text = text.replace(/( )/gm, "&nbsp;");
			return new Handlebars.SafeString(text);
		});
		
		//댓글 등록일자 : 날짜/시간 2자리로 맞추기
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth();
			var date = dateObj.getDate();
			var hours = dateObj.getHours();
			var minutes = dateObj.getMinutes();
			
			//2자리 숫자로 변환
			month < 10 ? month = '0' + month : month;
			date < 10 ? date = '0' + date : date;
			hours < 10 ? hours = '0' + hours : hours;
			minutes < 10 ? minutes = '0' + minutes : minutes;
			return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
		});
		
		//댓글 목록 함수 호출
		getReplies("/replies" + articleNo + "/" + replyPageNum);
		
		//목록페이지 번호 클릭 이벤트
		$(".pagination").on("click", "li a", function(){
			replyPageNum = $(this).attr("href");
			getReplies("/replies" + articleNo + "/" + replyPageNum);
		});
		
		//댓글 저장 버튼 클릭 이벤트
		$(".replyAddBtn").on("click", function(){
			//입력 form 선택자
			var replyWriterObj = $("#newReplyWriter");
			var replyTextObj = $("#newReplyText");
			var replyWriter = replyWriterObj;
			var replyText = replyTextObj;
			
			//댓글 입력처리 수행
			$.ajax({
				type : "post"
				, url : "/replies/"
				, headers : {
					"Content-type" : "application/json"
					, "X-HTTP-Method-Override" : "POST"
				}
				, dataType : "text"
				, data : JSON.stringify({
					articleNo : articleNo
					, replyWriter : replyWriter
					, replyText : replyText
				})
				, success : function(result) {
					if(result == "regSuccess") {
						replyPageNum = 1;
						getReplies("/replies" + articleNo + "/" + replyPageNum);
						$("#newReplyText").val("");
						//댓글 작성자 초기화
						$("#newReplyWriter").val("");
					}
				}
			});
		});
		
		//댓글 수정을 위해 modal 창에 선택한 댓글의 값을들 세팅
		$(".repliesDiv").on("click", "replyDiv", function(){
			var reply = $(this);
			$(".replyNo").val(reply.attr("data-replyNo"));
			$("#replyText").val(reply.find(".oldReplyText").text());
		});
		
		//modal 창의 댓글 수정버튼 클릭 이벤트
		$(".modalModBtn").on("click", function(){
			var replyNo = $(".replyNo").val();
			var replyText = $("#replyText").val();
			
			$.ajax({
				type : "put"
				, url : "/replies/" + replyNo
				, headers : {
					"Content-type" : "application/json"
					, "X-HTTP-Method-Override" : "PUT"
				}
				, dataType : "text"
				, data : JSON.stringify({
					replyText : replyText
				})
				, success : function(result) {
					if(result == "modSuccess") {
						alert("수정되었습니다.");
						getReplies("/replies" + articleNo + "/" + replyPageNum);
						$("#modModal").modal("hide");
					}
				}
			});
		});
		
		//modal 창의 댓글 삭제버튼 클릭 이벤트
		$(".modalDelBtn").on("click", function(){
			var replyNo = $(".replyNo").val();
			
			$.ajax({
				type : "delete"
				, url : "/replies/" + replyNo
				, headers : {
					"Content-type" : "application/json"
					, "X-HTTP-Method-Override" : "DELETE"
				}
				, dataType : "text"
				, success : function(result) {
					if(result == "delSuccess") { 
						alert("삭제되었습니다.");
						getReplies("/replies" + articleNo + "/" + replyPageNum);
						$("#delModal").modal("hide");
					}
				}
			});
		});
		
	});
	
	//댓글 목록 함수
	function getReplies(repliesUri) {
		$.getJSON(repliesUri, function(data){
			printReplyCount(data.pageMaker.totalCount);
			printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
			printReplyPaging(data.pageMaker, $(".pagination"));
		});
	}
	
	//댓글 갯수 출력 함수
	function printReplyCount(totalCount) {
		var replyCount = $(".replyCount");
		var collapsedBox = $(".collapsed-box");
		
		//댓글이 없으면
		if(totalCount == 0) {
			replyCount.html("댓글이 없습니다.");
			collapsedBox.find(".btn-box-tool").remove();
			return;
		}
		
		//댓글이 존재하면
		replyCount.html("댓글 목록("+totalCount +")");
		collapsedBox.find(".box-tools").html(
			"<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
			+ "<i class='fa fa-plus'></i>"
			+ "</button>"
		);
	}
	
	//댓글 목록 출력 함수
	function printReplies(replyArr, targetArea, templateObj) {
		var replyTemplate = Handlebars.compile(templateObj.html());
		var html = replyTemplate(replyArr);
		$(".replyDiv").remove();
		targetArea.html(html);
	}
	
	//댓글 페이징 출력 함수
	function printReplyPaging(pageMaker, targetArea) {
		var str = "";
		
		var str = "";
		
		//이전 버튼 활성화
		if(pageMaker.prev) {
			str += "<li><a href='"+(pageMaker.startPage - 1)+"'>이전</a></li>";
		}
		
		//페이지 번호
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.criteria.page == i ? "class=active" : "";
			str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
		}
		
		//다음 버튼 활성화
		if(pageMaker.next) {
			str += "<li><a href='"+(pageMaker.endPage + 1)+"'>다음</a></li>";
		}
		
		targetArea.html(str);
	}

</script>