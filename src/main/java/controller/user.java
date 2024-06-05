package controller;


import java.io.IOException;
import java.io.PrintWriter;

import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class user
 */
@WebServlet("/View/Userpage/user")
public class user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		Cookie[] logined = request.getCookies();
		String[] cookie = new String[5];
		if(logined != null){
		for(int i = 0;i<logined.length;i++){
				System.out.println(logined[i].getName() + " " + logined[i].getValue());
		}}
		User us = new User().NewUserModel(user_id);
		request.setAttribute("user", us);
		request.getRequestDispatcher("userpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String req = request.getParameter("req");
		switch(req) {
			case "save_info":
				int id = Integer.parseInt(request.getParameter("id"));
				String name = request.getParameter("username");
				String des = request.getParameter("descript");
				User us = new User();
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				String json = "";
				if(us.SavenewInfo(id, name, des)) {
					
					json = "{\"status\" : 200 }";
				}else {
					json = "{\"status\" : 500}";
				}
				PrintWriter out = response.getWriter();
			    out.print(json);
			    out.flush();
				break;	
		}
	}

}
