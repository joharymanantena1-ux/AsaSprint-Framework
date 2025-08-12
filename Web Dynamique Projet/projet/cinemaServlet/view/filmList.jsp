<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Film" %>
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
                                <h1 class="mt-4 mb-4">Liste des films</h1>

                                <!-- Search Form -->
                                <form action="<%= request.getContextPath() %>/films" method="get" class="form-inline mb-4">
                                    <input type="hidden" name="action" value="search">
                                    <input type="text" name="title" placeholder="Rechercher par titre" class="form-control mr-2" value="<%= request.getAttribute("searchQuery") != null ? request.getAttribute("searchQuery") : "" %>">
                                    <button type="submit" class="btn btn-primary">Rechercher</button>
                                </form>

                                <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Titre</th>
                                            <th scope="col">Réalisateur</th>
                                            <th scope="col">Année de sortie</th>
                                            <th scope="col">Genre</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            List<Film> films = (List<Film>) request.getAttribute("films");
                                            if (films != null && !films.isEmpty()) {
                                                for (Film film : films) { 
                                        %>
                                            <tr>
                                                <td><%= film.getTitre() %></td>
                                                <td><%= film.getRealisateur() %></td>
                                                <td><%= film.getAnneeSortie() %></td>
                                                <td><%= film.getGenre() %></td>
                                                <td>
                                                    <form action="<%= request.getContextPath() %>/formulaireFilm" method="get" class="d-inline">
                                                        <input type="hidden" name="action" value="edit">
                                                        <input type="hidden" name="idFilm" value="<%= film.getIdFilm() %>">
                                                        <button type="submit" class="btn btn-primary btn-sm">Modifier</button>
                                                    </form>
                                                    <form action="<%= request.getContextPath() %>/films" method="post" class="d-inline">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="idFilm" value="<%= film.getIdFilm() %>">
                                                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        <% 
                                                }
                                            } else { 
                                        %>
                                            <tr>
                                                <td colspan="5" class="text-center">Aucun film trouvé</td>
                                            </tr>
                                        <% 
                                            } 
                                        %>
                                    </tbody>
                                </table>
                                <a href="<%= request.getContextPath() %>/formulaireFilm?action=create" class="btn btn-success">Ajouter un film</a>
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
