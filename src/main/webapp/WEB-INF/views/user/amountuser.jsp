<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	.filter .control-label{
		text-align: left;
	}
	.filter span{
		display: block;
	}
	
	
	
 	.box1 { 
    background: #f0f0f0; /* Цвет фона */
    width: 300px; /* Ширина блока */
    padding: 10px; /* Поля */
    border: 2px solid #000; /* Параметры рамки */
   } */
	
</style>



	<header id="header">
		<div class="container">
			<a href="index.html" id="logo" title="Diana’s jewelry">Diana’s jewelry</a>
			<div class="right-links">
				<ul>
					<li><a href="/user/cart"><span class="ico-products"></span>3 products, $4 500.00</a></li>
					<li><a href="/user/cart"><span class="ico-account"></span>Account</a></li>
					<li><a href="/login"><span class="ico-signout"></span>Sign out</a></li>
				</ul>
			</div>
		</div>
		<!-- / container -->
	</header>
	<!-- / header -->

	<nav id="menu">
		<div class="container">
			<div class="trigger"></div>
			<ul>
				<li><a href="/user/amountuser">Products</a></li>
				<sec:authorize access="isAuthenticated()">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="/admin">Admin</a> </li>
		<li>	<a href="/human">People</a></li>
			</sec:authorize>
			<form:form action="/logout" method="POST">
			<button type="submit" class="btn btn-danger">Logout</button>
		</form:form>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
			<li><a href="/login">Login</a></li>
			<li>	<a href="/registration">Registration</a></li>
</sec:authorize>	
			</ul>
		</div>
		<!-- / container -->
	</nav>


<div class="row">

<br>
<br>
</div>
<div class="row">
	<div class="col-md-12 col-xs-12">
		<form:form class="form-inline" action="/user/amountuser" method="GET" modelAttribute="filter">
			<custom:hiddenInputs excludeParams="search"/>
			<div class="form-group">
		
				<form:input path="search" class="form-control"    placeholder="I`m looking for...."/>
			
			</div>
			<button type="submit" class="btn btn-primary">Ok</button>
		</form:form>
	</div>

</div>

<br>
<br>


<div class="row">
	<div class="col-md-3 col-xs-12">
		<form:form class="form-horizontal filter" action="/user/amountuser" method="GET" modelAttribute="filter">
			<custom:hiddenInputs excludeParams="_ingredientIds, _systemIds, systemIds, ingredientIds, max, min"/>
			<div class="form-group">
				<div class="col-sm-6">
					<form:input path="min" class="form-control" placeholder="Get Min price"/>
				</div>
				<div class="col-sm-6">
					<form:input path="max" class="form-control" placeholder="Get Max price "/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-12">  <font color="#7da0cd"> Measuring systems  </font></label>
				<div class="col-sm-12">
					<form:checkboxes items="${measuringSystems}" path="systemIds" itemLabel="name" itemValue="id"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-12"> <font color="#7da0cd"> Ingredients  </font></label>
				<div class="col-sm-12">
					<form:checkboxes items="${ingredients}" path="ingredientIds" itemLabel="name" itemValue="id"/>
				</div>
			</div>
			
			
			
			<button type="submit" class="btn btn-primary">Ok</button>
		</form:form>
	</div>
	<div class="col-md-7 col-xs-12">
		
		<div class="row">
	
		<div class="col-md-2 col-xs-2">
			 	<h5><font color="#7da0cd"> Наименование </font></h5>
			</div>
			<div class="col-md-2 col-xs-2">
				<h5> <font color="#7da0cd">  Цена  </font> </h5>
			</div>
			
			<div class="col-md-2 col-xs-2">
				<h5>  <font color="#7da0cd">  Граматура  </font></h5>
			</div>
			<div class="col-md-2 col-xs-2">
				<h5>  <font color="#7da0cd"> Тип товара  </font></h5>
			</div>
			<div class="col-md-4 col-xs-4">
				<h5>  <font color="#7da0cd"> Инструкция  </font></h5>
			</div>
			
		</div>
		<c:forEach items="${page.content}" var="amount">
			<div class="row">
			
		 <%-- 	 <div class="col-md-4 col-xs-4"><img src="/images/ingredient/${amount.id}.jpg?version=${amount.version}" width="60%"></div>
			 --%>	 
			 
				<div class="col-md-2 col-xs-2">${amount.name}</div> 
				<div class="col-md-2 col-xs-2"><p> ${amount.amount} $</p></div>
			 
				<div class="col-md-2 col-xs-2">${amount.system.name}</div>
				<div class="col-md-2 col-xs-2">${amount.ingredient.name}</div>
			<div class="col-md-4 col-xs-4"> ${amount.recipe}</div>
			</div>
		</c:forEach>
		
	<!-- ADD RECIPE then later add photo-->	
	<br>
	<br>
	<br>
	<br>
	
<!-- END OF GENERAL ROW CLASS !!!!!!!	.	
 -->	</div>


	




	<div class="col-md-2 col-xs-12">
		<div class="row">
					<div class="col-md-6 col-xs-6 text-center">
						<div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
								data-toggle="dropdown">
								Sort <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<custom:sort innerHtml="Amount asc" paramValue="amount" />
								<custom:sort innerHtml="Amount desc" paramValue="amount,desc" />
								<custom:sort innerHtml="Ingredient name asc" paramValue="ingredient.name" />
								<custom:sort innerHtml="Ingredient name desc" paramValue="ingredient.name,desc" />
							</ul>
						</div>
					</div>
					<div class="col-md-6 col-xs-6 text-center">
						<custom:size posibleSizes="1,2,5,10" size="${page.size}" />
					</div>
				</div>
	</div>
</div>


		


<div class="row">
	<div class="col-md-12 col-xs-12 text-center">
		<custom:pageable page="${page}" cell="<li></li>"
			container="<ul class='pagination'></ul>" />
	</div>
</div>
