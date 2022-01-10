<?php 
// récupérer pronostics
  $sql = "SELECT * FROM images";
   
  try{
 
   $stmt = $db->query($sql);

   $count = $stmt->rowCount();
   if($count == 0){
  
      $msgprono = "Image en cours d'ajout...";
    
   } 
   
   if($stmt === false){
    die("Erreur");
   }
   
  }catch (PDOException $e){
    echo $e->getMessage();
  }

 
?>