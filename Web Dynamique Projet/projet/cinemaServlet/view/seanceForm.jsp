<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Seance" %>
<%@ include file="include/header.jsp" %>

<body>
    <div class="container-scroller">
        <%@ include file="include/sidebar.jsp" %>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="mt-4 mb-4">Formulaire Séance</h1>
                                <form action="formulaireSeance" method="post">
                                    <input type="hidden" name="action" value="<%= (request.getAttribute("seance") != null) ? "update" : "create" %>">
                                    <input type="hidden" name="idSeance" value="<%= (request.getAttribute("seance") != null) ? ((Seance) request.getAttribute("seance")).getIdSeance() : "" %>">
                                    <div class="form-group">
                                        <label for="idFilm">ID Film</label>
                                        <input type="text" class="form-control" id="idFilm" name="idFilm" value="<%= (request.getAttribute("seance") != null) ? ((Seance) request.getAttribute("seance")).getIdFilm() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="dateSeance">Date Séance</label>
                                        <input type="date" class="form-control" id="dateSeance" name="dateSeance" value="<%= (request.getAttribute("seance") != null) ? ((Seance) request.getAttribute("seance")).getDateSeance() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="heureDebut">Heure Début</label>
                                        <input type="time" class="form-control" id="heureDebut" name="heureDebut" value="<%= (request.getAttribute("seance") != null) ? ((Seance) request.getAttribute("seance")).getHeureDebut() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="heureFin">Heure Fin</label>
                                        <input type="time" class="form-control" id="heureFin" name="heureFin" value="<%= (request.getAttribute("seance") != null) ? ((Seance) request.getAttribute("seance")).getHeureFin() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="salle">Salle</label>
                                        <input type="text" class="form-control" id="salle" name="salle" value="<%= (request.getAttribute("seance") != null) ? ((Seance) request.getAttribute("seance")).getSalle() : "" %>">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                                </form>
                                <a href="seances" class="btn btn-secondary">Retour à la liste des séances</a>
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
