<%
    String baseUrl = (String) request.getAttribute("baseUrl");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Se Connecter...</title>
</head>
<body>
    <center>
        <h2>Projet Sprint Login</h2>
        <form action="<%=baseUrl %>/traitementlogin" method="post" enctype="multipart/form-data">
            <div>
                <label for="nom">Pseudo :</label>
                <input type="text" name="pseudo">
            </div>
            <hr>
            <div>
                <label for="cin">Cin :</label>
                <input type="file" name="cin">
            </div>
            <hr>
            <hr>
            <div>
                <label for="mail">Email :</label>
                <input type="email" name="mail">
            </div>
            <hr>
            <div>
                <label for="argent">Mot de passe :</label>
                <input type="password" name="mdp">
            </div>
            <br>
            <div>
                <input type="submit" value="Connecter">
            </div>
        </form>
    </center>
</body>
</html>