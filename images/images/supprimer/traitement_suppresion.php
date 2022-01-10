<?php 

include("C:/xampp/htdocs/pronostics/webadmin/modules/connexiondb/connexiondb.php");



?>

<?php 

$Idimages = $_GET['Idimages'];






$sql = "DELETE FROM images where `Idimages`=:Idimages";
try{
    
 $stmt = $db->prepare($sql);
 $stmt->bindParam('Idimages', $Idimages, PDO::PARAM_STR);
 $stmt->execute();
 if($stmt == true){

    $msg = "Aucun résultat pour votre recherche";
    
 }


 if($stmt === false){
   die("Erreur");
 }
 
}catch (PDOException $e){
 
}



?>
<?php





header('location:http://localhost/pronostics/webadmin/modules/images/lister/images.php');

?>