package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import com.google.gson.Gson;

import java.io.PrintWriter;

import Model.HomeModel;
import Model.Pages;

/**
 * Servlet implementation class home
 */
@WebServlet("/View/Homepage/")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public home() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Pages> ArrPages = HomeModel.getPostIndex("%",1);
		ArrayList<Pages> Most_View = HomeModel.GetMostView();
		ArrayList<Pages> EarliestPost = HomeModel.getEarliestPost();
		ArrayList<String> Category = HomeModel.getCategory();
		int number = HomeModel.GetAllPage().size();
		request.setAttribute("EarliestPost", EarliestPost);
		request.setAttribute("Number", number);
		request.setAttribute("Page", ArrPages);
		request.setAttribute("Most_View", Most_View);
		request.setAttribute("Category", Category);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String value = request.getParameter("value");
		ArrayList<Pages> ArrPages = HomeModel.getCategoryPost(value);
		Gson gson = new Gson();
		String json = gson.toJson(ArrPages);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
	    out.print(json);
	    out.flush();
	    out.close();
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(123);
	}

}
