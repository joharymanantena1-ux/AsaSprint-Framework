<%@ page import="java.util.*" %>

<!-- <%
    String baseUrl = (String) request.getAttribute("baseUrl");
    String nomSession = (String) request.getSession().getAttribute("session_nom");
    String mdpSession = (String) request.getSession().getAttribute("session_mdp");
    String nom = String.valueOf(request.getAttribute("anarana"));
    String succes = (String) request.getAttribute("uploadMessage");
    String nomFichier = "";
    
    if (succes != null && !succes.isEmpty()) {
        nomFichier = (String) request.getAttribute("filename");
    }
   
%> -->

<%
    String parDefautNom = "";
    String parDefautEmail = "";
    String parDefautArgent = "";
    String parDefautPoste = "";
    String parDefautNum = "";
    List<String> erreurNom = (List<String>) request.getAttribute("error_emp.nom");
    List<String> erreurEmail = (List<String>) request.getAttribute("error_emp.email");
    List<String> erreurArgent = (List<String>) request.getAttribute("error_emp.argent");
    if ((erreurNom != null && !erreurNom.isEmpty()) || (erreurEmail != null && !erreurEmail.isEmpty()) || (erreurArgent != null && !erreurArgent.isEmpty())){
        parDefautNom = (String) request.getAttribute("emp.nom");
        parDefautEmail = (String) request.getAttribute("emp.email");
        parDefautArgent = (String) request.getAttribute("emp.argent");
        parDefautPoste = (String) request.getAttribute("poste");
        parDefautNum = (String) request.getAttribute("num");
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenue dans insertion Formulaire</title>
</head>
<body>
    <center>

        <!-- <h1>On a une session ici de cles session_nom avec une valeur <%=nomSession %> et de nom <%=nom  %> et une session_mdp avec une valeur <%=mdpSession %></h1>
        <h2><%=succes  %> avec le getHeader = <%=nomFichier %></h2> -->


        <h2>Formulaire d'insertion d'employer par Object(Type de retour String)</h2>
        <form action="<%=baseUrl %>/insertionObjet" method="get">
            <div>
                <label for="nom">Nom :</label>
                <input type="text" name="emp.nom" value="<%=parDefautNom %>">
                <% if (erreurNom != null && !erreurNom.isEmpty()) { %>
                    <p style="color: red;">
                        <% for (String erreur : erreurNom) { %>
                            <%= erreur %><br>
                        <% } %>
                    </p>
                <% } %>
            </div>
            <hr>
            <div>
                <label for="mail">Email :</label>
                <input type="text" name="emp.email" value="<%=parDefautEmail %>">
                <% if (erreurEmail != null && !erreurEmail.isEmpty()) { %>
                    <p style="color: red;">
                        <% for (String erreur : erreurEmail) { %>
                            <%= erreur %><br>
                        <% } %>
                    </p>
                <% } %>
            </div>
            <hr>
            <div>
                <label for="argent">Argent :</label>
                <input type="text" name="emp.argent" value="<%=parDefautArgent %>">
                <% if (erreurArgent != null && !erreurArgent.isEmpty()) { %>
                    <p style="color: red;">
                        <% for (String erreur : erreurArgent) { %>
                            <%= erreur %><br>
                        <% } %>
                    </p>
                <% } %>
            </div>
            <hr>
            <div>
                <label for="poste">Poste :</label>
                <input type="text" name="poste" value="<%=parDefautPoste %>">
            </div>
            <hr>
            <div>
                <label for="num">Numero telephone :</label>
                <input type="text" name="num" value="<%=parDefautNum %>">
            </div>
            <br>
            <div>
                <input type="submit" value="Valider">
            </div>
        </form>
    </center>
</body>
</html>