<%-- <%@ include file="navbar.jsp" %> --%>
<jsp:include page="navbar.jsp">
	<jsp:param name="viewRequest" value="active"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/student/makeRequest.css" type="text/css">



 <div class="request">
		 <h3 style="text-align: center;">Student ID: ${student.id}</h3>
		 <h3 style="text-align: center;">Student Name: ${student.studentName}</h3>
	 	
	 	<form:form action="view-by-department" method="get">
		 	 <div class="form-group row">
				  <label for="example-text-input" class="col-sm-3 col-form-label">Select Department</label>
				  <div class="col-sm-9">
					    <select class="form-control" name="searchR" onchange="this.form.submit();">
						    	<option value="0">All</option>
							    <c:forEach  items="${department}" var="department">
							    
							    <c:choose>
							    	<c:when test="${selectedId != null}">
							    		<c:choose>
							    			<c:when test="${selectedId == department.id}">
							    				<option ${selected} value="${department.id}">${department.departmentName}</option>
							    			</c:when>
							    			<c:otherwise>
							    				<option value="${department.id}">${department.departmentName}</option>
							    			</c:otherwise>
							    		</c:choose>
							    	</c:when>
							    
							    	<c:otherwise>
							    		<option value="${department.id}">${department.departmentName}</option>
							    	</c:otherwise>
							    </c:choose>
							    
							    	
							    </c:forEach>
						 </select>
				  </div>
			  </div>
	   </form:form>
	   
		 <form:form action="view-by-title" method="get">
		 	 <div class="form-group row">
				  <label for="example-text-input" class="col-sm-3 col-form-label">Or enter request title:</label>
				   <div class="col-sm-7">
				    	<input class="form-control" type="text" id="${requestTitle}" name="requestTitle" id="example-text-input">
				  	</div>
				   <div class="col-sm-2">
				  		<button class="btn btn-primary" type="submit">View</button>
				  </div>
			</div>		
	   </form:form>
	 
	 	<hr/>
	 	
	 	
	 	<table class="table table-hover table-responsive">
		  <thead class="thead-inverse">
		    <tr>
		      <th>Request Title</th>
		      <th>Date Created</th>
		      <th>Close Date</th>
		      <th>Status</th>
		      <th>Report To</th>
		      <th>Detail</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${request}" var="request">
		  	<tr>
			      <td>${request.requestTitle}</td>
			      <td>${request.dateCreated}</td>
			  
			     	 <c:choose>
					    <c:when test="${request.dataClose == null}">
					       <td>N/A</td>
					    </c:when>    
					    <c:otherwise>
					         <td>${request.dataClose}</td>
				       </c:otherwise>
					 </c:choose>
			      
			      <c:if test="${request.requestStatus == 0}">
			      	<td style="color: orange;">In process</td>
			      </c:if>
			      
			      <c:if test="${request.requestStatus == 1}">
			      	<td style="color:green;">Completed</td>
			      </c:if>
			      
			      
			      <td>${request.department.departmentName}</td>
			      <td><a href="${pageContext.request.contextPath}/view/${request.id}">View</a></td>
			      
			      <td><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span></td>
		    </tr>
		     </c:forEach>
		    
		  </tbody>
		</table>
	 
	 <div></div>
 
 </div>