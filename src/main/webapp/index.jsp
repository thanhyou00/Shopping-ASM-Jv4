<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<%-- Library bootstrap --%>
	<%@include file="/views/bootstrap.jsp"%>
<link rel="shortcut icon" href="../Bootstrap/images/logo.png"
	type="image/x-icon">
<title>YouVideo</title>
</head>
<body class="container-fluid font-monospace">
	<%-- Header --%>
	<jsp:include page="/views/header.jsp" />
	<%-- views --%>
	<jsp:include page="${view}" />
	<%-- Footer --%>
	<jsp:include page="/views/footer.jsp" />
</body>
</html>