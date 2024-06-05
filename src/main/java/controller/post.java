package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Model.Pages;
import Model.PostModel;
import Model.User;

/**
 * Servlet implementation class post
 */
@WebServlet("/View/Postmanapage/Post")
public class post extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public post() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		System.out.println(user_id);
		User us = new User().NewUserModel(user_id);
		System.out.println(us.getFullName());
		ArrayList<Pages> posts = new PostModel().getPostByid_user(us.getUserId());
		System.out.println((posts));
		request.setAttribute("user", us);
		request.setAttribute("posts", posts);
		request.getRequestDispatcher("Postmanapage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String req = request.getParameter("req");
		switch(req) {
			case "delete_post":
				int id = Integer.parseInt(request.getParameter("id"));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				String json = "";
				if(new PostModel().DeletePostByID(id)){				
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
