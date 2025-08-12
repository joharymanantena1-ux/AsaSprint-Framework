package controller;

import model.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String mdp = request.getParameter("mdp");

        Client client = new Client(email, mdp);

        if (client.login()) {
            HttpSession session = request.getSession();
            session.setAttribute("client", client);
            request.getRequestDispatcher("view/home.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Email ou mot de passe incorrect");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        }
    }
}