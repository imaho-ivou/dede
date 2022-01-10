<?php
$target_dir = "C:/xampp/htdocs/pronostics/images/project/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
  $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
  if($check !== false) {
    echo "File is an image - " . $check["mime"] . ".";
    $uploadOk = 1;
  } else {
    echo "File is not an image.";
    $uploadOk = 0;
  }
}

// Check if file already exists
if (file_exists($target_file)) {
  echo "Sorry, file already exists.";
  $uploadOk = 0;
}

// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
  echo "Sorry, your file is too large.";
  $uploadOk = 0;
}

// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
  echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
    echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
  } else {
    echo "Sorry, there was an error uploading your file.";
  }
}
?>
<?php 

include("C:/xampp/htdocs/pronostics/webadmin/modules/connexiondb/connexiondb.php");



?>

<?php 

$Idimages = $_POST['Idimages'];
$Nom_images = ( basename( $_FILES["fileToUpload"]["name"]));






$sql = "UPDATE images SET `Nom_images`=:Nom_images where `Idimages`=:Idimages";
try{
    
 $stmt = $db->prepare($sql);
 $stmt->bindParam('Idimages', $Idimages, PDO::PARAM_STR);
 $stmt->bindValue('Nom_images', $Nom_images, PDO::PARAM_STR);
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