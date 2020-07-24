<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Roles">

	<div class="container" style="font-size: 1rem">
		<h1>
			<fmt:message key="user.form.role.title" />
			${usuario.nome }
		</h1>
		<form:form action="${s:mvcUrl('UC#editarRole').build() }"
			method="post" commandName="usuario">
			<div class="form-group">
				<label><fmt:message key="user.form.role.permission" />:</label>
				<form:checkboxes path="roles" items="${roles}" cssStyle="margin: .5rem"/>
			</div>
			<button type="submit" class="btn-primary">
				<fmt:message key="user.form.role.button" />
			</button>
		</form:form>
	</div>

</tags:pageTemplate>