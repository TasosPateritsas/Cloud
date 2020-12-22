<?php
// Initialize the session
session_start();
    $manager = new MongoDB\Driver\Manager("mongodb://mongo_db:27017");
    //echo var_dump($manager);

    //get movies 
    if(isset($_GET['get_movies']) && $_GET['get_movies'] == true){
        $filter = [];
        $options = [
            
         ];
        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.movies', $query);
        $arr = array();
        $count = 0;
        foreach ($rows as $document) {
           /*  file_put_contents('php://stdout', print_r("\n************************\n", TRUE));
            file_put_contents('php://stdout', print_r($document->startdate->toDateTime()->format('r'), TRUE));
            file_put_contents('php://stdout', print_r("\n***********************\n", TRUE)); */
            $arr[$count] = array(
                "id" => (string)$document->_id,
                "title" => $document->title,
                "category"=>$document->category,
                "startdate" => $document->startdate->toDateTime()->format('Y-m-d'),
                "enddate" => $document->enddate->toDateTime()->format('Y-m-d'),
                "cinemaname" =>$document->cinemaname
            );
            $count = $count + 1;
          }
        echo json_encode($arr);
    }

    

    //set favorites 
    if(isset($_GET['set_fav']) && $_GET['set_fav'] == true){
        $bulk = new MongoDB\Driver\BulkWrite;
        $document3 = ['_id' => new MongoDB\BSON\ObjectId, 'movieid' => $_GET["movieid"] , 'userid' => $_GET["userid"]];
        $bulk->insert($document3);
        $result = $manager->executeBulkWrite('cloud.favorites', $bulk);
        echo json_encode($result);
    }

    //get favorites
    if(isset($_GET['get_fav']) && $_GET['get_fav'] == true){
        $filter = ['userid' => $_GET['userid']];
        $options = [
            
         ];
        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.favorites', $query);
        $arr = array();
        $count = 0;
        foreach ($rows as $document) {
            
            $filter = ['_id' => new MongoDB\BSON\ObjectId($document->movieid)];
            $query_ = new MongoDB\Driver\Query($filter, $options);
            $movs_ = $manager->executeQuery('cloud.movies', $query_);
            foreach($movs_ as $doc){
                file_put_contents('php://stdout', print_r("\n************************\n", TRUE));
                file_put_contents('php://stdout', print_r($doc->_id, TRUE));
                file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));
                $arr[$count] = array(
                    "id" => (string)$doc->_id,
                    "title" => $doc->title,
                    "category"=>$doc->category,
                    "startdate" => $doc->startdate->toDateTime()->format('Y-m-d'),
                    "enddate" => $doc->enddate->toDateTime()->format('Y-m-d'),
                    "cinemaname" =>$doc->cinemaname
                );

            }
            
            $count = $count + 1;
        }
        echo json_encode($arr);
    }
    //delete favorites
    if(isset($_GET['del_fav']) && $_GET['del_fav'] == true){
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['movieid' =>$_GET["movieid"] , 'userid'=>$_GET["userid"]],['limit' => 1]);
        file_put_contents('php://stdout', print_r("\n************************\n", TRUE));
        file_put_contents('php://stdout', print_r($_GET["movieid"] ."*****". $_GET["userid"], TRUE));
        file_put_contents('php://stdout', print_r("\n***********************\n", TRUE));
        $result = $manager->executeBulkWrite('cloud.favorites', $bulk);

        $filter = [
            'userid' => $_GET['userid'] ,
            'movieid' => $_GET['movieid']
        ];
        $options = [
            
         ];
        $query_ = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.notification', $query_);

        $subid = 0;
        foreach($rows as $document){
            $subid = $document->subid;
        }
        $curl = curl_init();


        curl_setopt_array($curl , array(
            CURLOPT_URL => 'http://172.18.1.15:1026/v2/subscriptions/'.$subid,
            CURLOPT_RETURNTRANSFER => true ,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'DELETE',
            CURLOPT_HTTPHEADER => array(
                "X-Auth-Token: magic_key"
            ),
        ));

        $req = curl_exec($curl) ;
        $req = json_decode($req);
        curl_close($curl);
        
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['movieid' =>$_GET["movieid"] , 'userid'=>$_GET["userid"]],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.notification', $bulk);
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['movieid' =>$_GET["movieid"] , 'userid'=>$_GET["userid"]],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.feedback', $bulk);

        echo json_encode("success");

    }

    //get cinemas 
    if(isset($_GET['get_cinemas']) && $_GET['get_cinemas'] == true ){
        
        
        $filter = ['owner' => $_GET['userid']];
        $options = [
            
         ];
        $query_ = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.cinemas', $query_);
        $arr_ = array();
        $count = 0;
        foreach($rows as $document){
           
            $filter = ['cinemaname' => $document->name];
            $query_ = new MongoDB\Driver\Query($filter, $options);
            $movs_ = $manager->executeQuery('cloud.movies', $query_);
            foreach($movs_ as $doc){
            
                $arr_[$count] = array(
                    "id" => (string)$doc->_id,
                    "title" => $doc->title,
                    "category"=>$doc->category,
                    "startdate" => $doc->startdate->toDateTime()->format('Y-m-d'),
                    "enddate" => $doc->enddate->toDateTime()->format('Y-m-d'),
                    "cinemaname" =>$doc->cinemaname
                );
                $count = $count + 1;
            }
            
        }
        echo json_encode($arr_);
    }

    //delete cinemas 
    if(isset($_GET['del_cinemas']) && $_GET['del_cinemas'] == true ){

        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['_id' => new MongoDB\BSON\ObjectId($_GET["movieid"])],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.movies', $bulk);
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['movieid' =>$_GET["movieid"] ],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.favorites', $bulk);
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['movieid' =>$_GET["movieid"] ],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.notification', $bulk);
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['movieid' =>$_GET["movieid"] ],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.feedback', $bulk);
        echo json_encode("success");

    }

    //insert cinemas 
    if(isset($_GET['insert_mov']) && $_GET['insert_mov'] == true ){
        
        $bulk = new MongoDB\Driver\BulkWrite;
        $document3 = ['_id' => new MongoDB\BSON\ObjectId, 
        'title' => $_GET["title"],
        'startdate'=>new MongoDB\BSON\UTCDateTime(strtotime($_GET['startdate']) * 1000),
        'enddate' =>new MongoDB\BSON\UTCDateTime(strtotime($_GET['enddate']) * 1000),
        'category'=>$_GET["category"] , 
        'cinemaname'=>$_GET["cinemaname"] 
        ];
        $bulk->insert($document3);
        $result = $manager->executeBulkWrite('cloud.movies', $bulk);

        echo json_encode($document3);
        
    }
    
    //update cinemas 
    if(isset($_GET['update_mov']) && $_GET['update_mov'] == true ){
        
        $bulk = new MongoDB\Driver\BulkWrite;
        $document3 = ['_id' => $_GET['movieid'], 
        'title' => $_GET["title"],
        'startdate'=>$_GET['startdate'],
        'enddate' =>$_GET['enddate'],
        'category'=>$_GET["category"] 
        ];
        $bulk->update(["_id" => new MongoDB\BSON\ObjectId($_GET['movieid'])],
        ['$set' => ['title' => $_GET["title"],'startdate'=>new MongoDB\BSON\UTCDateTime(strtotime($_GET['startdate']) * 1000),'enddate' =>new MongoDB\BSON\UTCDateTime(strtotime($_GET['enddate']) * 1000), 'category'=>$_GET['category']]
        ]);
        $result = $manager->executeBulkWrite('cloud.movies', $bulk);

        echo json_encode("success");
        
    }

    if(isset($_GET['set_not']) && $_GET['set_not'] == true ){
        
        $filter = [
            'userid' => $_GET['userid'] ,
            'movieid' => $_GET['movieid']
        ];
        $options = [
            
         ];
        $query_ = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.notification', $query_);

        $count = 0;
        foreach($rows as $document){
            $count = $count + 1;
        }
       //insert
        if( $count == 0 ){
            $bulk = new MongoDB\Driver\BulkWrite;
            $document3 = ['_id' => new MongoDB\BSON\ObjectId, 
            'title' => $_GET["title"],
            'startdate'=>new MongoDB\BSON\UTCDateTime(strtotime($_GET['startdate']) * 1000),
            'enddate' =>new MongoDB\BSON\UTCDateTime(strtotime($_GET['enddate']) * 1000),
            'userid'=>$_GET["userid"] , 
            'movieid'=>$_GET["movieid"],
            'subid' => $_GET["subid"]
            ];
            $bulk->insert($document3);
            $result = $manager->executeBulkWrite('cloud.notification', $bulk);
        }else{
        //feedback
            $bulk = new MongoDB\Driver\BulkWrite;
            $document3 = ['_id' => new MongoDB\BSON\ObjectId, 
            'title' => $_GET["title"],
            'startdate'=>new MongoDB\BSON\UTCDateTime(strtotime($_GET['startdate']) * 1000),
            'enddate' =>new MongoDB\BSON\UTCDateTime(strtotime($_GET['enddate']) * 1000),
            'userid'=>$_GET["userid"] , 
            'movieid'=>$_GET["movieid"],
            'subid' => $_GET["subid"]
            ];
            $bulk->insert($document3);
            $result = $manager->executeBulkWrite('cloud.feedback', $bulk);
        }

        echo json_encode("success");
        
    }

    //get movies 
    if(isset($_GET['get_feed']) && $_GET['get_feed'] == true){
        $filter = ['userid' => $_GET["userid"]];
        $options = [
            
         ];
        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.feedback', $query);
        $arr = array();
        $count = 0;
        foreach ($rows as $document) {
           /*  file_put_contents('php://stdout', print_r("\n************************\n", TRUE));
            file_put_contents('php://stdout', print_r($document->startdate->toDateTime()->format('r'), TRUE));
            file_put_contents('php://stdout', print_r("\n***********************\n", TRUE)); */
            $arr[$count] = array(
                "title" => $document->title,
                "startdate" => $document->startdate->toDateTime()->format('Y-m-d'),
                "enddate" => $document->enddate->toDateTime()->format('Y-m-d')
            );
            $count = $count + 1;
          }
        echo json_encode($arr);
    }

    

?>