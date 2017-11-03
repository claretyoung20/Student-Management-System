<%@ include file="navbar.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/student/makeRequest.css" type="text/css">


 <div class="request">

	<table class="table">
	  <tbody>
	    
	    <tr>
	    	<td>
	    		<th>Request Department</th>
	    	</td>
	    	<td>${request.department.departmentName}</td>
	    </tr>
	    
	      <tr>
	    	<td>
	    		<th>Student ID</th>
	    	</td>
	    	<td>${request.student.id}</td>
	    </tr>
	   
	    <tr>
	    	<td>
	    		<th>Student Name</th>
	    	</td>
	    	<td>${request.student.studentName }</td>
	    </tr>
	    
	      <tr>
	    	<td>
	    		<th>Date Created</th>
	    	</td>
	    	<td>${request.dateCreated}</td>
	    </tr>
	    
	    <tr>
	    	<td>
	    		<th>Request Title</th>
	    	</td>
	    	
	    	<td>${request.requestTitle }</td>
	    </tr>
	    
	      <tr>
	    	<td>
	    		<th>Request Content</th>
	    	</td>
	    	<td>${request.requestContent}</td>
	    </tr>
	   
	    <tr>
	    	<td>
	    		<th>Request Status</th>
	    	</td>
	    	
	    	<c:choose>
	    	<c:when test="${request.requestStatus == 1}">
	    		<td style="color: green;">Completed</td>
	    	</c:when>
	    	
	    	<c:otherwise>
	    		<td style="color: orange;">In process</td>
	    	</c:otherwise>
	    		
	    	</c:choose>
	    	
	    </tr>
	    
	      <tr>
	    	<td>
	    		<th>close Date</th>
	    	</td>
	    	
	    	<c:choose>
	    	<c:when test="${request.dataClose != null}">
	    		<td>${request.dataClose}</td>
	    	</c:when>
	    	
	    	<c:otherwise>
	    		<td style="color: red">N/A</td>
	    	</c:otherwise>
	    		
	    	</c:choose>   	
	    </tr>
	    
	    <tr>
	    	<td>
	    		<th>Attachment</th>
	    	</td>
	    	<td><button class="btn btn-primary">Download</button></td>
	    </tr>
	    
	      <tr>
	    	<td>
	    		<th>School Solution</th>
	    	</td>
	    	<c:choose>
	    	<c:when test="${request.requestSolution != null}">
	    		<td>${request.requestSolution}</td>
	    	</c:when>
	    	
	    	<c:otherwise>
	    		<td style="color: red">N/A</td>
	    	</c:otherwise>
	    		
	    	</c:choose> 
	    </tr>
	    <tr>
	    	<td>
	    		<th>Solve By</th>
	    	</td>
	    	<c:choose>
	    	<c:when test="${request.staff.stafftName != null}">
	    		<td>${request.staff.stafftName}</td>
	    	</c:when>
	    	
	    	<c:otherwise>
	    		<td>N/A</td>
	    	</c:otherwise>
	    		
	    	</c:choose> 
	    </tr>
	  </tbody>
	</table>
	
</div>
