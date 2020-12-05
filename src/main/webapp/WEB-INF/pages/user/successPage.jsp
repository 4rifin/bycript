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
         <div class="block-error">
            <div class="row">
                <div class="col-md-12">
                    <div class="error-logo"><img src="<c:url value="/resources/img/logob.png"/>"/></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="error-code">
                        Success Login as <c:out value="${user.userName}"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">            
                    <div class="error-text">congratulation</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <button class="btn btn-default btn-clean btn-block" onClick="document.location.href = '/';">Back to dashboard</button>
                </div>
                <div class="col-md-6">
                    <button class="btn btn-default btn-clean btn-block" onClick="document.location.href = '/login';">Previous page</button>
                </div>
            </div>
        </div>
       <%@include file="/WEB-INF/pages/user/mainFooter.jsp" %>
  </div>
  
 <script type="text/javascript" >
 function validationLogin(){
		var exec = document.getElementById('login');
			exec.submit();
			return true;
		
	}
</script>
