<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Seance" %>
<%@ include file="include/header.jsp" %>

<body>
    <div class="container-scroller">
        <%@ include file="include/sidebar.jsp" %>

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="mt-4 mb-4">Liste des séances</h1>

                                <!-- Formulaire de recherche -->
                                <!-- Formulaire de recherche -->
                                <form method="get" action="seances" class="mb-2">
                                    <div class="form-group">
                                        <label for="startTime">Date de début :</label>
                                        <input type="text" id="startTime" name="startTime" class="form-control" placeholder="jj/mm/aaaa">
                                    </div>
                                    <div class="form-group">
                                        <label for="endTime">Date de fin :</label>
                                        <input type="text" id="endTime" name="endTime" class="form-control" placeholder="jj/mm/aaaa">
                                    </div>
                                    <div class="form-group">
                                        <label for="salle">Salle :</label>
                                        <input type="text" id="salle" name="salle" class="form-control">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Rechercher</button>
                                </form>


                                <!-- Liste des séances -->
                                <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Film</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Heure début</th>
                                            <th scope="col">Heure fin</th>
                                            <th scope="col">Salle</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            List<Seance> seances = (List<Seance>) request.getAttribute("seances");
                                            if (seances != null && !seances.isEmpty()) {
                                                for (Seance seance : seances) { 
                                        %>
                                        <tr>
                                            <td><%= seance.getIdSeance() %></td>
                                            <td><%= seance.getIdFilm() %></td>
                                            <td><%= seance.getDateSeance() %></td>
                                            <td><%= seance.getHeureDebut() %></td>
                                            <td><%= seance.getHeureFin() %></td>
                                            <td><%= seance.getSalle() %></td>
                                            <td>
                                                <form action="formulaireSeance" method="get" class="d-inline">
                                                    <input type="hidden" name="action" value="edit">
                                                    <input type="hidden" name="idSeance" value="<%= seance.getIdSeance() %>">
                                                    <button type="submit" class="btn btn-primary btn-sm">Modifier</button>
                                                </form>
                                                <form action="seances" method="post" class="d-inline">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="idSeance" value="<%= seance.getIdSeance() %>">
                                                    <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                                </form>
                                            </td>
                                        </tr>
                                        <% 
                                                } 
                                            } else { 
                                        %>
                                        <tr>
                                            <td colspan="7">Aucune séance trouvée</td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                                <a href="formulaireSeance?action=create" class="btn btn-success">Ajouter une séance</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="include/footer.jsp" %>
        </div>
    </div>
</body>
</html>
