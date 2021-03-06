<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/jsp/inc/top.jsp" />
<jsp:include page="/WEB-INF/jsp/inc/menu.jsp" />

<div id="shop_produto">

<h3>${prod.name}</h3>
<table cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div id="prod_imagem"><img src="/img/prod/<fmt:formatNumber type="number" maxIntegerDigits="5" pattern="00000" value="${prod.id}" />_01.jpg" border="0"/></div>
			<c:forEach begin="1" end="${prod.numberOfImages}" var="imgIndex">
			<a href="javascript:void(0);" onclick="changeProdImage(this);"><img src="/img/prod/<fmt:formatNumber type="number" maxIntegerDigits="5" pattern="00000" value="${prod.id}" />_<fmt:formatNumber type="number" maxIntegerDigits="2" pattern="00" value="${imgIndex}" />.jpg" width="75" height="75" border="0"/></a>
			</c:forEach>
		</td>
		<td valign="top">
		<div id="prod_price_box">
			<c:if test="${prod.oldPrice != null}">
			<span id="prod_preco_antigo"><fmt:message key="lbl.from" />: <fmt:message key="currency.symbol" /> <fmt:formatNumber type="number" pattern="#,##0.00" value="${prod.oldPrice}" /></span><br/>
			</c:if>
			<span id="prod_preco"><fmt:message key="lbl.for" />: <fmt:message key="currency.symbol" /> <fmt:formatNumber type="number" pattern="#,##0.00" value="${prod.price}" /></span><br/>
			<c:if test="${prod.oldPrice != null}">
			<span id="prod_preco_economia"><fmt:message key="lbl.save" /> <fmt:message key="currency.symbol" /> <fmt:formatNumber type="number" pattern="#,##0.00" value="${prod.oldPrice-prod.price}" /> (<fmt:formatNumber type="number" pattern="#,##0.00" value="${100-(prod.price*100/prod.oldPrice)}" />%)</span><br/>
			</c:if>
			<!--
			<span id="prod_parcelamento">Boleto ou depósito: R$ 25,00 (8% de desconto)</span><br/>
			-->
			<br/>
			<c:if test="${not empty prod.brand}">
			<span id="prod_autor"><fmt:message key="lbl.brand" />: ${prod.brand}</span><br/>
			</c:if>
			<c:if test="${not empty prod.size}">
			<span id="prod_autor"><fmt:message key="lbl.size" />: ${prod.size}</span><br/>
			</c:if>
			<c:if test="${not empty prod.color}">
			<span id="prod_autor"><fmt:message key="lbl.color" />: ${prod.color}</span><br/>
			</c:if>
			<c:if test="${not empty prod.author}">
			<span id="prod_autor"><fmt:message key="lbl.author" />: ${prod.author}</span><br/>
			</c:if>
			<c:if test="${not empty prod.isbn}">
			<span id="prod_isbn"><fmt:message key="lbl.isbn" />: ${prod.isbn}</span><br/>
			</c:if>
			<c:if test="${not empty prod.weight}">
			<span id="prod_autor"><fmt:message key="lbl.weight" />: ${prod.weight}</span><br/>
			</c:if>
			<c:if test="${not empty prod.dimensions}">
			<span id="prod_autor"><fmt:message key="lbl.dimensions" />: ${prod.dimensions}</span><br/>
			</c:if>
			<br/>
			
			<!--
			<div id="prod_parcelamento_box">
				<span id="prod_parcelamento">Parcelamento no cartão de crédito</span>
				<table id="parcelamento">
					<tr><th colspan="2">Parcelas</th></tr>
					<tr><td>1 x R$ 30,00</td><td>7 x R$ 4,30</td></tr>
					<tr><td>2 x R$ 15,00</td><td>8 x R$ 3,75</td></tr>
					<tr><td>3 x R$ 10,00</td><td>9 x R$ 3,11</td></tr>
					<tr><td>4 x R$ 7,50</td><td>10 x R$ 3,00</td></tr>
					<tr><td>5 x R$ 6,00</td><td>11 x R$ 2,80</td></tr>
					<tr><td>6 x R$ 5,00</td><td>12 x R$ 2,50</td></tr>
				</table>
				<span id="prod_parcelamento_juros">* (juros de 1,99% ao mês)</span>
			</div>
			-->
			
			<br/>
			<a href="/shop/add/${prod.id}"><img src="/img/bt_comprar_produto.gif" border="0"></a>
		</div>
		</td>
	</tr>
</table>
<div id="prod_caracteristicas">
<h4><fmt:message key="title.prod.description" /></h4><br/>
${prod.description}
</div>
<br/>
<c:if test="${not empty prod.tags}">
<div id="prod_tags">
<h4><fmt:message key="title.tags" /></h4><br/>
<c:forEach items="${prod.tags}" var="tag"><a href="/shop/tag/${tag}">${tag}</a> &nbsp; </c:forEach>
</div>
</c:if>
<br/>
<c:if test="${not empty products}">
<div id="prod_ofertas">
<h4><fmt:message key="title.offers" /></h4><br/>
<c:forEach items="${products}" var="prodRelated" varStatus="st">
<a href="/shop/product/${prodRelated.id}" class="prod_oferta"><img src="/img/prod/<fmt:formatNumber type="number" maxIntegerDigits="5" pattern="00000" value="${prodRelated.id}" />_thumb.jpg" width="75" height="75" border="0"><br/>
<span class="oferta_nome">${prodRelated.shortName}</span><br/><span class="oferta_preco_antigo"><fmt:message key="lbl.from" />: <fmt:message key="currency.symbol" /> <fmt:formatNumber type="number" pattern="#,##0.00" value="${prodRelated.oldPrice}" /></span><br/>
<span class="oferta_preco"><fmt:message key="lbl.for" />: <fmt:message key="currency.symbol" /> <fmt:formatNumber type="number" pattern="#,##0.00" value="${prodRelated.price}" /></span></a>
<c:if test="${st.index % 4 == 3 && st.index > 0}"><hr/></c:if>
</c:forEach>
</div>
</c:if>
</div>

<jsp:include page="/WEB-INF/jsp//inc/footer.jsp" />
