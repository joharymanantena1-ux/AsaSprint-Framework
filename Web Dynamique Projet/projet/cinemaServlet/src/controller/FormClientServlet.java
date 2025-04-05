package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Client;

public class FormClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if user is authenticated
        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect to log page if not authenticated
            return;
        }
        
        String action = request.getParameter("action");
        Client client = null;
        if ("edit".equals(action)) {
            int idClient = Integer.parseInt(request.getParameter("idClient"));
            client = Client.getById(idClient);
        }
        request.setAttribute("client", client);
        request.getRequestDispatcher("view/formClient.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if user is authenticated
        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect to log page if not authenticated
            return;
        }
        
        String action = request.getParameter("action");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String mdp = request.getParameter("mdp");

        if ("create".equals(action)) {
            Client client = new Client(nom, prenom, email, telephone, mdp);
            boolean success = client.insert();
            if (!success) {
                request.setAttribute("error", "Failed to create client");
            }
        } else if ("update".equals(action)) {
            int idClient = Integer.parseInt(request.getParameter("idClient"));
            Client client = new Client(nom, prenom, email, telephone, mdp);
            client.setIdClient(idClient);
            boolean success = client.update();
            if (!success) {
                request.setAttribute("error", "Failed to update client");
            }
        }

        response.sendRedirect("clients");
    }

    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}
