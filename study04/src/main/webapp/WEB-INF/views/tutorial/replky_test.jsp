<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <small>입력페이지(페이징)</small>
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-edit"></i>article</li>
        <li class="active"><a href="${path }/article/write">write</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="col-lg-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">댓글 작성</h3>
				</div>
				
				<div class="box-body">
					<div class="form-group">
						<label for="newReplyText">댓글 내용</label>
						<input class="form-control" id="newReplyText" name="newReplyText" placeholder="댓글 내용을 입력해주세요."/>
					</div>
					
					<div class="form-group">
						<label for="newReplyWriter">댓글 작성자</label>
						<input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력해주세요."/>
					</div>
					
					<div class="pull-right">
						<button type="button" id="replyAddBtn" class="btn btn-primary"><i class="fa fa-save"></i> 댓글 저장</button>
					</div>
				</div>
				
				<div class="box-footer">
					<ul id="replies">
						
					</ul>
				</div>
				
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination pagination-sm no-margin">
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="modifyModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">댓글 수정창</h4>
					</div>
					
					<div class="modal-body">
						<div class="form-group">
							<label for="replyNo">댓글 번호</label>
							<input class="form-control" id="replyNo" name="replyNo" readonly="readonly"/>
						</div>
						
						<div class="form-group">
							<label for="replyText">댓글 내용</label>
							<input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요."/>
						</div>
						
						<div class="form-group">
							<label for="replyWriter">댓글 작성자</label>
							<input class="form-control" id="replyWriter" name="replyWriter" readonly="readonly"/>
						</div>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-success modalModBtn">수정</button>
						<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
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

</body>
</html>

<script type="text/javascript">
var articleNo = 10;
var replyPageNum = 1;

	$(document).ready(function(){
		
		getReplies(replyPageNum);
		
		$("#replyAddBtn").on("click", function(){
			
			//화면으로부터 입력 받은 변수값의 첯리
			var replyText = $("#newReplyText").val();
			var replyWriter = $("#newReplyWriter").val();
			var replyTextVal = replyText;
			var replyWriterVal = replyWriter;
			
			//ajax 통신 : post
			$.ajax({
				type : "post"
				, url : "/replies"
				, headers : {
					"Content-type" : "application/json"
					, "X-HTTP-Method-Override" : "POST"
				}
				, dataType : "text"
				, data : JSON.stringify({
					articleNo : articleNo
					, replyText : replyTextVal
					, replyWriter : replyWriterVal
				})
				, success : function(result) {
					//성공적인 댓글 등록 처리 알림
					if(result == "regSuccess") {
						alert("등록 완료");
					}
					//댓글 목록 출력 함수 호출
					getReplies(replyPageNum);
					//댓글 내용 초기화
					$("#newReplyText").val("");
					//댓글 작성자 초기화
					$("#newReplyWriter").val("");
				}
			});
		});
		
		$("#replies").on("click", ".replyLi button", function(){
			var reply = $(this).parent();
			var replyNo = reply.attr("data-replyNo");
			var replyText = reply.find(".replyText").text();
			var replyWriter = reply.find(".replyWriter").text();
			
			$("#replyNo").val(replyNo);
			$("#replyText").val(replyText);
			$("#replyWriter").val(replyWriter);
		});
		
		$(".modalDelBtn").on("click", function(){
			
			//댓글 번호
			var replyNo = $(this).parent().parent().find("#replyNo").val();
			
			$.ajax({
				type : "delete"
				, url : "/replies/" + replyNo
				, headers : {
					"Content-type" : "application/json"
					, "X-HTTP-Method-Override" : "POST"
				}
				, dataType : "text"
				, success : function(result){
					if(result == "delSuccess") {
						alert("삭제 완료");
						$("#modifyModal").modal("hide");
						getReplies(replyPageNum);
					}
				}
			});
			
		});
		
		$(".modalModBtn").on("click", function(){
			
			//댓글 선택자
			var reply = $(this).parent().parent();
			//댓글번호
			var replyNo = reply.find("#replyNo").val();
			//수정한 댓글 내용
			var replyText = reply.find("#replyText").val();
			
			$.ajax({
				type : "put"
				, url : "/replies/" + replyNo
				, headers : {
					"Content-type" : "application/json"
					, "X-HTTP-Method-Override" : "PUT"
				}
				, data : JSON.stringify({
					replyText : replyText
				})
				, dataTpey : "text"
				, success : function(result) {
					if(result == "modSuccess") {
						alert("수정 완료");
						$("#modifyModal").modal("hide");
						getReplies(replyPageNum);
					}
				}
			});
		});
		
		//목록페이지 번호 클릭 이벤트
		$(".pagination").on("click", "li a", function(){
			replyPageNum = $(this).attr("href");
			getReplies(replyPageNum);
		});
		
	});
	
	function getReplies(page) {
		
		$.getJSON("/replies/" + articleNo + "/" + page, function(data){
			
			var str = "";
			
			$(data.replies).each(function(){
				str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
					+	"<p class='replyText'>" + this.replyText + "</p>"
					+	"<p class='replyWriter'>" + this.replyWriter + "</p>"
					+	"<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
					+ "</li>"
					+ "<hr/>";
			});
			
			$("#replies").html(str);
			//페이지 번호 출력 호출
			printPageNumbers(data.pageMaker);
		});
		
	}
	
	function printPageNumbers(pageMaker) {
		
		var str = "";
		
		//이전 버튼 활성화
		if(pageMaker.prev) {
			str += "<li><a href='"+(pageMaker.startPage - 1)+"'>이전</a></li>";
		}
		
		//페이지 번호
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.criteria.page == i ? 'class=active' : '';
			str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
		}
		
		//다음 버튼 활성화
		if(pageMaker.next) {
			str += "<li><a href='"+(pageMaker.endPage + 1)+"'>다음</a></li>";
		}
		
		$(".pagination-sm").html(str);
		
	}
	
</script>