<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="custom"%>
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


<div class="row">
	<div class="col-md-12 col-xs-12">
		<form:form class="form-inline" action="/admin/amount" method="GET" modelAttribute="filter">
			<custom:hiddenInputs excludeParams="search"/>
			<div class="form-group">
		
				<form:input path="search" class="form-control" placeholder="Search"/>
			
			</div>
			<button type="submit" class="btn btn-primary">Ok</button>
		</form:form>
	</div>

</div>



<div class="row">

<br>
<br>
</div>
<div class="row">
	<div class="col-md-3 col-xs-12">
		<form:form class="form-horizontal filter" action="/admin/amount" method="GET" modelAttribute="filter">
			<custom:hiddenInputs excludeParams="_ingredientIds, _systemIds, systemIds, ingredientIds, max, min"/>
			<div class="form-group">
				<div class="col-sm-6">
					<form:input path="min" class="form-control" placeholder="Min"/>
				</div>
				<div class="col-sm-6">
					<form:input path="max" class="form-control" placeholder="Max"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-12">Measuring systems</label>
				<div class="col-sm-12">
					<form:checkboxes items="${measuringSystems}" path="systemIds" itemLabel="name" itemValue="id"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-12">Ingredients</label>
				<div class="col-sm-12">
					<form:checkboxes items="${ingredients}" path="ingredientIds" itemLabel="name" itemValue="id"/>
				</div>
			</div>
			
			
			
			<button type="submit" class="btn btn-primary">Ok</button>
		</form:form>
	</div>
	<div class="col-md-7 col-xs-12">
		<div class="row">
			<div class="col-md-12 col-xs-12">
				<form:form class="form-horizontal" action="/admin/amount"
					method="POST" modelAttribute="amount">
					<custom:hiddenInputs excludeParams="ingredient, amount, system, recipe,  name"/>
			
					<div class="form-group">
						<label class="col-sm-10 col-sm-offset-2 control-label"
							for="ingredient" style="color: red; text-align: left;"><form:errors
								path="ingredient" /></label>
					</div>
					<div class="form-group">
						<label for="ingredient" class="col-sm-2 control-label">Тип товара</label>
						<div class="col-sm-6">
							<form:select class="form-control" path="ingredient"
								id="ingredient" items="${ingredients}" itemValue="id"
								itemLabel="name" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-6 col-sm-offset-2 control-label"
							for="amount" style="color: red; text-align: left;"><form:errors
								path="amount" /></label>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Price</label>
						<div class="col-sm-6">
							<form:input type="text" class="form-control" path="amount"
								id="name" />
						</div>
					</div>
					
			 		<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Name</label>
						<div class="col-sm-6">
							<form:input type="text" class="form-control" path="name"
								id="name" />
						</div>
					</div>
					
					
				 		<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Recipe</label>
						<div  class="col-sm-10">
							<form:input   style="width: 400px; height: 100px;" type="text" class="form-control" path="recipe"
								id="name" />
						</div>
					</div>
				
					
					
					
					<div class="form-group">
						<label for="ms" class="col-sm-2 control-label">Доза</label>
						<div class="col-sm-6">
							<form:select class="form-control" path="system" id="ms"
								items="${measuringSystems}" itemLabel="name" itemValue="id" />
						</div>
					</div>
				<!-- 	
					<div class="form-group">
    					<label for="file" class="col-sm-2 control-label">Image</label>
    					<div class="col-sm-10">
      						<input type="file" name="file" id="file">
    					</div>
  					</div>
					 
					 -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">Create</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
		<div class="row">
	
		<div class="col-md-2 col-xs-2">
				<h5>Name</h5>
			</div>
			<div class="col-md-2 col-xs-2">
				<h5>Price</h5>
			</div>
			
			<div class="col-md-2 col-xs-2">
				<h5>Доза</h5>
			</div>
			<div class="col-md-3 col-xs-3">
				<h5>Тип товара</h5>
			</div>
			<div class="col-md-2 col-xs-2">
				<h5>Options</h5>
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
				<div class="col-md-4 col-xs-4">
					<a class="btn btn-warning" href="/admin/amount/update/${amount.id}<custom:allParams/>">update</a>
					
				<a class="btn btn-danger" href="/admin/amount/delete/${amount.id}<custom:allParams/>">delete</a>
				</div>
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
	<div class="col-md-2 col-xs-12">
	
	</div>
	
		<div class="col-md-10 col-xs-12">
		
			<div class="row">
					<div class="col-md-2 col-xs-2"> </div>
				
					<div class="col-md-2 col-xs-2">     	<h5>Name</h5>		</div>
						
					<div class="col-md-6 col-xs-6">	<h5>Instruction</h5>  </div>
					<div class="col-md-2 col-xs-2"> </div>
					
			</div>
		
		
		<c:forEach items="${page.content}" var="amount">
			<div class="row">
			
		 <%-- 	 <div class="col-md-4 col-xs-4"><img src="/images/ingredient/${amount.id}.jpg?version=${amount.version}" width="60%"></div>
			 --%>	 
				 <div class="col-md-2 col-xs-2"></div> 
				
	   		   	<div  class="col-md-2 col-xs-2">${amount.name}</div> 
	   		   	
	   		   
				<div  class="col-md-6 col-xs-6">${amount.recipe}</div>
				<div class="col-md-2 col-xs-2"> </div>
			</div>
		</c:forEach>
		</div>
		
</div>	
		


<div class="row">
	<div class="col-md-12 col-xs-12 text-center">
		<custom:pageable page="${page}" cell="<li></li>"
			container="<ul class='pagination'></ul>" />
	</div>
</div>
