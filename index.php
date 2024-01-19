<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beroepskeuzetest</title>
    <link rel="stylesheet" href="style.css">

</head>
<body>
    <h1>Beroepskeuzetest</h1>

    <form action="process.php" method="post"> 
        <?php include 'get_questions.php'; ?>

        <input type="submit" value="Resultaten tonen">
    </form>
</body>
</html>
