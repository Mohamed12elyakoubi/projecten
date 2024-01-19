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

        $stmt = $conn->prepare("SELECT AVG(Waarde) AS Gemiddelde, Categorieen.Omschrijving
                               FROM Antwoorden
                               JOIN Vragen ON Antwoorden.VraagID = Vragen.VraagID
                               JOIN Categorieen ON Antwoorden.CategorieID = Categorieen.CategorieID
                               GROUP BY Categorieen.CategorieID");
        $stmt->execute();

        echo "<h2>Resultaten:</h2>";

        if ($stmt->rowCount() > 0) {
            echo "<ul>";
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<li>{$row['Omschrijving']}: {$row['Gemiddelde']}</li>";
            }
            echo "</ul>";
        } else {
            echo "Geen resultaten gevonden.";
        }
    }
    catch (PDOException $e) {
        echo "Query mislukt: " . $e->getMessage();
    }
    finally {
        $conn = null;
    }
    ?>

</body>
</html>