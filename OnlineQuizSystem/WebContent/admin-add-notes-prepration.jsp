<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:34 GMT -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Online Quiz System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1>Online Quiz System</h1>
			</div>
			<div class="right-div">
				<a href="logout.jsp" class="btn btn-danger pull-right">LOG ME
					OUT</a>
			</div>
		</div>
	</div>
	<!-- LOGO HEADER END-->
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Add Notes</h4>
				</div>
			</div>
			<%
				String notes = (String) session.getAttribute("add-notes");
			if (notes != null) {
				session.removeAttribute("add-notes");
			%>
			<div class="alert alert-info" id="info">Notes added
				successfully.</div>
			<%
				}
			%>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="images/add-notes.jpg" class="img-thumbnail"
						alt="Cinque Terre" style="width: 500px; height: 430px;">
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Add Notes</div>
						<div class="panel-body">
							<form role="form" action="AddNotesDetails" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<label>Notes Topic Name</label> <select name="notesTopicName"
										class="form-control">
										<option>Select Topic</option>
										<option>Java Programming</option>
										<option>Programming and Data Structures</option>
										<option>Design and Implementation</option>
										<option>Operating Systems</option>
										<option>Computer Communication Networks</option>
										<option>Software Engineering</option>
										<option>Database Management Systems</option>

									</select>
								</div>
								<div class="form-group">
									<label>Notes Resources <font color="red">.doc, .txt, .pdf, .jpeg, .jpg, .png types files</font></label> <input class="form-control"
										type="file" name="document" />
								</div>
								<button type="submit" class="btn btn-info">Add Notes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">Harshal , Shekinah , Daya || © 2023
					Online Quiz System</div>
			</div>
		</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>
