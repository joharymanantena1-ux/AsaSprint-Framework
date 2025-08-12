<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
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
                                <h1 class="mt-4 mb-4">Liste des réservations</h1>
                                <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">ID Séance</th>
                                            <th scope="col">ID Client</th>
                                            <th scope="col">Nombre de Tickets</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Reservation reservation : (List<Reservation>) request.getAttribute("reservations")) { %>
                                            <tr>
                                                <td><%= reservation.getIdReservation() %></td>
                                                <td><%= reservation.getIdSeance() %></td>
                                                <td><%= reservation.getIdClient() %></td>
                                                <td><%= reservation.getNombreTickets() %></td>
                                                <td>
                                                    <form action="formulaireRes" method="get" class="d-inline">
                                                        <input type="hidden" name="action" value="edit">
                                                        <input type="hidden" name="idReservation" value="<%= reservation.getIdReservation() %>">
                                                        <button type="submit" class="btn btn-primary btn-sm">Modifier</button>
                                                    </form>
                                                    <form action="lesreservation" method="post" class="d-inline">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="idReservation" value="<%= reservation.getIdReservation() %>">
                                                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                                <a href="formulaireRes?action=create" class="btn btn-success">Ajouter une réservation</a>
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
