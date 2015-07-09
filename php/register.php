<?php
  session_start();
  define('SECURE', true); 
  require_once('config.php');

  if(!empty($_POST)) {

    $vorname = $_POST['vorname'];
    $name = $_POST['nachname'];
    $strasse = $_POST['strasse'];
    $hausnummer = $_POST['hausnummer'];
    $plz = $_POST['plz'];
    $ort = $_POST['ort'];
    $email = $_POST['email'];
    $passwort1 = $_POST['password'];
    $passwort2 = $_POST['password_ctrl'];
    $agb = $_POST['agb'];
    $user_id = $vorname . "_" . $name;
    
    $fehler = array();

    if(empty($_POST['vorname'])) {
      $fehler['vorname'] = 'Vorname darf nicht leer sein';
    }
    if(empty($_POST['nachname'])) {
      $fehler['nachname'] = 'Nachname darf nicht leer sein';
    }      
    if(empty($_POST['strasse'])) {
      $fehler['strasse'] = 'Straße darf nicht leer sein';
    }  
    if(empty($_POST['hausnummer'])) {
      $fehler['hausnummer'] = 'Hausnummer darf nicht leer sein';
    }
    if(empty($_POST['plz'])) {
      $fehler['plz'] = 'Postleitzahl darf nicht leer sein';
    }
    if(empty($_POST['ort'])) {
      $fehler['ort'] = 'Wohnort darf nicht leer sein';
    }
    if(empty($_POST['email'])) {
      $fehler['email'] = 'EMail darf nicht leer sein';
    }
    if(empty($_POST['password'])) {
          $fehler['passwort1'] = 'Passwort darf nicht leer sein';
    }
    if(empty($_POST['password_ctrl'])) {
      $fehler['passwort2'] = 'Passwort muss bestätigt werden';
    }          
    if($passwort1 != $passwort2){
      $fehler['passwort3'] = 'Passwörter stimmen nicht überein';
    }  
    if(empty($_POST['agb'])) {
      $fehler['agb'] = 'AGB wurden nicht akzeptiert';
    }

    if(empty($fehler)){
      // checken ob die Mailadresse bereits in der DB steht
      $query = $SQL->prepare('SELECT COUNT(email) FROM kundendaten WHERE email = ?'); //bereitet das SQL-Statement vor
      $query->bind_param('s', $email); //bindet die Daten gegen das vorbereitete Statement, bessere Performance und Schutz vor SQL-Injection
      $query->execute(); //führt das Statement aus
      $query->store_result(); //holt die Ergebnisse
      $query->bind_result($mail_count);
      $query->fetch();

      if($mail_count != 0){
        $fehler['mail_count'] = "Mailadresse bereits in DB vorhanden";
      }

      //wenn das fehler-array weiterhin leer ist, ist die Mailadresse noch frei --> führe den INSERT durch
      else{
        $query = $SQL->prepare('INSERT INTO kundendaten (user_id, password, email, strasse, hausnummer, plz, ort, name, vorname) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)'); //bereitet das SQL-Statement vor
        $query->bind_param('sssssssss', $user_id, $passwort1, $email, $strasse, $hausnummer, $plz, $ort, $name, $vorname); //bindet die Daten gegen das vorbereitete Statement, bessere Performance und Schutz vor SQL-Injection
        $query->execute();
        $query->close();
        $SQL->close();

        header("Location: pizzen.php"); //Nach dem INSERT gehts direkt zu den Pizzen
      };


    };
  };
?>

<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Pizzen</title>

    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="dist/js/jquery-2.1.4.min.js"></script>
    <script src="dist/js/script.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/jquery-2.1.4.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <?php include('top_nav.php');?>


    <!-- Row Container -->
    <div class="container">
      <!-- Row -->
      <div class="row">
        <div class="col-md-6">
          <h2>Sie sind bereits registriert?</h1>
        </div> <!-- /Spalte -->
        <div class="col-md-6">
          <p><h2>Sie sind Neukunde?</h1></p>
          <form action="register.php" class="form-horizontal" method="post" >
            <div class="form-group">
              <label for="vorname" class="col-sm-2 control-label">Vorname:</label>
              <div class="col-sm-10">
                <input type="text" pattern="\D.{1,}" name="vorname" id="vorname" value="<?php echo($_POST['vorname']); ?>" class="form-control" placeholder="Vorname">
              </div>
            </div>
            <div class="form-group">
              <label for="nachname" class="col-sm-2 control-label">Nachname:</label>
              <div class="col-sm-10">
                <input type="text" pattern="\D.{1,}" name="nachname" id="nachname" value="<?php echo $_POST['nachname']; ?>"class="form-control" placeholder="Nachname">
              </div>
            </div>
            <div class="form-group">
              <label for="strasse" class="col-sm-2 control-label">Straße:</label>
              <div class="col-sm-10">
                <input type="text"  name="strasse" id="strasse" class="form-control" value="<?php echo $_POST['strasse']; ?>"placeholder="Straße">
              </div>
            </div>
            <div class="form-group">
              <label for="hausnummer" class="col-sm-2 control-label">Hausnummer:</label>
              <div class="col-sm-10">
                <input type="text" name="hausnummer" id="hausnummer" value="<?php echo $_POST['hausnummer']; ?>" class="form-control" placeholder="Nr">
              </div>
            </div>
            <div class="form-group">
              <label for="plz" class="col-sm-2 control-label">Postleitzahl:</label>
              <div class="col-sm-10">
                <input type="text" name="plz" id="plz" value="<?php echo $_POST['plz']; ?>" class="form-control" placeholder="00000">
              </div>
            </div>
            <div class="form-group">
              <label for="ort" class="col-sm-2 control-label">Ort:</label>
              <div class="col-sm-10">
                <input type="text" name="ort" id="ort" value="<?php echo $_POST['ort']; ?>" class="form-control" placeholder="Stadtname">
              </div>
            </div>
            <div class="form-group">
              <label for="email" class="col-sm-2 control-label">Email:</label>
              <div class="col-sm-10">
                <input type="text" name="email" id="email" value="<?php echo $_POST['email']; ?>" class="form-control" placeholder="muster@beispiel.de">
              </div>
            </div>
            <div class="form-group">
              <label for="password" class="col-sm-2 control-label">Passwort:</label>
              <div class="col-sm-10">
                <input type="password" name="password" id="password" class="form-control" placeholder="Mindestens 8 Zeichen">
              </div>
            </div>
            <div class="form-group">
              <label for="password_ctrl" class="col-sm-2 control-label">Passwort wiederholen:</label>
              <div class="col-sm-10">
                <input type="password" name="password_ctrl" id="password_ctrl" class="form-control" placeholder="Passwort wiederholen">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="agb" required> AGB gelesen
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Registrieren</button>
              </div>
            </div>
          </form>
          <?php
          if(!empty($fehler)){
            // Ausgabe der gesammelten Fehlermeldungen
            echo "<ul class='errors'>\n";
            foreach ($fehler as $feldname => $meldung) {
              printf("<li>%s</li>\n", htmlspecialchars($meldung));
            }
            echo "</ul>\n";
          };
          ?>            

        </div> <!-- /Spalte -->  
      </div> <!-- /Row -->
    </div> <!-- /Row Container -->
  </body>
</html>
