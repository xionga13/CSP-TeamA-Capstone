<?php
include('components/session.php');
?>
<!DOCTYPE html>
<html>
<head>

  	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<title>Ol' General Store</title>
	
</head>
<body>
	<h1>Testing Page</h1>

	<?php
	echo "Hello World!";
	$sql = file_get_contents('dataAccess/sql/TEST.sql');
	$conn = $pdo->open();
	$result = $conn->prepare($sql);
	$result->execute();
	foreach ($result as $row) {
		echo "<p>" . $row['TABLE_TYPE'] . "</p>";
	}
	$pdo->close();
	?>

</body>
</html>
