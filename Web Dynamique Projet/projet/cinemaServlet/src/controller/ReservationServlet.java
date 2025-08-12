package controller;

import model.Reservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ReservationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Reservation> reservations = Reservation.getAll();
        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("view/reservationList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }
        
        String action = request.getParameter("action");
        int idReservation = Integer.parseInt(request.getParameter("idReservation"));

        if ("delete".equals(action)) {
            Reservation reservation = new Reservation();
            reservation.setIdReservation(idReservation);
            reservation.delete();
        }

        response.sendRedirect("lesreservation");
    }

    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}
