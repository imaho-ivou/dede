<?php 

$Idimages = $_GET['Idimages'];



$sql = "select * from images where `Idimages`=:Idimages";
try{
    
 $stmt = $db->prepare($sql);
 $stmt->bindParam('Idimages', $Idimages, PDO::PARAM_STR);
 $stmt->execute();
 $count = $stmt->rowCount();
 if($count == 0){

    $msg = "Aucun résultat pour votre recherche";
    
 }


 if($stmt === false){
   die("Erreur");
 }
 
}catch (PDOException $e){
 
}



?>