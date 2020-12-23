<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

//require_once "config.php";
if($_SESSION['role'] != 'USER'){
    header("location: error.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Movies</title>
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

       
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });

    $(document).ready(function(){
    
    $(document).on('click','button[id^="fav_"]', function(){
        /* Get input value on change */
        var movie_id = $(this).closest("tr").find('td:eq(0)').text();
        var uid = $(this).closest("tr").find('td:eq(6)').text();

        $.ajax({
            url:"addToFav.php",    //the page containing php script
            type: "post",    //request type,
            dataType: 'json',
            data: {id: movie_id, user: uid},
            success:function(result){
                //console.log(result.abc);
            }
        });
        
    });
});
    </script>

</head>
<body>


<nav class="navbar navbar-default">
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
            
        
          </ul>
        </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a><?php echo htmlspecialchars($_SESSION["username"]) , " [" ,htmlspecialchars($_SESSION["role"]), "]" ; ?></a></li>
        <li><a href="logout.php" class="btn btn-success pull-right">Logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header clearfix">
                        <h2 class="pull-left">Movies Details</h2>
                        <a href="favourites.php" class="btn btn-success pull-right">Go to Favourites</a>
                    </div>
                    <?php
                    // Include config file
                    
                    $curl = curl_init();
                    $url = "http://data_storage_proxy:2000/data_storage.php?". http_build_query([
                        'get_movies' => true,
                        'userid' => $_SESSION["id"]
                    ]);
                    curl_setopt($curl , CURLOPT_URL , $url);
                    curl_setopt($curl , CURLOPT_HTTPGET , true);
                    curl_setopt($curl , CURLOPT_RETURNTRANSFER , true);
                    curl_setopt($curl , CURLOPT_HTTPHEADER , array(
                        "X-Auth-Token: magic_key"
                    ));
                    
                    $response = curl_exec($curl);
                    curl_close($curl);

                    $response = json_decode($response);

                    file_put_contents('php://stdout', print_r("\n************************\n", TRUE));
                    file_put_contents('php://stdout', print_r($response, TRUE));
                    file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));

                    echo "<table class='table table-bordered table-striped'>";
                                    echo "<thead>";
                                        echo "<tr>";
                                            echo "<th>#</th>";
                                            echo "<th>Title</th>";
                                            echo "<th>Start Date</th>";
                                            echo "<th>End Date</th>";
                                            echo "<th>Cinema</th>";
                                            echo "<th>Category</th>";
                                        echo "</tr>";
                                    echo "</thead>";
                                    echo "<tbody>";

                    for ($i=0; $i < count($response); $i++) { 
                        echo "<tr>";
                            echo "<td>" . $response[$i]->id . "</td>";
                            echo "<td>" . $response[$i]->title . "</td>";
                            echo "<td>" . $response[$i]->startdate . "</td>";
                            echo "<td>" . $response[$i]->enddate . "</td>";
                            echo "<td>" . $response[$i]->cinemaname . "</td>";
                            echo "<td>" . $response[$i]->category . "</td>";
                            echo "<td name='userid' hidden = true >" . $_SESSION["id"]. "</td>";
                            echo "<td>";
                                echo "<button id='fav_".intval($i)."' class='btn btn-default swap'><span class='glyphicon glyphicon-heart-empty'></span></button>";
                        echo "</td>";
                        echo "</tr>";
                    }
                    echo "</tbody>";                            
                    echo "</table>";
                    

                   
 
                    // Close connection
                    
                    ?>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>
