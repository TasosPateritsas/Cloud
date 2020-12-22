<?php


session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

// Include config file

 
if($_SESSION['role'] != 'CINEMAOWNER'){
    header("location: error.php");
    exit;
}
        $curl = curl_init();
        $url = "http://data_storage_proxy:2000/data_storage.php?". http_build_query([
            'update_mov' => true,
            'movieid' => $_POST['movieid'],
            'title' => $_POST["title"],
            'startdate'=> $_POST["startdate"] ,
            'enddate' =>$_POST["enddate"],
            'category'=>$_POST["category"] 
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

        file_put_contents('php://stdout', print_r("\nupdate***************\n", TRUE));
        file_put_contents('php://stdout', print_r($response, TRUE));
        file_put_contents('php://stdout', print_r($_POST["title"], TRUE));
        file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));

        $curl = curl_init();
        $arr_input = array(
            'title' => $_POST["title"],
            'startdate'=> $_POST["startdate"] ,
            'enddate' =>$_POST["enddate"],
            'category'=>$_POST["category"] 
        );


        curl_setopt_array($curl, array(
            CURLOPT_URL => "http://orion_proxy:1027/v2/entities/".$_POST['movieid']."/attrs?options=keyValues",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "PATCH",
            CURLOPT_POSTFIELDS => json_encode($arr_input,true),
            CURLOPT_HTTPHEADER => array(
                "Content-Type: application/json",
                "X-Auth-Token: magic_key",
            
            ),
        ));

        $response_ = curl_exec($curl);
        file_put_contents('php://stdout', print_r(json_decode($response_), TRUE));
        curl_close($curl);


        echo json_encode($response)

?>
 
