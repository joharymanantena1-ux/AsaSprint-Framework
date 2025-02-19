<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
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
                                <h1 class="mt-4 mb-4">Liste des clients</h1>
                                <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Nom</th>
                                            <th scope="col">Prénom</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Téléphone</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Client> clients = (List<Client>) request.getAttribute("clients"); %>
                                        <% if (clients != null) { %>
                                            <% for (Client clientItem : clients) { %>
                                                <tr>
                                                    <td><%= clientItem.getNom() %></td>
                                                    <td><%= clientItem.getPrenom() %></td>
                                                    <td><%= clientItem.getEmail() %></td>
                                                    <td><%= clientItem.getTelephone() %></td>
                                                    <td>
                                                        <form action="<%= request.getContextPath() %>/formulaireClient" method="get" class="d-inline">
                                                            <input type="hidden" name="action" value="edit">
                                                            <input type="hidden" name="idClient" value="<%= clientItem.getIdClient() %>">
                                                            <button type="submit" class="btn btn-primary btn-sm">Modifier</button>
                                                        </form>
                                                        <form action="<%= request.getContextPath() %>/clients" method="post" class="d-inline">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="idClient" value="<%= clientItem.getIdClient() %>">
                                                            <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            <% } %>
                                        <% } else { %>
                                            <tr>
                                                <td colspan="5">Aucun client trouvé.</td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                                <a href="<%= request.getContextPath() %>/formulaireClient?action=create" class="btn btn-success">Ajouter un client</a>
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
