<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

//require_once "config.php";

if($_SESSION['role'] != 'CINEMAOWNER'){
    header("location: error.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Owners</title>
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
        

        $(document).on('click','button[id^="del_"]', function(){
            /* Get input value on change */
            var movie_id = $(this).closest("tr").find('td:eq(0)').text();
            var uid = $(this).closest("tr").find('td:eq(5)').text();
            $(this).closest("tr").remove();
            $.ajax({
                url:"deleteMov.php",    //the page containing php script
                type: "post",    //request type,
                dataType: "json",
                data: {id: movie_id, user: uid},
                
            }).done(function (response){
                console.log(response);
            });
        });

        $(document).on('click','button[id^="upt_"]', function(){
            /* Get input value on change */
            var movie_id = $(this).closest("tr").find('td:eq(0)').text();
            //var title = $(this).closest("tr").find('td:eq(1)').input.value;
            var row = $(this).closest("tr").find('td:eq(0)').parent().index();
            console.log(row);
            row = row + 1;
            row = row.toString();
            var title = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(2) > input").value;
            //var title = document.querySelector("#myTable > tbody > tr:nth-child(1) > td:nth-child(2) > input").value;
            var startdate = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(3) > input").value;
            var enddate = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(4) > input").value;
            var category = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(5) > input").value;
            
            $.ajax({
                url:"updateMov.php",    //the page containing php script
                type: "post",    //request type,
                dataType: "json",
                data: {movieid: movie_id, title: title , startdate: startdate , enddate:enddate ,category:category},
                success:function(result){
                    console.log(result);
                    console.log(title);
                    console.log(startdate);
                    console.log(enddate);
                    console.log(category);
                },
                error: function() {
                        console.log($.makeArray(arguments));
                        console.log('no');
                        
                }
            });
            
        });

        $(document).on('click','button[id="insertmovie"]', function(){
            /* Get input value on change */
            var title = document.getElementById("titleid").value;
            var startdate = document.getElementById("startdateid").value;
            var enddate = document.getElementById("enddateid").value;
            var category = document.getElementById("categoryid").value;
            var cinemaname = document.getElementById("cinemanameid").value;
            var uid = document.getElementById("uid").value;
            //console.log(document.getElementById("titleid").value);
            var table = document.getElementById("myTable");
            var rows = document.getElementById("myTable").rows.length;
            var row = table.insertRow(rows);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            var cell7 = row.insertCell(6);
            var cell8 = row.insertCell(7);
            

            $.ajax({
                url:"insertMov.php",    //the page containing php script
                type: "post",    //request type,
                dataType: "json",
                data: {title : title, startdate: startdate ,enddate : enddate,category:category , cinemaname:cinemaname},
                success:function(result){
                    console.log(result);
                    console.log(result.title);
                    console.log(result._id.$oid);
                    //console.log(result.startdate.$date);
                    cell1.innerHTML = result._id.$oid;
                    cell1.hidden = true;
                    cell2.innerHTML = "<td> <input type='text' name='startdate' class='form-control' value='"+title +"'></td>"
                    cell3.innerHTML = "<td> <input type='text' name='startdate' class='form-control' value='"+startdate +"'></td>"
                    cell4.innerHTML = "<td> <input type='text' name='startdate' class='form-control' value='"+enddate +"'></td>"
                    cell5.innerHTML = "<td> <input type='text' name='startdate' class='form-control' value='"+category+"'></td>";
                    cell6.innerHTML = uid;
                    cell6.hidden = true;
                    cell7.innerHTML = "<button id='upt_' class='btn btn-default swap'><span class='glyphicon glyphicon-pencil'></span></button>";
                    cell8.innerHTML = "<button id='del_' class='btn btn-default swap'><span class='glyphicon glyphicon-trash'></span></button>";
                },
                error: function(){
                    console.log("no");
                }
            });
            
        });
        $(document).on('click','button[id="buycinema"]', function(){
            /* Get input value on change */
           
            var cinemaname = document.getElementById("cinemaname2id").value;
            var uid = document.getElementById("uid2").value;
            
        
            $.ajax({
                url:"buyCinema.php",    //the page containing php script
                type: "post",    //request type,
                dataType: "json",
                data: {uid : uid, cinemaname:cinemaname},
                success:function(result){
                  console.log(result);
                },
                error: function(){
                    console.log("no");
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
                        <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#exampleModal2">
                          Buy Cinema
                        </button>
                        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModal2Label" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModal2Label">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                <p>Please fill this form to buy a cinema.</p>
                                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                                    <div hidden = true class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                                        <label>ID</label>
                                        <input id="uid2" type="text" name="name" class="form-control" value="<?php echo $_SESSION['id']; ?>">
                                        <span class="help-block"><?php echo $name_err;?></span>
                                    </div>

                                    <div class="form-group <?php echo (!empty($cinemaname2_err)) ? 'has-error' : ''; ?>">
                                        <label>Cinema Name</label>
                                        <input id="cinemaname2id" type="text" name="cinemaname2" class="form-control" value="<?php echo $cinemaname2; ?>">
                                        <span class="help-block"><?php echo $cinemaname2_err;?></span>
                                    </div>
                                
                                </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="buycinema" type="button" class="btn btn-success">Save changes</button>
                                </div>
                                </div>
                            </div>
                            </div>
                        <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#exampleModal">
                        Insert a Movie
                        </button>
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                <p>Please fill this form and submit to add movie record to the database.</p>
                                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                                    <div hidden = true class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                                        <label>ID</label>
                                        <input id="uid" type="text" name="name" class="form-control" value="<?php echo $_SESSION['id']; ?>">
                                        <span class="help-block"><?php echo $name_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                                        <label>Title</label>
                                        <input id="titleid" type="text" name="name" class="form-control" value="<?php echo $name; ?>">
                                        <span class="help-block"><?php echo $name_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($startdate_err)) ? 'has-error' : ''; ?>">
                                        <label>Start Date</label>
                                        <input id="startdateid" type="text" name="startdate" class="form-control" value="<?php echo $startdate; ?>">
                                        <span class="help-block"><?php echo $startdate_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($enddate_err)) ? 'has-error' : ''; ?>">
                                        <label>End Date</label>
                                        <input id="enddateid" type="text" name="enddate" class="form-control" value="<?php echo $enddate; ?>">
                                        <span class="help-block"><?php echo $enddate_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($category_err)) ? 'has-error' : ''; ?>">
                                        <label>Category</label>
                                        <input id="categoryid" type="text" name="category" class="form-control" value="<?php echo $category; ?>">
                                        <span class="help-block"><?php echo $category_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($cinemaname_err)) ? 'has-error' : ''; ?>">
                                        <label>Cinema Name</label>
                                        <input id="cinemanameid" type="text" name="cinemaname" class="form-control" value="<?php echo $cinemaname; ?>">
                                        <span class="help-block"><?php echo $cinemaname_err;?></span>
                                    </div>
                                
                                </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="insertmovie" type="button" class="btn btn-success">Save changes</button>
                                </div>
                                </div>
                            </div>
                            </div>
                    </div>
                    <?php
                    // Include config file
                    
                    $curl = curl_init();
                    $url = "http://data_storage_proxy:2000/data_storage.php?". http_build_query([
                        'get_cinemas' => true,
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
                    echo "<table id='myTable' class='table table-bordered table-striped'>";
                                    echo "<thead>";
                                        echo "<tr>";
                                            echo "<th hidden = true>#</th>";
                                            echo "<th>Title</th>";
                                            echo "<th>Start Date</th>";
                                            echo "<th>End Date</th>";
                                            echo "<th>Category</th>";
                                        echo "</tr>";
                                    echo "</thead>";
                                    echo "<tbody>";

                    for ($i=0; $i < count($response); $i++) { 
                        echo "<tr>";
                            echo "<td hidden = true>" . $response[$i]->id . "</td>";
                            echo "<td> <input type='text' name='startdate' class='form-control' value='". $response[$i]->title ."'></td>";
                            echo "<td> <input type='text' name='startdate' class='form-control' value='" . $response[$i]->startdate . "'></td>";
                            echo "<td> <input type='text' name='startdate' class='form-control' value='" . $response[$i]->enddate . "'></td>";
                            echo "<td> <input type='text' name='startdate' class='form-control' value='" . $response[$i]->category . "'></td>";
                            echo "<td name='userid' hidden = true >" . $_SESSION["id"]. "</td>";
                            echo "<td>";
                                echo "<button id='upt_".intval($i)."' class='btn btn-default swap'><span class='glyphicon glyphicon-pencil'></span></button>";
                        echo "</td>";
                        echo "<td>";
                                echo "<button id='del_".intval($i)."' class='btn btn-default swap'><span class='glyphicon glyphicon-trash'></span></button>";
                        echo "</td>";
                        echo "</tr>";
                    }
                    echo "</tbody>";                            
                    echo "</table>";
                    ?>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>