<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
// define variables and set to empty values
$nameErr = "";
$name =$password="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (empty($_POST["name"])) {
    $nameErr = "Name is required";
  } else {
    $name = $_POST["name"];
    // check if name only contains letters and whitespace
    if (!preg_match("/^[A-Z][a-zA-Z -]+$/",$name)) {
      $nameErr = "Name must be from letters, dashes, spaces and must not start with dash";
    }
  }
} 
    
$password = $_POST['password'];
if (preg_match("#.*^(?=.{8,20})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*W).*$#", $password )){
echo "Your password is strong.";
}

?>

<h2>Login</h2>
<p><span class="error">* required field</span></p>
<form method="post" action="<?php echo $_SERVER["PHP_SELF"];?>">  
  <h4>User Name:</h4>
  <input type="text" name="name" value="<?php echo $name;?>">
  <span class="error">* <?php echo $nameErr;?></span>
  <br><br>
  <h4>Password:</h4>
  <input type="text" name="password" value="<?php echo $password;?>">

  
  <br><br>
  <input type="submit" name="submit" value="Submit">  
</form>

<?php
echo "<h2>Your Input:</h2>";
echo $name;

?>

</body>
</html>