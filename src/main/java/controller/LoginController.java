package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.Login;
import Model.User;

/**
 * Servlet implementation class LoginController
 */

@WebServlet("/View/Homepage/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        request.getRequestDispatcher("./login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Login login = new Login(email, password);
       
        
        if (login.validate() != null) {  
        	User user = login.validate();
             Cookie UserId = new Cookie("email", String.valueOf(user.getUserId()));
             Cookie role = new Cookie("role", user.getRole());
             Cookie fullNameCookie = new Cookie("fullName", user.getFullName().replaceAll("\\s", "_"));
             Cookie	EmailCookie = new Cookie("emailUser", user.getEmail().replaceAll("@", "_"));
            response.addCookie(UserId);
            response.addCookie(role);
            response.addCookie(fullNameCookie);
            response.addCookie(EmailCookie);
            response.sendRedirect(request.getContextPath() + "/View/Homepage/");
        } else {
            request.getSession().setAttribute("message", "Thông tin tài khoản không đúng!");
            request.getRequestDispatcher("./login.jsp").forward(request, response);
        }
	}

}
