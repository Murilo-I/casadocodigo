<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Lista de Usuários">

	<div class="container">
		<h1>
			<fmt:message key="user.list.title" />
		</h1>
		<p class="alert alert-success">${message }</p>
		<table class="table-estilo">
			<tr>
				<th><fmt:message key="user.name" /></th>
				<th>Email</th>
				<th>Roles</th>
				<th><fmt:message key="user.edit" /></th>
			</tr>
			<c:forEach items="${usuarios }" var="usuario" varStatus="status">
				<tr>
					<td>${usuario.nome }</td>
					<td>${usuario.email }</td>
					<td>${usuario.roles }</td>
					<td><a style="text-decoration: none;"
						href="${s:mvcUrl('UC#roleForm').arg(0, usuario.email).build() }"><i
							class="far fa-edit"></i></a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="${s:mvcUrl('UC#usuarioForm').build() }"><fmt:message
				key="user.list.link" /></a>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$().ready(function() {
			setTimeout(function() {
				$('.alert-success').hide();
			}, 2500);
		});
	</script>

</tags:pageTemplate>