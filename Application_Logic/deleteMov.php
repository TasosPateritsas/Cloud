<?php
// Initialize the session
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
        'del_cinemas' => true,
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

    file_put_contents('php://stdout', print_r("\nDELTOMOV***************\n", TRUE));
    file_put_contents('php://stdout', print_r($response, TRUE));
    file_put_contents('php://stdout', print_r($_POST["id"], TRUE));
    file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));

    $curl = curl_init();
        
    curl_setopt_array($curl, array(
        CURLOPT_URL => "http://orion_proxy:1027/v2/entities/".$_POST['id']."?type=Thing",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "DELETE",
        CURLOPT_HTTPHEADER => array(
            "X-Auth-Token: magic_key",
        ),
    ));

    $response_ = curl_exec($curl);
    file_put_contents('php://stdout', print_r(json_decode($response_), TRUE));
    curl_close($curl);

    echo json_encode($response)

?>