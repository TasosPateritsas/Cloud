<?php


session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

// Include config file
require_once "config.php";

if($_SESSION['role'] != 'ADMIN'){
    header("location: error.php");
    exit;
}
 
// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = "";
$name = $surname = $email = $role = $confirmed = "";
$name_err = $surname_err = $email_err = $role_err = $confirmed_err = "" ;
 
$ex_role = $_GET["role_"];
// Processing form data when form is submitted
if(isset($_POST["user_id"]) && !empty($_POST["user_id"])){
    // Get hidden input value
    $id = $_POST["user_id"];
    
    // Validate name
     // Validate name 
     if(empty(trim($_POST["name"]))){
        $name_err = "Please enter a name.";     
    } else{
        $name = trim($_POST["name"]);
    }

    // Validate surname 
    if(empty(trim($_POST["surname"]))){
        $surname_err = "Please enter surname.";     
    } else{
        $surname = trim($_POST["surname"]);
    }

    // Validate username
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter a username.";
    } else{
        $username = trim($_POST["username"]);   
    }
    
    // Validate password
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter a password.";     
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "Password must have atleast 6 characters.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    
    // Validate email 
    if(empty(trim($_POST["email"]))){
        $email_err = "Please enter a email.";     
    } else{
        $email = trim($_POST["email"]);
    }

    // Validate role 
    if(empty(trim($_POST["role"]))){
        $role_err = "Please enter a role['ADMIN' ,'CINEMAOWNER' ,'USER'].";     
    } else{
        $role = trim($_POST["role"]);
        if($role != "ADMIN" && $role != "CINEMAOWNER" && $role != "USER"){
            $role_err = "Role did not match." ;
        }
    }

    // Validate confirmed 
    if(empty(trim($_POST["confirmed"]))){
        $confirmed_err = "Please confirm.";     
    } else{
        $confirmed = trim($_POST["confirmed"]);
        
    }

    
    // Check input errors before inserting in database
    if(empty($username_err) && empty($password_err)  && empty($role_err) && empty($email_err) && empty($surname_err) && empty($name_err) && empty($confirmed_err)){

        if($ex_role != $role){

            if ($ex_role == "USER"){
                $sql = "DELETE FROM favorites where userid = ?";

                if( $stmt = mysqli_prepare($link, $sql)){
                    mysqli_stmt_bind_param($stmt, "i", $id);

                    if(mysqli_stmt_execute($stmt)){

                    }else{
                        echo "Something went wrong. Please try again later.";
                    }
                }
            }

            if ($ex_role == "CINEMAOWNER"){
                $sql = "DELETE FROM movies where  cinemaname = ( select name from cinemas where owner = ? limit 1 )";

                if( $stmt = mysqli_prepare($link, $sql)){
                    mysqli_stmt_bind_param($stmt, "i", $id);

                    if(mysqli_stmt_execute($stmt)){

                    }else{
                        echo "Something went wrong 1 . Please try again later.";
                    }
                }

                $sql = "DELETE from cinemas where owner = ? ";
                if( $stmt = mysqli_prepare($link, $sql)){
                    mysqli_stmt_bind_param($stmt, "i", $id);

                    if(mysqli_stmt_execute($stmt)){

                    }else{
                        echo "Something went wrong 1 . Please try again later.";
                    }
                }
            }
        }




        // Prepare an update statement
        $sql = "UPDATE users SET name=?, surname=?, username=?, password=?, email = ? ,role = ?, confirmed = ? WHERE id=?";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssssssii", $param_name , $param_surname , $param_username, $param_password ,  $param_email, $param_role , $confirmed, $id);
            
            // Set parameters
            $param_name = $name;
            $param_surname = $surname;
            $param_username = $username;
            $param_password = $password; // Creates a password hash
            $param_email = $email;
            $param_role = $role;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Records updated successfully. Redirect to landing page
               
                header("location: administration.php");
                exit();
            } else{
                echo "Something went wrong. Please try again later.";
            }
            // Close statement
        mysqli_stmt_close($stmt);
        }else {
            echo "Prepare statement error: " . mysqli_error($link);
        }
         
        
    }
    
    // Close connection
    mysqli_close($link);
} else{
    // Check existence of id parameter before processing further
    if(isset($_GET["user_id"]) && !empty(trim($_GET["user_id"]))){
        // Get URL parameter
        $id =  trim($_GET["user_id"]);
        $ex_role = $_GET["role_"];
        // Prepare a select statement
        $sql = "SELECT * FROM users WHERE id = ?";
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_id);
            
            // Set parameters
            $param_id = $id;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                $result = mysqli_stmt_get_result($stmt);
    
                if(mysqli_num_rows($result) == 1){
                    /* Fetch result row as an associative array. Since the result set contains only one row, we don't need to use while loop */
                    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                    
                    // Retrieve individual field value
                    $name = $row["name"];
                    $surname = $row["surname"];
                    $username = $row["username"];
                    $password = $row['password'];
                    $email = $row['email'];
                    $role = $row['role'];
                    $confirmed = $row['confirmed'];
                } else{
                    // URL doesn't contain valid id. Redirect to error page
                    header("location: error.php");
                    exit();
                }
                
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }
        }
        
        // Close statement
        mysqli_stmt_close($stmt);
        
        // Close connection
        mysqli_close($link);
    }  else{
        // URL doesn't contain id parameter. Redirect to error page
        header("location: error.php");
        exit();
    }
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Update Record</h2>
                    </div>
                    <p>Please edit the input values and submit to update the User.</p>
                    <form action="<?php echo htmlspecialchars(basename($_SERVER['REQUEST_URI'])); ?>" method="post">
                        <div class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" value="<?php echo $name; ?>">
                            <span class="help-block"><?php echo $name_err ; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($surname_err)) ? 'has-error' : ''; ?>">
                            <label>Surname</label>
                            <input type="text" name="surname" class="form-control" value="<?php echo $surname; ?>">
                            <span class="help-block"><?php echo $surname_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                            <label>Username</label>
                            <input type="text" name="username" class="form-control" value="<?php echo $username; ?>">
                            <span class="help-block"><?php echo $username_err; ?></span>
                        </div>    
                        <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" value="<?php echo $password; ?>">
                            <span class="help-block"><?php echo $password_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
                            <label>Email</label>
                            <input type="text" name="email" class="form-control" value="<?php echo $email; ?>">
                            <span class="help-block"><?php echo $email_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($role_err)) ? 'has-error' : ''; ?>">
                            <label>Role</label>
                            <input type="radio" name="role"
                            <?php if (isset($role) && $role=="ADMIN") echo "checked" ;?>
                            value="ADMIN">ADMIN 
                            <input type="radio" name="role"
                            <?php if (isset($role) && $role=="USER") echo "checked";?>
                            value="USER">USER
                            <input type="radio" name="role"
                            <?php if (isset($role) && $role=="CINEMAOWNER") echo "checked";?>
                            value="CINEMAOWNER">CINEMAOWNER
                            <span class="help-block"><?php echo $role_err; ?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($confirmed_err)) ? 'has-error' : ''; ?>">
                            <label>Confirmed</label>
                            <input type="radio" name="confirmed"
                            <?php if (isset($confirmed) && $confirmed=="1") echo "checked" ;?>
                            value="1">YES 
                            <input type="radio" name="confirmed"
                            <?php if (isset($confirmed) && $confirmed=="0") echo "checked";?>
                            value="0">NO
                            <input type="radio" name="confirmed"
                            <?php if (isset($confirmed) && $confirmed=="Null") echo "checked";?>
                            value="Null">WAIT
                            <span class="help-block"><?php echo $confirmed_err; ?></span>
                        </div>
                        <input type="hidden" name="user_id" value="<?php echo $id; ?>"/>
                        <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="administration.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>