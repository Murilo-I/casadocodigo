<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:url value="/resources/imagens" var="imgPath" />

<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">

		<c:if test="${not empty message }">
			<h1 class="cdc-call">${message }</h1>
		</c:if>
		<c:if test="${empty message }">
			<h1 class="cdc-call"><fmt:message key="home.promotions"/></h1>
		</c:if>

		<ul class="clearfix book-collection">

			<c:forEach items="${produtos }" var="produto">
				<li><a
					href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build() }"
					class="block clearfix">
						<h2 class="product-title">${produto.titulo }</h2> <img width="143"
						height="202"
						src="https://cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181"
						alt="Java 8 Prático" title="Java 8 Prático" /> <small
						class="buy-button">Compre</small>
				</a></li>
			</c:forEach>

		</ul>

		<h2 class="cdc-call"><fmt:message key="home.differentials"/></h2>

		<ul id="cdc-diferenciais" class="clearfix">
			<li class="col-left">
				<h3><fmt:message key="home.unlock.title" /></h3>
				<p>
					<img alt="unlock" src="${imgPath }/destrave.png" id="sprite-drm">
					<fmt:message key="home.unlock" />
				</p>
			</li>
			<li class="col-right">
				<h3><fmt:message key="home.renome.title" /></h3>
				<p>
					<img alt="talk with them" src="${imgPath }/autor.png"
						id="sprite-renome">
					<fmt:message key="home.renome" />
				</p>
			</li>
			<li class="col-left">
				<h3><fmt:message key="home.updates.title" /></h3>
				<p>
					<img alt="updates" src="${imgPath }/atualize.png"
						id="sprite-atualizacoes">
					<fmt:message key="home.updates" />
				</p>
			</li>
			<li class="col-right">
				<h3><fmt:message key="home.review.title" /></h3>
				<p>
					<img alt="books review" src="${imgPath }/curadoria.png"
						id="sprite-caelum">
					<fmt:message key="home.review" />
			</li>
		</ul>
	</section>

</tags:pageTemplate>
