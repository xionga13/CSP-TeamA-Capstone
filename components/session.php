<?php
	include ('dataAccess/dbConnection.php');
	session_start();

	#Check to see if the user is an authenticated admin, if so, redirect to the admin site
	if(isset($_SESSION['admin'])){
		#header('location: admin/home.php');
	}

	#Check to see if the user is an authenticated shopper, if so, redirect to the admin site
	if(isset($_SESSION['user'])){
		$conn = $pdo->open();

		try{
			echo "Connected ok w/ authenticated user!";
		}
		catch(PDOException $e){
			echo "There is some problem in connection: " . $e->getMessage();
		}

		$pdo->close();
	}
?>
