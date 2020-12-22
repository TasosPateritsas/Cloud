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

if(isset($_REQUEST["term"])){
    // Prepare a select statement
    $sql = "SELECT * from  users where role = ?";
    
    if($stmt = mysqli_prepare($link, $sql)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "s", $param_term);
        
        // Set parameters
       
        $param_term = $_REQUEST["term"] ;
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            $result = mysqli_stmt_get_result($stmt);
            
            // Check number of rows in the result set
            if(mysqli_num_rows($result) > 0){
                // Fetch result rows as an associative array
                 echo "<table class='table table-bordered table-striped'>";
                 echo "<tbody>";
                while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                    echo "<tr>";
                    
                    echo "<td>" . $row['id'] . "</td>";
                    echo "<td>" . $row['username'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['surname'] . "</td>";
                    echo "<td>" . $row['password'] . "</td>";
                    echo "<td>" . $row['email'] . "</td>";
                    echo "<td>" . $row['role'] . "</td>";
                    if ($row['confirmed'] == 1)
                        echo "<td>YES</td>";
                    else
                        echo "<td>NO</td>";
                    echo "<td>";
                        echo "<a href='updateUser.php?user_id=". $row['id'] ."&role_=". $row['role'] ."' title='Update' data-toggle='tooltip'><span class='glyphicon glyphicon-pencil'></span></a>";
                        echo "<a href='deleteUser.php?user_id=". $row['id'] ."' title='Delete' data-toggle='tooltip'><span class='glyphicon glyphicon-trash'></span></a>";
                echo "</td>";
                echo "</tr>";
                }
                echo "</tbody>";                            
                echo "</table>";
            } else{
                echo "<p>No matches found</p>" ;
            }
        } else{
            echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
        }
    }
     
    // Close statement
    mysqli_stmt_close($stmt);
}
 

?>