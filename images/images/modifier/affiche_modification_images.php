<?php 

include("C:/xampp/htdocs/pronostics/webadmin/modules/connexiondb/connexiondb.php");
include("C:/xampp/htdocs/pronostics/webadmin/modules/images/modifier/requete_recup_images.php");


$row = $stmt->fetch(PDO::FETCH_ASSOC)
?>
  <h2> Image défini:</h2>
  <input type="hidden" class="form-control" id="exampleInputUsername1" name="Idimages" value="<?php echo htmlspecialchars($row['Idimages']); ?>">
  <img src="http://localhost/pronostics/images/project/<?php echo htmlspecialchars($row['Nom_images']); ?>"  alt="Pas d'image disponible" whith="100" height="200"/>     
  <form action="traitement_ajout_images.php" method="post" enctype="multipart/form-data">
 <h2> Select une nouvelle images:</h2>

  
