<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/navbar-top-fixed.css" type="text/css">

<div class="nav-content">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/app/images/logo.png" /></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="${param.home}"><a href="${pageContext.request.contextPath}/"><span class="glyphicon glyphicon-home"></span> Home<span class="sr-only">(current)</span></a></li>
                        <li class="${param.makeRequest}"><a href="${pageContext.request.contextPath}/request">Make Request</a></li>
                        <li class="${param.viewRequest}"><a href="${pageContext.request.contextPath}/view">View Request </a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>${student.studentName}</a></li>
                        <li data-toggle="modal" data-target="#myModal"><a href="${pageContext.request.contextPath}/studentLogin">Sign Out</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </div>
    <br/> <br/> <br/> <br/>