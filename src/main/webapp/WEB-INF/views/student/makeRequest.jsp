<jsp:include page="navbar.jsp">
	<jsp:param name="makeRequest" value="active"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/student/makeRequest.css" type="text/css">
    <div class="request">
       
        <h1 style="text-align: center;">Create New Request</h1>
        <form:form  action="?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" commandName="request">
        
	        <div class="form-group row">
				  <label for="example-text-input" class="col-sm-2 col-form-label">Report To</label>
				  <div class="col-sm-10">
					    <select class="form-control" name="id">
					    <option value="0">-- Select Department ---</option>
						    <c:forEach items="${department}" var="departments">
						    	<option value="${departments.id}">${departments.departmentName}</option>
						    </c:forEach>
					    </select>
					    <form:errors path="id" cssClass="error" element="div" />
				  </div>
			</div>
	        
			 <div class="form-group row">
				  <label for="example-text-input" class="col-sm-2 col-form-label">Student ID</label>
				  <div class="col-sm-10">
				    <input class="form-control" type="text" value="${student.id}" name="studentId" readonly />
				  </div>
			</div>
		
			
			<div class="form-group row">
				  <label for="example-name-input" class="col-sm-2 col-form-label">Student name</label>
				  <div class="col-sm-10">
				    <input class="form-control" type="text" value="${student.studentName}" name="studentName" readonly />
				  </div>
			</div>
			
			
			<div class="form-group row">
			  <label for="example-date-input" class="col-sm-2 col-form-label">Date</label>
			  <div class="col-sm-10">
			    <input class="form-control" type="date" name="dateCreated" value="${date}" id="example-date-input"  />
			    <form:errors path="dateCreated" cssClass="error" element="div" />
			  </div>
			</div>
			
			<div class="form-group row">
				  <label for="example-title-input" class="col-sm-2 col-form-label">Request Title</label>
				  <div class="col-sm-10">
				    <input class="form-control" type="text" name="requestTitle" id="example-title-input" required />
				    <form:errors path="requestTitle" cssClass="error" element="div" />
				  </div>
			</div>
			
			
			<div class="form-group row">
			  <label for="example-content-input" class="col-sm-2 col-form-label">Request Content</label>
			  <div class="col-sm-10">
			    <textarea class="form-control"  name="requestContent" id="example-content-input" required></textarea>
			     <form:errors path="requestContent" cssClass="error" element="div" />
			  </div>
			</div>
		
			<div class="form-group row">
				  <label for="example-filet-input" class="col-sm-2 col-form-label">Attachment (If any)</label>
				  <div class="col-sm-10">
				    <input class="form-control" type="file" name="file" id="example-file-input"> 
				    <%--   <form:input cssClass="form-control" type="file" path="file" /> --%>
				  </div>
			</div>
			
			
			
			<div style="text-align: center;">
				<button class="btn btn-primary">Send</button>

   			</div>
   			
   			<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
    	</form:form>
    </div>
