<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

require_once "config.php";

if($_SESSION['role'] != 'ADMIN'){
    header("location: error.php");
    exit;
}

$sql = "DELETE FROM users WHERE id = ?";
$user_id = trim($_GET["user_id"]);

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "s",  $param_user );
    
    // Set parameters

    $param_user = $user_id;

    
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){

        $sql = "DELETE FROM favorites where userid = ?";
        if( $stmt = mysqli_prepare($link, $sql)){
            mysqli_stmt_bind_param($stmt, "i", $user_id);

            if(mysqli_stmt_execute($stmt)){

            }else{
                echo "Something went wrong. Please try again later.";
            }
        }
        // Redirect to login page
        header("location: administration.php");
    } else{
        echo "Something went wrong. Please try again later.";
    }

    // Close statement
    mysqli_stmt_close($stmt);
}
header("location: administration.php");
    exit;
?>