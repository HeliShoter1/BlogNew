package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;




import Model.Pages;
import Model.PostModel;
import Model.User; 	
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostEdit
 */
@WebServlet("/View/Editpostpage/PostEdit")
public class PostEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		int id_post = Integer.parseInt(request.getParameter("id_post"));
		User us = new User().NewUserModel(user_id);
		Pages p = new PostModel().getPostByid(id_post);
		request.setAttribute("user", us);
		request.setAttribute("Post", p);
		request.getRequestDispatcher("Posteditpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String req = request.getParameter("req");
		switch(req) {
			case "save_post":
				int id = Integer.parseInt(request.getParameter("id"));
				String title = request.getParameter("title");
				String des = request.getParameter("descript");
				String content = request.getParameter("cont");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				String json = "";
				if(new PostModel().UpdatePost(id, title, des, content)){				
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
