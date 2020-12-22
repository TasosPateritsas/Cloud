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
        $curl = curl_init();
        $url = "http://data_storage_proxy:2000/data_storage.php?". http_build_query([
            'set_fav' => true,
            'movieid' => $_POST["id"],
            'userid'  => $_POST["user"]
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

        file_put_contents('php://stdout', print_r("\nADDTOFAV***************\n", TRUE));
        file_put_contents('php://stdout', print_r($response, TRUE));
        file_put_contents('php://stdout', print_r($_POST["id"], TRUE));
        file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));

        $curl = curl_init();
        $arr_input =  array (
            'description' => $_POST["user"],
            'subject' => array (
              'entities' =>  array (
                0 => array (
                  'id' => $_POST["id"],
                  'type' => 'Thing'
                )
              ),
              'condition' => array (
                'attrs' => array (
                  0 => 'startdate',
                  1 => 'enddate'
                )
              )
            ),
            'notification' => array (
              'http' => array (
                'url' => 'http://172.18.1.8/orion_selector.php'
              ),
              'attrs' => array (
                0 => 'title',
                1 => 'startdate',
                2 => 'enddate'
              )
            ),
            'expires' => '2040-01-01T14:00:00.00Z',
            'throttling' => 5
          );


        curl_setopt_array($curl, array(
            CURLOPT_URL => "http://orion_proxy:1027/v2/subscriptions",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode($arr_input,true),
            CURLOPT_HTTPHEADER => array(
                "Content-Type: application/json",
                "X-Auth-Token: magic_key",
            
            ),
        ));

        $response_ = curl_exec($curl);
        file_put_contents('php://stdout', print_r(json_decode($response_), TRUE));
        curl_close($curl);

        echo $response
?>