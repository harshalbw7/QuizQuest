<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
				<a class="navbar-brand" href="index-2.html"> <img
					src="assets/img/logo.png" />
				</a>

			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Add Student</h4>
				</div>
			</div>
				<%
					String message = (String) session.getAttribute("message");
					if (message != null) {
						session.removeAttribute("message");
				%>
				<div class="alert alert-info" id="info">Student added sucessfully.</div>
				<%
					}
				%>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="images/student.png" style="width: 500px; height: 520px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-primary">
						<div class="panel-heading">STUDENT DETAILS</div>
						<div class="panel-body">
							<form action="AddStudents" method="post">
								<div class="form-group">
									<label>Student Name.:</label> <input type="text" name="sname"
										class="form-control" placeholder="Student Name" required onkeypress="return lettersValidate(event)">
								</div>

								<div class="form-group">
									<label>Email Id.:</label> <input type="text" name="email"
										class="form-control" placeholder="Email Id" id="email" required>
								</div>
								<div class="form-group">
									<label>Mobile No.:</label> <input type="text" name="mobile"
										class="form-control" placeholder="Mobile No" onkeypress="return numberValidate(event)" maxlength="10" required>
								</div>
								<div class="form-group">
									<label>Address.: </label>
									<textarea name="address" class="form-control" placeholder="Address" required></textarea>
								</div>
								<div class="form-group">
									<label>Education.:</label> <input type="text" name="education"
										class="form-control" placeholder="Education" required>
								</div>
								<div class="form-group">
									<label>User Name.:</label> <input type="text" name="uname"
										class="form-control" placeholder="User Name" onkeypress="return lettersValidate(event)" required>
								</div>
								<div class="form-group">
									<label>Password.:</label> <input type="password" name="upass"
										class="form-control" placeholder="Password" required oninput="limitChar(this)"
												maxlength="12" required>
								</div>
								<input type="submit" value="Add Student" class="btn btn-primary">
								<input type="reset" value="Clear" class="btn btn-danger">
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--/.ROW-->
		</div>
	</div>
	<section class="footer-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12"> Harshal , Shekinah , Daya || © 2023 Online Quiz System</div>

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
<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	}    
	    }
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	    }
	</script>
	<script>
	 $(document).ready(function() {
         $("#buttonValidate").click(function() {
             var memberName = $("#memberName").val();
             var email = $("#email").val();
             var mobile = $("#mobile").val();
             var gender = $("#gender").val();
             var age = $("#age").val();
             var address = $("#address").val();
             var joiningDate = $("#joiningDate").val();
             var height = $("#height").val();
             var weight = $("#weight").val();
             var uname = $("#uname").val();
             var upass = $("#upass").val();
             if (memberName === "" || email === "" || mobile === "" || gender === "" || age === "" || address === "" || joiningDate === "" || weight === "" || height === "" || uname === "" || upass === "")
             {
                 $("#memberName").css("border-color", "red");
                 $("#email").css("border-color", "red");
                 $("#mobile").css("border-color", "red");
                 $("#gender").css("border-color", "red");
                 $("#age").css("border-color", "red");
                 $("#address").css("border-color", "red");
                 $("#joiningDate").css("border-color", "red");
                 $("#height").css("border-color", "red");
                 $("#joiningDate").css("border-color", "red");
                 $("#uname").css("border-color", "red");
                 $("#upass").css("border-color", "red");
                 alert("All fields are mendatory.");
                 return false;
             }
         });
     });                                              
	</script>
	<script>
		$(document).ready(function() { 
		    $('#buttonValidate').click(function() {  
		 
		        $(".error").hide();
		        var hasError = false;
		        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		 
		        var emailaddressVal = $("#email").val();
		        if(emailaddressVal == '') {
		            $("#email").after('<span class="error">Please enter your email address.</span>');
		            hasError = true;
		        }
		 
		        else if(!emailReg.test(emailaddressVal)) {
		            $("#email").after('<span class="error">Enter a valid email address.</span>');
		            hasError = true;
		        }
		 
		        if(hasError == true) { return false; }
		 
		    });
		});
	</script>
	<script>
	    $(document).ready(function() {
	        $("#form").submit(function(e) {
	            
	        	 var mobile = $('#mobile').val().length;
		         if (mobile !== 10) {
		             alert("Mobile number should be 10 digit only.");
		             e.preventDefault();
		             return false;
		         }
	             else
	                {}
	        });
	    });
	</script>
</body>
</html>