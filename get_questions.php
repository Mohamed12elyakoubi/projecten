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

$servername = "localhost:3306";
$username = "root";
$password = "";
$dbname = "database2";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $conn->prepare("SELECT Vragen.VraagID, Vragen.Vraag, GROUP_CONCAT(Antwoorden.Tekst) AS AntwoordTeksten
                           FROM Vragen
                           LEFT JOIN Antwoorden ON Vragen.VraagID = Antwoorden.VraagID
                           GROUP BY Vragen.VraagID
                           ORDER BY Vragen.VraagID");
    $stmt->execute();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<p><strong>Vraag {$row['VraagID']}:</strong> {$row['Vraag']}</p>";
        $antwoordTeksten = explode(",", $row['AntwoordTeksten']);
        foreach ($antwoordTeksten as $antwoord) {
            echo "<input type='radio' name='antwoord_{$row['VraagID']}' value='{$antwoord}'> {$antwoord}<br>";
        }
    }
}
catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
finally {
    $conn = null;
}

?>

</body>
</html>
