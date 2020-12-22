<?php

// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

require_once "config.php";

if($_SESSION['role'] != 'CINEMAOWNER'){
    header("location: error.php");
    exit;
}

if(isset($_REQUEST["term"])){
    // Prepare a select statement
    $sql = "SELECT m.id , m.title , m.startdate, m.enddate,m.category , m.cinemaname from cinemas c , users u, movies m where u.id = ? and u.id = c.owner and m.cinemaname = c.name and m.category = ?";

    
    if($stmt = mysqli_prepare($link, $sql)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "is",$param_id , $param_term);
        
        // Set parameters
        $param_id = $_SESSION["id"];
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
                    
                    echo "<td>" . $row['title'] . "</td>";
                    echo "<td>" . $row['startdate'] . "</td>";
                    echo "<td>" . $row['enddate'] . "</td>";
                    echo "<td>" . $row['cinemaname'] . "</td>";
                    echo "<td>" . $row['category'] . "</td>";
                    echo "<td>";
                    echo "<a href='updateMov.php?movie_id=". $row['id'] ."' title='Update' data-toggle='tooltip'><span class='glyphicon glyphicon-pencil'></span></a>";
                    echo "<a href='deleteMov.php?movie_id=". $row['id'] ."' title='Delete' data-toggle='tooltip'><span class='glyphicon glyphicon-trash'></span></a>";
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