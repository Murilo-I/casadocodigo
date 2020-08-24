<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Cadastro de Usuário">

	<div class="container">
		<h1>
			<fmt:message key="user.form.title" />
		</h1>
		<form:form action="${s:mvcUrl('UC#cadastrarUsuario').build() }"
			method="post" commandName="usuarioDTO">
			<div class="form-group">
				<form:input path="nome" cssClass="form-control"
					placeholder="Nome de Usuário" />
				<form:errors path="nome" cssClass="alert alert-danger" />
			</div>
			<div class="form-group">
				<input type="email" class="form-control" placeholder="Email"
					name="email" />
				<form:errors path="email" cssClass="alert alert-danger" />
			</div>
			<div class="form-group">
				<input type="password" name="senha" class="form-control"
					placeholder="Senha" />
				<form:errors path="senha" cssClass="alert alert-danger" />
			</div>
			<div class="form-group">
				<input type="password" name="confirmaSenha" class="form-control"
					placeholder="Confirmar senha" />
				<form:errors path="confirmaSenha" cssClass="alert alert-danger" />
			</div>
			<button type="submit" class="btn-primary">
				<fmt:message key="user.form.button" />
			</button>
		</form:form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$().ready(function() {
			setTimeout(function() {
				$('.alert-danger').hide();
			}, 5000);
		});
	</script>

</tags:pageTemplate>