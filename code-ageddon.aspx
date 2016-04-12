<%@ Page Language="C#" AutoEventWireup="true" CodeFile="code-ageddon.aspx.cs" Inherits="code_ageddon" %>

<!DOCTYPE html>
<!-- saved from url=(0040)http://getbootstrap.com/examples/cover/# -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Code-ageddon</title>
    <link rel="icon" type="image/x-icon" href="images/fav.png" />
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="css/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
  </head>

  <body style="background-image:url('images/a.jpg'); background-color:black;">

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">Code-Ageddon</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="lead.aspx">Leader Board</a></li>
                  <li><a href="logout.aspx">LogOut</a></li>
                  <li><a>Questions Answered: <%=Session["level"].ToString() %></a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
          <%-- <h1 class="cover-heading" id="head" runat="server">Welcome to Code-Ageddon</h1>--%>
              <div class="alert alert-success alert-dismissible" role="alert" runat="server" id="successAlert" visible="false"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Congratulations!</strong> Your answer was correct. Try solving the next question!</div>
              <div class="alert alert-danger alert-dismissible" role="alert" runat="server" id="failureAlert" visible="false"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>OOPS!</strong> Seems that your answer was wrong! Keep trying!</div>
            <p class="lead">Solve the following to proceed:</p>
             
            <p class="lead">
             <%--<a href="#" class="btn btn-lg btn-default" data-toggle="modal" data-target="#registerModal" >Let the Hacking Begin</a>--%>
                <img src="images/<%=HiddenField1.Value %>" />

            </p>
          </div>
           <%-- <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <p class="lead">Solve the following to proceed:</p>
                    <img src="images/ludis.jpg" />
                </div>
                <div class="col-md-2"></div>
            </div>--%>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <form runat="server" class="form-inline">
                         <asp:HiddenField ID="HiddenField1" runat="server" />
                    <div class="form-group">
                        <asp:TextBox ID="answertxt" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                        <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" CssClass="btn btn-primary btn-large"  />
                        </form>
                </div>
                <div class="col-md-2"></div>
            </div>
         

          <div class="mastfoot">
            <div class="inner">
              <p>All Rights Reserved <a href="http://jssmmil.in/">MMIL</a> @ 2016.</p>
            </div>
          </div>

        </div>

      </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="css/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="css/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="css/ie10-viewport-bug-workaround.js"></script>
  

</body></html>
