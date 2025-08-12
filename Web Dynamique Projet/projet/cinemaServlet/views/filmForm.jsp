<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                <h1 class="text-center"><%= request.getAttribute("film") == null ? "Ajouter un film" : "Modifier un film" %></h1>
                                <form action="<%= request.getContextPath() %>/formulaireFilm" method="post">
                                    <input type="hidden" name="action" value="<%= request.getAttribute("film") == null ? "create" : "update" %>">
                                    <% if (request.getAttribute("film") != null) { %>
                                        <input type="hidden" name="idFilm" value="<%= ((Film) request.getAttribute("film")).getIdFilm() %>">
                                    <% } %>
                                    <div class="form-group">
                                        <label for="titre">Titre :</label>
                                        <input type="text" class="form-control" id="titre" name="titre" value="<%= request.getAttribute("film") != null ? ((Film) request.getAttribute("film")).getTitre() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="realisateur">Réalisateur :</label>
                                        <input type="text" class="form-control" id="realisateur" name="realisateur" value="<%= request.getAttribute("film") != null ? ((Film) request.getAttribute("film")).getRealisateur() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="anneeSortie">Année de sortie :</label>
                                        <input type="number" class="form-control" id="anneeSortie" name="anneeSortie" value="<%= request.getAttribute("film") != null ? ((Film) request.getAttribute("film")).getAnneeSortie() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="genre">Genre :</label>
                                        <input type="text" class="form-control" id="genre" name="genre" value="<%= request.getAttribute("film") != null ? ((Film) request.getAttribute("film")).getGenre() : "" %>">
                                    </div>
                                    <button type="submit" class="btn btn-primary"><%= request.getAttribute("film") == null ? "Ajouter" : "Modifier" %></button>
                                </form>
                                <a href="<%= request.getContextPath() %>/films" class="btn btn-link">Retour à la liste des films</a>
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
