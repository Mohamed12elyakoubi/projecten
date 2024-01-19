<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $servername = "localhost:3306";
    $username = "root";
    $password = "";
    $dbname = "database2";

    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        
        foreach ($_POST as $key => $value) {
            if (strpos($key, 'antwoord_') === 0) {
                $vraagID = substr($key, strlen('antwoord_'));
                $antwoord = $value;

                
                $stmt = $conn->prepare("INSERT INTO Antwoorden (VraagID, Waarde) VALUES (?, ?)");
                $stmt->execute([$vraagID, $antwoord]);
            }
        }

        
        header("Location: resultaten.php");
    }
    catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
    finally {
        
        $conn = null;
    }
}
?>

</body>
</html>