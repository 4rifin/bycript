<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@include file="/WEB-INF/pages/includes/taglibs.jsp" %>
<html>
<head>        
    
    
    <meta charset="UTF-8">
    <title>Spring Login Bootstrap postgresql</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/css/stylesheets.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/jquery/jquery.min.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/jquery/jquery-ui.min.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/jquery/jquery-migrate.min.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/jquery/globalize.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/bootstrap/bootstrap.min.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/uniform/jquery.uniform.min.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/knob/jquery.knob.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/sparkline/jquery.sparkline.min.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/flot/jquery.flot.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins/flot/jquery.flot.resize.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/plugins.js"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/stylesheets.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/js/charts.js"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/js/settings.js"/>" rel="stylesheet" type="text/css" />
    
    
</head><body class="bg-img-num1"> 
    <div class="container">        
        <%@include file="/WEB-INF/pages/user/mainHeader.jsp" %>
         <form id="resetPassword"  method="post" action="<c:url value='/reset/password/user/${user.id}'/>">
	 
	 	<c:if test="${message != null}">
		        <div id="messageInfo" class="alert alert-${messageType}">
	                    <strong>Atention!</strong> ${message}
	                    <button type="button" class="close" data-dismiss="alert" onclick="closeMessage();">×</button>
	            </div>
	        </c:if>
	        <div class="registration-block">
	            <div class="block block-transparent">
			        <div class="login-block">
			            <div class="block block-transparent">
			                <div class="content controls npt">
			                    <div class="form-row">
			                        <div class="col-md-12" align="center">
			                            <div class="input-group" >
			                                <div class="">
			                                    <span class="icon-user"></span>
			                                </div>
			                                <input type="hidden" class="form-control" name="id" value="${user.id}"/>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="form-row">
			                        <div class="col-md-12">
			                            <div class="input-group">
			                                <div class="input-group-addon">
			                                    <span class="icon-key"></span>
			                                </div>
			                                <input type="password" class="form-control" placeholder="Password" name="password" value="" onkeyup="checkPass();"/>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="form-row">
			                        <div class="col-md-12">
			                            <div class="input-group">
			                                <div class="input-group-addon">
			                                    <span class="icon-key"></span>
			                                </div>
			                                <input type="password" class="form-control" placeholder="Confirm Password" name="confirmPassword" value="" onkeyup="checkPass();"/>
			                            </div>
			                        </div>
			                    </div>
			                    </div>
			                    <div class="form-row">
						            <div class="col-md-12">
			                            <a href="#" class="btn btn-default btn-block btn-clean" onclick="validationRegister();">Reset Password</a>
			                        </div>
                                </div>
			                
			            </div>
			        </div>
	        	</div>
	        </div>
        </form>
       <%-- <%@include file="/WEB-INF/pages/user/mainFooter.jsp" %> --%>
  </div>
  
 <script type="text/javascript" >
 function validationRegister(){
		var exec = document.getElementById('resetPassword');
			exec.submit();
			return true;
		
	}
 
 function checkPass(){
	 var password = document.getElementById('password').value
	 var confirmPassword = document.getElementById('confirmPassword').value
		
	 if (password == confirmPassword) {
		    document.getElementById('message').style.color = 'green';
		    document.getElementById('message').innerHTML = 'matching';
		  } else {
		    document.getElementById('message').style.color = 'red';
		    document.getElementById('message').innerHTML = 'not matching';
		  }
 }
 
 function closeMessage(){
	 document.getElementById('messageInfo').style.display = 'none';
 }
</script>
