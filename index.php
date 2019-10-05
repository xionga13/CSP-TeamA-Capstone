<?php include('/components/session.php'); ?>
<?php include '/components/header.php'; ?>
<body>
	<div class="container">
		<?php include '/components/navigationBar.php'; ?>
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
		
		<?php include '/components/footer.php'; ?>
	</div>
	<?php include '/components/scripts.php'; ?>
</body>
</html>
