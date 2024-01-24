<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
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
				<a class="navbar-brand" href="index.jsp"> <img
					src="images/logo.jpg" style="width: 200px; height: 70px;" />
				</a>
			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="studentSideHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Student Feedback</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="images/feedback.jpg" style="width: 500px; height: 380px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<%
						String feedbackMessage = (String) session.getAttribute("feedback");
					if (feedbackMessage != null) {
						session.removeAttribute("feedback");
					%>
					<div class="alert alert-success" id="success">Feedback
						submitted successfully.</div>
					<%
						}
					%>
					<div class="panel panel-primary shadow p-3 mb-5">
						<div class="panel-heading">Student Feedback</div>
						<div class="panel-body">
							<form role="form" action="StudentFeedback" method="post" name=''>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="sname">Student Name</label> <input type="text"
											class="form-control" id="sname" name="sname"
											placeholder="Name" value="<%=session.getAttribute("uname")%>"
											readonly>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="review">How do you feel about our Online Quiz System ?</label><br> <input
											type="radio" name="review"
											value="Good System">&nbsp;Good System &nbsp;<input
											type="radio" name="review" 
											value="Better System">&nbsp;Better System &nbsp;<input
											type="radio" name="review"
											value="Best System">&nbsp;Best System 
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="feedback">Feedback</label>
										<textarea class="form-control" id="feedback" name="feedback"
											placeholder="Feedback" required></textarea>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<div class="rateyo" id="rating" data-rateyo-rating="0.5"
											data-rateyo-num-stars="5" data-rateyo-score="3"></div>
										<input type="hidden" name="rating">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<button type="submit" class="btn btn-info" id="btnValidate">Submit
											Feedback</button>
										<button type="reset" class="btn btn-danger" id="btnValidate">Cancel</button>
									</div>
								</div>
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
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
<script>
	$(function() {
		$(".rateyo").rateYo().on(
				"rateyo.change",
				function(e, data) {
					var rating = data.rating;
					$(this).parent().find('.score').text(
							'score :' + $(this).attr('data-rateyo-score'));
					$(this).parent().find('.result').text('rating :' + rating);
					$(this).parent().find('input[name=rating]').val(rating); //add rating value to input field
				});
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#info').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
