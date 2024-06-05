package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.User;

/**
 * Servlet implementation class HomeController
 */

@WebServlet("/View/Homepage/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("message");
        request.getRequestDispatcher("./register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String fullName = request.getParameter("full_name");
        String password = request.getParameter("password");

        User user = new User(fullName, email, password);
        
        if (user.exists(email) != null) {
            request.getSession().setAttribute("message", "Email hoặc số điện thoại đã tồn tại!");
            request.getRequestDispatcher("./register.jsp").forward(request, response);
            
            return;
        }

        if (user.register()) {
            response.sendRedirect("/BTL/View/Homepage/Login");
        } else {
            request.getSession().setAttribute("message", "Tạo tài khoản mới thất bại!");
            request.getRequestDispatcher("./register.jsp").forward(request, response);
        }
	}

}
