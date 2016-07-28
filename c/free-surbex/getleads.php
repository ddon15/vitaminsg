
<?php  
	include 'helper.php';
	
	if (!Helper::hasPageAccess(@$_GET['access_token'])) {
		header('HTTP/1.0 403 Forbidden');
		echo 'You are forbidden to access this page!. Page access key is invalid.'; exit;
	}

	$leads = Helper::getLeads();
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
<!--     <link rel="icon" href="../../favicon.ico">
 -->
    <title>Campaign Leads Management</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Campaign Leads Management</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
           <!--  <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li> -->
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">

      <div class="row">
      	<table class="display" cellspacing="0" width="100%">
      	        <thead>
      	            <tr>
      	                <th>Name</th>
      	                <th>Email</th>
      	                <th>Mobile</th>
      	                <th>Address</th>
      	            </tr>
      	        </thead>
      	        <tfoot>
      	            <tr>
      	                <th>Name</th>
      	                <th>Email</th>
      	                <th>Mobile</th>
      	                <th>Address</th>
      	            </tr>
      	        </tfoot>
      	        <tbody>
      	        	<?php foreach ($leads as $each): ?>
      	        		<tr>
      	        		    <td><?php echo $each->mname; ?></td>
      	        		    <td><?php echo $each->memail; ?></td>
      	        		    <td><?php echo $each->mmobile; ?></td>
      	        		    <td><?php echo nl2br($each->maddress); ?></td>
      	        		</tr>
      	        	<?php endforeach; ?>
      	        </tbody>
      	    </table>
      </div>

    </div><!-- /.container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
    	$(document).ready(function() {
    	    $('table').DataTable();
    	} );
    </script>
  </body>
</html>
