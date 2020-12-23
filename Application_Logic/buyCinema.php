<?php
// Include config file

session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}


if($_SESSION['role'] != 'CINEMAOWNER'){
    header("location: error.php");
    exit;
}


        

        $curl = curl_init();
        $url = "http://data_storage_proxy:2000/data_storage.php?". http_build_query([
            'buy_cinema' => true,
            'name'=> $_POST["cinemaname"] ,
            'owner' => $_POST["uid"]
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

        file_put_contents('php://stdout', print_r("\nBuy***************\n", TRUE));
        file_put_contents('php://stdout', print_r($response, TRUE));
        //file_put_contents('php://stdout', print_r($response->_id->{'$oid'}, TRUE));
        file_put_contents('php://stdout', print_r($_POST["title"], TRUE));
        file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));

        
    



        echo json_encode($response)

?>