<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Pedidos">

	<div class="container">
		<h1><fmt:message key="pedidos.title"/></h1>

		<table class="table-estilo">
			<tr>
				<th>ID</th>
				<th><fmt:message key="pedidos.date"/></th>
				<th><fmt:message key="pedidos.value"/></th>
				<th><fmt:message key="pedidos.books.title"/></th>
			</tr>
			<c:forEach items="${pedidos }" var="pedido" varStatus="status">
				<tr>
					<td>${pedido.id }</td>
					<td>${pedido.valor }</td>
					<td><fmt:formatDate value="${pedido.data.time }"
							pattern="dd/MM/yyyy" timeZone="America/Sao_Paulo" /></td>
					<td>${pedido.produtos[satus.index].titulo }</td>
				</tr>
			</c:forEach>
		</table>

	</div>

</tags:pageTemplate>