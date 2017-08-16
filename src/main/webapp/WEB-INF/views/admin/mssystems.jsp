<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>

<!-- 
<div class="row">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
				<li><a href="/admin/admin"><font color="#1cde2e">Admin Panel</font></a></li>
				<li><a href="/admin/index"><font  color="#ce2222" >Index Panel</font> </a></li>
					<li><a href="/admin/ingredient">Type of Product</a></li>
					<li><a href="/admin/mssystems">Measuring system</a></li>
					
					<li><a href="/admin/amount"><font  color="#ce2222" >Amount</font></a></li>
		
				</ul>
			</div>
		</div>
	</nav>
</div>
 -->
<div class="row">
	<div class="col-md-3 col-xs-12">
		<form:form class="form-inline" action="/admin/mssystems" method="GET" modelAttribute="filter">
			<custom:hiddenInputs excludeParams="search"/>
			<div class="form-group">
				<form:input path="search" class="form-control" placeholder="Search"/>
			</div>
			<button type="submit" class="btn btn-primary">Ok</button>
		</form:form>
	</div>
	<div class="col-md-7 col-xs-12">
		<div class="row">
			<div class="col-md-12 col-xs-12">
				<form:form class="form-horizontal" action="/admin/mssystems" method="POST" modelAttribute="mssystems" enctype="multipart/form-data">
			
					<div class="form-group">
						<label class="col-sm-10 col-sm-offset-2 control-label" for="name" style="color:red;text-align:left;"><form:errors path="name"/></label>
					</div>
					<div class="form-group">
    					<label for="name" class="col-sm-2 control-label">Name</label>
    					<div class="col-sm-10">
      						<form:input class="form-control" path="name" id="name"/>
    					</div>
  					</div>
  				
  					<div class="form-group">
    					<div class="col-sm-offset-2 col-sm-10">
      						<button type="submit" class="btn btn-default">Create</button>
    					</div>
  					</div>
				</form:form>
			</div>
		</div>
		<div class="row">
		
			<div class="col-md-6 col-xs-6"><h3>MS System  Gramature</h3></div>
			<div class="col-md-3 col-xs-3"><h3>Update</h3></div>
			<div class="col-md-3 col-xs-3"><h3>Delete</h3></div>
		</div>
			<c:forEach items="${page.content}" var="mssystems">
				<div class="row">
					<div class="col-md-6 ol-xs-6">${mssystems.name}</div>
					<div class="col-md-3 col-xs-3"><a class="btn btn-warning" href="/admin/mssystems/update/${mssystems.id}<custom:allParams/>">update</a></div>
					<div class="col-md-3 col-xs-3"><a class="btn btn-danger" href="/admin/mssystems/delete/${mssystems.id}<custom:allParams/>">delete</a></div>
				</div>
			</c:forEach>
	</div>
	<div class="col-md-2 col-xs-12">
		<div class="row">
					<div class="col-md-6 col-xs-6 text-center">
						<div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
								data-toggle="dropdown">
								Sort <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<custom:sort innerHtml="Name asc" paramValue="name" />
								<custom:sort innerHtml="Name desc" paramValue="name,desc" />
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