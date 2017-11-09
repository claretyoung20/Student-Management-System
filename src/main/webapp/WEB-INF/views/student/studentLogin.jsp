<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/signin.css" type="text/css">

<div class="container">

      <form:form cssClass="form-signin"  method="post" action="studentLogin" commandName="student">
        <h2 class="form-signin-heading">Please sign in</h2>
        	
        <div class="form-group row">
	        <input type="text" name="id" class="form-control" placeholder="Student ID" />
	        <form:errors path="id" cssClass="error" element="div" />
	        <br/>
	        <input type="password"  name="password" class="form-control" placeholder="Password"  />
	        <form:errors path="password" cssClass="error" element="div" />
	        <div class="checkbox">
	          <label>
	         <!--    <input type="checkbox" value="remember-me"> Remember me -->
	          </label>
	        </div>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	      </div>
      </form:form>

    </div> <!-- /container -->
  </body>