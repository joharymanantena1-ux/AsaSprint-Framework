<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Reservation" %>
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
                                <h1 class="text-center"><%= request.getAttribute("reservation") == null ? "Ajouter une réservation" : "Modifier une réservation" %></h1>
                                <form action="<%= request.getContextPath() %>/formulaireRes" method="post">
                                    <% if (request.getAttribute("reservation") != null) { %>
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="idReservation" value="<%= ((Reservation) request.getAttribute("reservation")).getIdReservation() %>">
                                    <% } else { %>
                                        <input type="hidden" name="action" value="create">
                                    <% } %>
                                    <div class="form-group">
                                        <label for="idSeance">ID Séance :</label>
                                        <input type="text" class="form-control" id="idSeance" name="idSeance" required 
                                               value="<%= request.getAttribute("reservation") != null ? ((Reservation) request.getAttribute("reservation")).getIdSeance() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="idClient">ID Client :</label>
                                        <input type="text" class="form-control" id="idClient" name="idClient" required 
                                               value="<%= request.getAttribute("reservation") != null ? ((Reservation) request.getAttribute("reservation")).getIdClient() : "" %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="nombreTickets">Nombre de Tickets :</label>
                                        <input type="text" class="form-control" id="nombreTickets" name="nombreTickets" required 
                                               value="<%= request.getAttribute("reservation") != null ? ((Reservation) request.getAttribute("reservation")).getNombreTickets() : "" %>">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                                    <a href="<%= request.getContextPath() %>/lesreservation" class="btn btn-secondary">Annuler</a>
                                </form>
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
