<%@ include file="navbar.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/student/makeRequest.css" type="text/css">
    <div class="request">
       
        <h1 style="text-align: center;">Create New Request</h1>
        <form:form  action="view" modelAttribute="departments" method="post">
        
	        <div class="form-group row">
				  <label for="example-text-input" class="col-sm-2 col-form-label">Report To</label>
				  <div class="col-sm-10">
					    <select class="form-control" name="id">
					    <option value="0">-- Select Department ---</option>
						    <c:forEach items="${department}" var="departments">
						    	<option value="${departments.id}">${departments.departmentName}</option>
						    </c:forEach>
					    </select>
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
			    <input class="form-control" type="date" name="dateCreated" value="${date}" id="example-date-input" readonly />
			  </div>
			</div>
			
			<div class="form-group row">
				  <label for="example-title-input" class="col-sm-2 col-form-label">Request Title</label>
				  <div class="col-sm-10">
				    <input class="form-control" type="text" name="requestTitle" id="example-title-input" required />
				  </div>
			</div>
			
			
			<div class="form-group row">
			  <label for="example-content-input" class="col-sm-2 col-form-label">Request Content</label>
			  <div class="col-sm-10">
			    <textarea class="form-control"  name="requestContent" id="example-content-input" required></textarea>
			  </div>
			</div>
			
			<div class="form-group row">
				  <label for="example-filet-input" class="col-sm-2 col-form-label">Attachment (If any)</label>
				  <div class="col-sm-10">
				    <input class="form-control" type="file" name="attachmentName" id="example-file-input">
				  </div>
			</div>
			
			<div style="text-align: center;">
				<button class="btn btn-primary">Send</button>

   			</div>
    	</form:form>
    </div>
