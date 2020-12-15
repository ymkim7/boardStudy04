<!DOCTYPE html>
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
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->

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