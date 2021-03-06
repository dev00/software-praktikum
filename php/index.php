<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Unsere Schule</title>
	    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="dist/css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script src="dist/js/jquery-1.11.1.min.js"></script>
	<script src="dist/js/script.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>	
</head>
<body>
	<div class="container">
		<?php include('navigation.php');?>		
		<!--Main-->
		<div class="row content">
			<!--Section Navigation-->
			<div class="col-md-2 col-sm-3 col-xs-9 hidden-print sidenav">
				<nav id="sidenav">
					<ul>
					<?php
						include('pizza_name_sql.php');
					?>
					</ul>
				</nav>
			</div>

		<!--/Section Navigation-->
		<!--Site-Content-->
			<div class="col-md-10 col-sm-9 col-xs-12">
				<?php
					include('pizza_sql.php');
				?>				
			</div>	
		</div>
		<!--/Main-->	
	</div>
</body>? </html>
