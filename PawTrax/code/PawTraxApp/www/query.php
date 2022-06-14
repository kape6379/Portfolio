<?php
$servername = "localhost:3306";
$username = "root";
$password = "University!6";
$dbname = "PawTrax";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "select * from dog;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "Dog Name: " . $row["Dog_Name"]. "<br>";
  }
} else {
  echo "0 results";
}
$conn->close();
?>