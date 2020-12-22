<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

//require_once "config.php";

?>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    <style type="text/css">
        .wrapper{
            width: 650px;
            margin: 0 auto;
            margin-top: 100px;
        }
        .page-header h2{
            margin-top: 0;
        }
        table tr td:last-child a{
            margin-right: 15px;

        }
        body, html {
          height: 100%;
        }
        .bg-image {
          /* The image used */
          background-image: url("images/movies.jpg");

                    /* Add the blur effect */
          filter: blur(6px);
          -webkit-filter: blur(6px);

          /* Full height */
          height: 100%;

          /* Center and scale the image nicely */
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
        }

        .bg-text {
          background-color: rgb(0,0,0); /* Fallback color */
          background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
          color: white;
          font-weight: bold;
          border: 3px solid #f1f1f1;
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          z-index: 2;
          width: 80%;
          padding: 20px;
          text-align: center;
        }
       
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
            
              setInterval(function(){ 
                var role = document.getElementById("role").value;

                if( role == "USER"){
                var uid = document.getElementById("uid").value;
                
                //alert("Hello"); 

                $.ajax({
                  url:"feedback.php",    //the page containing php script
                  type: "post",    //request type,
                  dataType: "json",
                  data: {uid:uid},
                  success:function(result){
                      console.log(result);
                      var table = document.getElementById("myTable");
                      var rows = document.getElementById("myTable").rows.length;
                      for (let index = rows-1; index < result.length; index++) {
                        var row = table.insertRow(1);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2); 
                        cell1.innerHTML = "<td> " +result[index].title +"</td>";
                        cell2.innerHTML = "<td> " +result[index].startdate +"</td>";
                        cell3.innerHTML = "<td> " +result[index].enddate +"</td>";
                      }
                  },
                  error: function(){
                      console.log("no");
                  }
                });
                }


              }, 3000);
            
            
        });
    </script>
</head>
<body>


<nav class="navbar fixed-top navbar-default ">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="welcome.php">Home</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="movies.php">Movies</a></li>
            <li><a href="owners.php">Cinemas</a></li>
            <li><a href="administration.php">Administration</a></li>
        
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a><?php echo htmlspecialchars($_SESSION["username"]) , " [" ,htmlspecialchars($_SESSION["role"]), "]" ; ?></a></li>
        <li><a href="logout.php" class="btn btn-success pull-right">Logout</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  
</nav>

<div hidden = true >
      <label>ID</label>
      <input id="uid" type="text" name="name" class="form-control" value="<?php echo $_SESSION['id']; ?>">
      <span class="help-block"><?php echo $name_err;?></span>
 </div>

 <div hidden = true >
      <label>ID</label>
      <input id="role" type="text" name="name" class="form-control" value="<?php echo $_SESSION['role']; ?>">
      <span class="help-block"><?php echo $name_err;?></span>
 </div>

<div class="bg-image"></div>

<div class="bg-text">

<?php

if ( $_SESSION['role'] == 'USER'){
  echo "<h1>FEEDBACK</h1>";
  echo "<table id='myTable' class='table table-bordered table-striped'>";
  echo "<thead>";
      echo "<tr>";
          echo "<th>Title</th>";
          echo "<th>Start Date</th>";
          echo "<th>End Date</th>";
      echo "</tr>";
  echo "</thead>";
  echo "<tbody>";

  echo "</tbody>";                            
  echo "</table>";
}
else {
  ECHO "<h1>CINEMAS</h1>";
}


?>
</div>




    
</body>
</html>