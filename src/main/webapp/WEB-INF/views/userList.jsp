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
		<p>${message }</p>
		<table class="table-estilo">
			<tr>
				<th><fmt:message key="user.name" /></th>
				<th>Email</th>
				<th>Roles</th>
				<th><fmt:message key="user.edit" /></th>
			</tr>
			<c:forEach items="${usuarios }" var="user" varStatus="status">
				<tr>
					<td>${user.nome }</td>
					<td>${uesr.email }</td>
					<td>${uesr.roles }</td>
					<td><a style="text-decoration: none;"
						href="${s:mvcUrl('UC#roleForm').build() }">&#10133;</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="${s:mvcUrl('UC#usuarioForm').build() }"><fmt:message key="user.list.link"/></a>
	</div>

</tags:pageTemplate>