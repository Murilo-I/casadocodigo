<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="extraScripts" fragment="true"%>

<c:url value="/" var="contextPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="icon" href="${contextPath }resources/imagens/logo.svg"
	type="icon" />
<link href="https://plus.googlecom/108540024862647200608"
	rel="publisher" />
<title>${titulo }-Casa do C�digo</title>
<link href="${contextPath}resources/css/cssbase-min.css"
	rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700'
	rel='stylesheet' />
<link href="${contextPath}resources/css/fonts.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello-ie7.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello-embedded.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="${contextPath}resources/css/style.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="${contextPath}resources/css/layout-colors.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/responsive-style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/guia-do-programador-style.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/produtos.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="canonical" href="http://www.casadocodigo.com.br/" />
<link href="${contextPath}resources/css/book-collection.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/pace-theme-mac-osx.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/estilo.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
</head>
<body class="${bodyClass}">

	<%@ include file="/WEB-INF/views/cabecalho.jsp"%>

	<jsp:doBody />

	<jsp:invoke fragment="extraScripts"></jsp:invoke>

	<%@ include file="/WEB-INF/views/rodape.jsp"%>

	<script type="text/javascript"
		src="${contextPath}resources/js/pace.min.js">
		
	</script>

</body>
</html>
