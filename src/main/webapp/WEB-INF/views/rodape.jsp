<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:url value="/resources/imagens" var="logos" />

<footer id="layout-footer">
	<div class="clearfix container">
		<div id="collections-footer">
			<!-- cdc-footer -->
			<p class="footer-title">
				<fmt:message key="footer.collection" />
			</p>
			<ul class="footer-text-links">
				<li><a href="/collections/livros-de-java">Java</a></li>
				<li><a href="/collections/livros-desenvolvimento-web"><fmt:message
							key="footer.collection.web" /></a></li>
				<li><a href="/collections/livros-de-mobile">Mobile</a></li>
				<li><a href="/collections/games">Games</a></li>
				<li><a href="/collections/livros-de-front-end">Front End</a></li>
			</ul>
			<p class="footer-title">
				<fmt:message key="footer.others" />
			</p>
			<ul class="footer-text-links">
				<li><a href="/collections/livros-de-agile">Agile</a></li>
				<li><a href="/collections/outros"><fmt:message
							key="footer.others.other" /></a></li>
			</ul>
		</div>
		<div id="social-footer">
			<!-- books-footer -->
			<p class="footer-title">
				<fmt:message key="footer.links" />
			</p>
			<ul class="footer-text-links">
				<li><a href="http://livros.casadocodigo.com.br" rel="nofollow"><fmt:message
							key="footer.links.ebook" /></a></li>
				<li><a href="/pages/sobre-a-casa-do-codigo"><fmt:message
							key="footer.links.cdc" /></a></li>
				<li><a href="/pages/perguntas-frequentes"><fmt:message
							key="footer.links.quests" /></a></li>
				<li><a href="https://www.caelum.com.br"><fmt:message
							key="footer.links.caelum" /></a></li>
				<li><a href="http://www.codecrushing.com/" rel="nofollow">Code
						Crushing</a></li>
				<li><a
					href="http://www.casadocodigo.com.br/pages/politica-de-privacidade"
					rel="nofollow"><fmt:message key="footer.links.privacy" /></a></li>
			</ul>
			<p class="footer-title">
				<fmt:message key="footer.media" />
			</p>
			<ul>
				<li class="social-links"><a
					href="http://www.twitter.com/casadocodigo" target="_blank"
					id="twitter" rel="nofollow"><img alt="twitter"
						src="${logos }/twitter.png"></a></li>
				<li class="social-links"><a
					href="http://www.facebook.com/casadocodigo" target="_blank"
					id="facebook" rel="nofollow"><img alt="facebook"
						src="${logos }/facebook.png"></a></li>
			</ul>
		</div>
		<div id="newsletter-footer">
			<!-- social-footer -->
			<p class="footer-title">
				<fmt:message key="footer.news" />
			</p>
			<div id="form-newsletter">
				<form action="" method="POST" id="ss-form" class="form-newsletter">
					<ul>
						<li><input type="hidden" name="pageNumber" value="0" /><input
							type="hidden" name="backupCache" value="" /><input type="email"
							name="entry.0.single" value="" class="ss-q-short" id="entry_0"
							placeholder="<fmt:message key="footer.mail" />" /></li>
						<li><input type="submit" name="submit"
							value="<fmt:message key="footer.revice" />"
							id="submit-newsletter" /></li>
					</ul>
				</form>
				<ul>
					<li class="ie8"><a href="" rel="nofollow"><fmt:message
								key="footer.news" /></a></li>
				</ul>
			</div>
			<ul class="footer-payments">
				<li><fmt:message key="footer.pay" /></li>
				<br>
				<li class="pay-logos"><a href="http://paypal.com" id="paypal">
						<img alt="paypal" src="${logos }/paypal.png"
						style="height: 50%; width: 50%">
				</a></li>
				<li class="pay-logos"><a href="http://pagueseguro.com"
					id="pagseg"> <img alt="pagueseguro"
						src="${logos }/pagseguro.png" style="height: 70%; width: 70%"></a></li>
			</ul>
		</div>
	</div>
</footer>