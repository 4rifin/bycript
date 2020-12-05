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
    <link href="<c:url value="/resources/js/actions.js"/>" rel="stylesheet" type="text/css" />
    
</head><body class="bg-img-num1"> 
      <div class="container">
         <%@include file="/WEB-INF/pages/user/mainHeader.jsp" %>
         <form id="login"  method="post" action="<c:url value='/login/submit'/>" data-toggle="validator">
	        
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
			                        <div class="col-md-12">
			                            <div class="input-group">
			                                <div class="input-group-addon">
			                                    <span class="icon-user"></span>
			                                </div>
			                                <input id="userName" type="text" class="form-control" autocomplete="off" placeholder="Username / Email" name="userName" required />
			                            </div>
			                        </div>
			                    </div>
			                    <div class="form-row">
			                        <div class="col-md-12">
			                            <div class="input-group">
			                                <div class="input-group-addon">
			                                    <span class="icon-key"></span>
			                                </div>
			                                <input type="password" class="form-control" placeholder="Password" name="password" required/>
			                            </div>
			                        </div>
			                    </div>                        
			                    <div class="form-row">
			                        <div class="col-md-6">
			                            <a href="/register" class="btn btn-default btn-block btn-clean">Register</a>                                
			                        </div>
			                        <div class="col-md-6">
			                            <a href="#" class="btn btn-default btn-block btn-clean" onclick="validationLogin();" >Log In</a>
			                        </div>
			                    </div>
			                    <div class="form-row">                            
			                        <div class="col-md-12">
			                            <a href="/forgot-pass" class="btn btn-link btn-block">Forgot your password?</a>
			                        </div>
			                    </div>                         
			                </div>
			            </div>
			        </div>
	        	</div>
	        </div>
        </form>
  </div>
  </body>
  </html>
  
  <%-- <%@include file="/WEB-INF/pages/user/mainFooter.jsp" %> --%>
 <script type="text/javascript" >
 function validationLogin(){
		var exec = document.getElementById('login');
		exec.submit();
			return true;
		
	}
 
 function closeMessage(){
	 document.getElementById('messageInfo').style.display = 'none';
 }
</script>
