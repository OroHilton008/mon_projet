<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des centrales</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<!-- Bootstrap JS et dépendances -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


  </head>
<body>
       
<!-- Grid des données -->
<div class="row align-items-center">
  <div class="col-2"></div>
  <div class="col-sm-7">
    <h2 class="mt-5">Liste des centrales</h2>
  </div>
  <div class="col-sm-3 text-right">
    <button type="button" class="btn btn-success mt-5" data-toggle="modal" data-target="#modal-ajouter-centrale">
      Ajouter une centrale
    </button>
  </div>
</div>

<div class="modal fade" id="modal-ajouter-centrale">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Formulaire d'Ajout de Centrale</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
             
        <form action="save_centrale.php" method="POST">
         <div class="row mb-3">
              <div class="col-5">
                <label for="LocaliteCentrale" class="form-label">Localite de la Centrale</label>
              </div>    
              <div class="col-7">
                <input type="text" class="form-control" name= "LocaliteCentrale" id="LocaliteCentrale" placeholder="Entrez le Nom" required>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-5">
                <label for="LocalisationCentrale" class="form-label">Localisation</label>
              </div> 
              <div class="col-7">
                <input type="text" class="form-control" name= "LocalisationCentrale"id="LocalisationCentrale" placeholder="Entrez la localisation">
              </div>
             </div>
             <div class="row mt-3">
              <div class="col-5">
                <label for="superficie" class="form-label">Superficie</label>
              </div>
              <div class="col-7">
                <input type="text" class="form-control" name= "superficie" id="superficie" placeholder="Entrez la superficie" required>
              </div>
            </div>

            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
              <button name= "enregistrer" type="submit" class="text-center btn btn-primary col-4 ">Enregistrer</button>
  
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

</form>


        <table class="table table-striped">
            <thead>
                <tr>
                    <th>code</th>
                    <th>Localite</th>
                    <th>Localisation</th>
                    <th>Superficie</th>
                    <th>Modifier</th>
                    <th>Supprimer</th>
                </tr>
            </thead>
            <tbody>
                <?php
                include 'db_connection.php';
                 $sql = "SELECT * FROM centrale";

                 // Exécuter la requête
                 $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {?>
                        <tr>
                            <td><?php echo $row['code_centrale']; ?></td>
                            <td><?php echo htmlspecialchars ($row['localite_centrale']); ?></td>
                            <td><?php echo $row['localisation_centrale']; ?></td>
                            <td><?php echo $row['superficie_centrale']; ?></td>
  <td><button title="modifier les infos de :  <?php echo htmlspecialchars($row['localite_centrale']); ?>" class="btn btn-info btn-flat"
             data-toggle="modal" data-target="#modal-modifier-info-centrale<?php echo $row['code_centrale']; ?>">
       <i  class="fa fa-exclamation"></i>
        </button>
        <td><button title="supprimer les infos de :  <?php echo htmlspecialchars($row['localite_centrale']); ?>" class="btn btn-danger btn-flat"
             data-toggle="modal" data-target="#modal-supprimer-info-centrale<?php echo $row['code_centrale']; ?>">
             <i  class="fa fa-trash"></i>
        </button>

        <div class="modal fade" id="modal-modifier-info-centrale<?php echo $row['code_centrale']; ?>">
        <input type="hidden" name="code_centrale" value="<?php echo $row['code_centrale']; ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Formulaire de modification de la Centrale</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

            <form action="update_centrale.php" method="POST">
            <input type="hidden" name="code_centrale" value="<?php echo $row['code_centrale']; ?>">
            <div class="row mb-3">
              <div class="col-5">
                <label for="LocaliteCentrale" class="form-label">Localite de la Centrale</label>
              </div> 
              <div class="col-7">
            <input type="text" class="form-control" value="<?php echo $row['localite_centrale']; ?>" id="LocaliteCentrale" name="LocaliteCentrale" placeholder="Entrez le nom du fournisseur" required>
              </div>
      </div>
      <div class="row mb-3">
              <div class="col-5">
                <label for="LocalisationCentrale" class="form-label">Localisation</label>
              </div> 
              <div class="col-7">
                <input type="text" class="form-control" value="<?php echo $row['localisation_centrale']; ?>" id="LocalisationCentrale" name="LocalisationCentrale" placeholder="Entrez le contact">
              </div>
             </div>
             <div class="row mt-3">
              <div class="col-5">
                <label for="superficie" class="form-label">Superficie</label>
              </div>
              <div class="col-7">
                <input type="text" class="form-control" value="<?php echo $row['superficie_centrale']; ?>" id="superficie" name="superficie" placeholder="Entrez votre email" required>
              </div>
            </div>

            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
              <button type="submit" name="modifier_centrale" class="btn btn-primary">Modifier les infos</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
   </form>
      
      </td>
                        </tr>;


        <div class="modal fade" id="modal-supprimer-info-centrale<?php echo $row['code_centrale']; ?>">
        <input type="hidden" name="code_centrale" value="<?php echo $row['code_centrale']; ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Formulaire de suppression de Centrale</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>


            <div class="modal-body">
                <p>Voulez-vous vraiment supprimer la Centrale <strong><?php echo htmlspecialchars($row['localite_centrale']); ?></strong> ? Cette action est irréversible.</p>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                <form action="delete_centrale.php" method="POST">
                    <input type="hidden" name="code_centrale" value="<?php echo $row['code_centrale']; ?>">
                    <button type="submit" class="btn btn-danger">Supprimer</button>
                </form>
            </div>
        </div>
    </div>
</div>

</td>
            </tr>;


                        <?php
                    }
                } else {
                   echo "<tr><td colspan='4' class='text-center'>Aucun fournisseur trouvé</td></tr>";
                }
                ?>


    



            </tbody>
        </table>


        

        <div class="col-2">
                   <a href="depart.php" class="btn btn-secondary">Retour à l'accueil</a>
                 </div>
<?php
// Fermeture de la connexion
$conn->close();
?>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

                
                 
               
        