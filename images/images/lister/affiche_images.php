<?php 

    include("C:/xampp/htdocs/pronostics/webadmin/modules/connexiondb/connexiondb.php");
    include("C:/xampp/htdocs/pronostics/webadmin/modules/images/lister/requete_affiche_images.php");
  ?>

<?php $row = $stmt->fetch(PDO::FETCH_ASSOC)?>

<table class="table table-hover">
                      <thead>
                        <tr>
                          <th>Date d'ajout</th>
                   
                        </tr>
                      </thead>
                      <tbody>
    <tr>
                          <td><?php echo htmlspecialchars($row['Date_ajout']); ?></td>
                          <img src="http://localhost/pronostics/images/project/<?php echo htmlspecialchars($row['Nom_images']); ?>"  alt="Pas d'image disponible" whith="100" height="200"/>
                          <td><a href="http://localhost/pronostics/webadmin/modules/images/modifier/modification_images.php?Idimages=<?php echo htmlspecialchars($row['Idimages']); ?>"><label class="badge badge-warning">Modifier</label></a></td>
                          <td><a href="http://localhost/pronostics/webadmin/modules/images/supprimer/traitement_suppresion.php?Idimages=<?php echo htmlspecialchars($row['Idimages']); ?>"><label class="badge badge-danger">Supprimer</label></a></td>
    </tr>
    </tbody>
                    
                    </table>
                  </div>
                </div>
              </div>
              <?php echo@$msg ?>
 