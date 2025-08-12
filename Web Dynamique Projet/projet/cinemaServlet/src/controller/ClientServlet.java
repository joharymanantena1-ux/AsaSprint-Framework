package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Client;

public class ClientServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Client> clients = Client.getAll();
        request.setAttribute("clients", clients);

        // Retrieve and set the number of registered clients
        // int nombreClients = Client.getNombreClientInscrit();
        // request.setAttribute("nombreClients", nombreClients);

        // Forward request to the JSP
        request.getRequestDispatcher("view/listeClients.jsp").forward(request, response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Authentification Client
        if (!isLoggedIn(request)) {
            response.sendRedirect("log"); // Redirect login
            return;
        }
        
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int idClient = Integer.parseInt(request.getParameter("idClient"));
            Client client = new Client();
            client.setIdClient(idClient);
            boolean success = client.delete();
            if (!success) {
                request.setAttribute("error", "Failed to delete client");
            }
        }
        response.sendRedirect("clients");
    }

    // Helper method to check if user is logged in
    private boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("client") != null;
    }
}
