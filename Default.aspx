<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<!-- saved from url=(0040)http://getbootstrap.com/examples/cover/# -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <%--<link rel="icon" href="http://getbootstrap.com/favicon.ico">--%>

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
                  <li><a href="#" data-toggle="modal" data-target="#myModal">LogIn</a></li>
                  <li><a href="#" data-toggle="modal" data-target="#registerModal">Register</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading" id="head" runat="server">Welcome to Code-Ageddon</h1>
            <p class="lead">Code-Ageddon is an online coding challenge that consists of puzzles and problems that you will solve through coding. Feel free to choose a programming language of your choice. The participant who completes most of the questions in minimum time wins. Results will be declared on 10th April, 12:00 PM. ALL THE BEST!.</p>
            <p class="lead">
              <a href="#" class="btn btn-lg btn-default" data-toggle="modal" data-target="#registerModal" >Let the Hacking Begin</a>
            </p>
          </div>
            <form runat="server">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" style="color:black">Login to your Account</h4>
      </div>
      <div class="modal-body">
          
               <div class="form-group">
                   <asp:TextBox ID="loginEmailtxt" runat="server" placeholder="example@domain.com" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="form-group">
                   <asp:TextBox ID="loginPasstxt" runat="server"  CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
               </div>
             
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <asp:Button ID="loginButton" runat="server" class="btn btn-primary" Text="Login" OnClick="loginButton_Click" UseSubmitBehavior="false" data-dismiss="modal" />
      </div>
    </div>
  </div>
</div>
            <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="H1" style="color:black">Create your Account</h4>
      </div>
      <div class="modal-body">
                <div class="form-group">
                   <asp:TextBox ID="regName" runat="server" placeholder="John Doe" CssClass="form-control" required="required"></asp:TextBox>
               </div>

               <div class="form-group">
                   <asp:TextBox ID="regEmail" runat="server" placeholder="example@domain.com" CssClass="form-control" required="required" type="email"></asp:TextBox>
               </div>
           <div class="form-group">
                   <asp:TextBox ID="regzealId" runat="server" placeholder="Zealicon Id" CssClass="form-control" required="required"></asp:TextBox>
               </div>
          <div class="form-group">
                   <asp:TextBox ID="regContact" MaxLength="10" onkeypress="return isNumber(event)" onpaste="return false" runat="server" placeholder="Contact Number" CssClass="form-control" required="required"></asp:TextBox>
               </div>
               <div class="form-group">
                   <asp:TextBox ID="regPass" runat="server"  CssClass="form-control" TextMode="Password" placeholder="Password" required="required"></asp:TextBox>
               </div>
           <div class="form-group">
                   <asp:TextBox ID="regconfirmPass" runat="server" placeholder="Confirm Password" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
               </div>
             
           
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <asp:Button ID="regButton" runat="server" class="btn btn-primary" Text="Register" OnClick="regButton_Click" />
      </div>
    </div>
  </div>
</div>
                </form>

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
