<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Client" %>
<%@ include file="include/header.jsp" %>

<body>
    <div class="container-scroller">
        <%@ include file="include/sidebar.jsp" %>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="text-center"><%= request.getAttribute("client") == null ? "Ajouter un client" : "Modifier un client" %></h1>
                                <form action="<%= request.getContextPath() %>/formulaireClient" method="post">
                                    <input type="hidden" name="action" value="<%= request.getAttribute("client") == null ? "create" : "update" %>">
                                    <% if (request.getAttribute("client") != null) { %>
                                        <input type="hidden" name="idClient" value="<%= ((Client) request.getAttribute("client")).getIdClient() %>">
                                    <% } %>
                                    <div class="form-group">
                                        <label for="nom">Nom :</label>
                                        <input type="text" class="form-control" id="nom" name="nom" value="<%= request.getAttribute("client") != null ? ((Client) request.getAttribute("client")).getNom() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="prenom">Prénom :</label>
                                        <input type="text" class="form-control" id="prenom" name="prenom" value="<%= request.getAttribute("client") != null ? ((Client) request.getAttribute("client")).getPrenom() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email :</label>
                                        <input type="email" class="form-control" id="email" name="email" value="<%= request.getAttribute("client") != null ? ((Client) request.getAttribute("client")).getEmail() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="telephone">Téléphone :</label>
                                        <input type="phone" class="form-control" id="telephone" name="telephone" value="<%= request.getAttribute("client") != null ? ((Client) request.getAttribute("client")).getTelephone() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="mdp">Mot de passe :</label>
                                        <input type="password" class="form-control" id="mdp" name="mdp" value="<%= request.getAttribute("client") != null ? ((Client) request.getAttribute("client")).getMdp() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary"><%= request.getAttribute("client") == null ? "Ajouter" : "Modifier" %></button>
                                    </div>
                                </form>
                                <a href="<%= request.getContextPath() %>/clients" class="text-center">Retour à la liste des clients</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="include/footer.jsp" %>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
</body>
</html>
