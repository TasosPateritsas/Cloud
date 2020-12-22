<?php


$response = file_get_contents('php://input');

$response = json_decode($response);

file_put_contents('php://stdout', print_r("\n***ORION***************\n", TRUE));
file_put_contents('php://stdout', print_r($response->data[0]->id."\n", TRUE));
file_put_contents('php://stdout', print_r($response->data[0]->title->value."\n", TRUE));
file_put_contents('php://stdout', print_r($response->data[0]->startdate->value."\n", TRUE));
file_put_contents('php://stdout', print_r($response->data[0]->enddate->value."\n", TRUE));

$movieid = $response->data[0]->id;
$title = $response->data[0]->title->value;
$startdate = $response->data[0]->startdate->value;
$enddate = $response->data[0]->enddate->value;

$curl = curl_init();


curl_setopt_array($curl , array(
    CURLOPT_URL => 'http://orion_proxy:1027/v2/subscriptions/'.$response->subscriptionId,
    CURLOPT_RETURNTRANSFER => true ,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'GET',
    CURLOPT_HTTPHEADER => array(
        "X-Auth-Token: magic_key"
    ),
));

$req = curl_exec($curl) ;
$req = json_decode($req);
curl_close($curl);

file_put_contents('php://stdout', print_r($req, TRUE));
file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));

$userid = $req->description;

$curl = curl_init();
$url = "http://data_storage_proxy:2000/data_storage.php?". http_build_query([
    'set_not' => true,
    'userid' => $userid,
    'movieid' => $movieid,
    'title' =>$title,
    'startdate'=> $startdate,
    'enddate'=>$enddate,
    'subid' => $response->subscriptionId
]);
curl_setopt($curl , CURLOPT_URL , $url);
curl_setopt($curl , CURLOPT_HTTPGET , true);
curl_setopt($curl , CURLOPT_RETURNTRANSFER , true);
curl_setopt($curl , CURLOPT_HTTPHEADER , array(
    "X-Auth-Token: magic_key"
));

$response = curl_exec($curl);
curl_close($curl);

?>