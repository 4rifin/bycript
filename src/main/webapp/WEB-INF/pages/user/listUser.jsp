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
			                <div class="row">
					            <div class="col-md-12">
					                
					                <div class="block">
					                    <div class="header">
					                        <h2>All included</h2>
					                    </div>
					                    <div class="content">
					                        <table class="table table-bordered table-striped table-hover">
					                            <thead>
					                                <tr>
					                                    <th>#</th>
					                                    <th>User Name</th>
					                                    <th>Email</th>
					                                    <th>Password</th>
					                                    <th>Action</th>
					                                </tr>
					                            </thead>
					                            <tbody>
					                               <c:forEach items="${listUser}" var="listUser" varStatus="theNumber">
														<tr>
															<td>${theNumber.index+1}</td>
															<td>${listUser.userName}</td>
															<td>${listUser.email}</td>
															<td>${listUser.password}</td>
															<td>
															 <form action="/deleteUser/${listUser.id}" method="post">
																<input type="hidden" name="id" value="${listUser.id}">
																<input type="submit" class="btn btn-danger" value="Delete" onclick="return confirm('Do you want delete?');return false;">
															</form>
														</tr>
													</c:forEach>                     
					                            </tbody>
					                        </table>                       
					                    </div>
					                </div>                
					                
					            </div>
					        </div>
			                
			            </div>
			        </div>
	        	</div>
	        </div>
       <%-- <%@include file="/WEB-INF/pages/user/mainFooter.jsp" %> --%>
  </div>
  
 <script type="text/javascript" >
 function validationDelete(id){
		var x = confirm('are you sure delete');
		var exec = document.getElementById('delete'+id);
		if(x){
			exec.submit();
			return true;
		}else{
			return false;
		}
	}
 
 function closeMessage(){
	 document.getElementById('messageInfo').style.display = 'none';
 }
 
</script>
