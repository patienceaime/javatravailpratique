<html>
<head>
    <title>Ajouter un utilisateur</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h2>Ajouter</h2>
    <form action="UserServlet" method="post">
        <input type="text" name="nom" placeholder="Nom" required><br>
        <input type="text" name="prenom" placeholder="Prénom" required><br>
        <input type="number" name="age" placeholder="Âge" required><br>
        <input type="submit" value="Ajouter" class="btn">
    </form>
</div>
</body>
</html>
