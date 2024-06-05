package Model;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class HomeModel {
	private static Connection connection = DBconnect.connect();
	
	private static String SELECT_ALL_POST = "SELECT *	FROM public.\"post\" order by date;";
	private static String Select_Most_View ="SELECT * FROM post order by view desc limit 3;";
	private static String Select_Earliest_Post = "Select * from public.\"post\" order by date limit 5;";
	private static String SELECT_ALL_POST_CATEGORY = "SELECT *	FROM public.post where \"content\" like '%s' order by date ;";
	private static String Select_Content =  "SELECT \"content\" FROM public.post group by \"content\" order by SUM(\"view\") desc;";
	private static String Select_Item_Index = "SELECT *	FROM public.\"post\" where content like '%s' order by \"date\" OFFSET %s LIMIT 8;";
	private static String Delete_Post_Index = "DELETE FROM public.post where id = %s";
	
	public static ArrayList<Pages> GetAllPage(){
		ArrayList<Pages> PageArray = new ArrayList<>();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(SELECT_ALL_POST);
	
			while(rs.next()) {
				Pages st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"), rs.getDate("Date"),rs.getString("img"));
				PageArray.add(st);
			}

			rs.close();
            statement.close();
            return PageArray;
			} catch (Exception e) {
				System.out.print(e);
				return null;
			}
	}
	public static ArrayList<Pages> GetMostView() {
		ArrayList<Pages> PageArray = new ArrayList<>();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(Select_Most_View);
	
			while(rs.next()) {
				Pages st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"), rs.getDate("Date"),rs.getString("img"));
				PageArray.add(st);
			}

			rs.close();
            statement.close();
            return PageArray;
			} catch (Exception e) {
				System.out.print(e);
				return null;
			}
	}
	
	public static ArrayList<Pages> getEarliestPost(){
		ArrayList<Pages> PageArray = new ArrayList<>();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(Select_Earliest_Post);
	
			while(rs.next()) {
				Pages st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"), rs.getDate("Date"),rs.getString("img"));
				PageArray.add(st);
			}

			rs.close();
            statement.close();
            return PageArray;
			} catch (Exception e) {
				System.out.print(e);
				return null;
			}
	}
	
	public static ArrayList<Pages> getCategoryPost(String value){
		ArrayList<Pages> PageArray = new ArrayList<>();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(String.format(SELECT_ALL_POST_CATEGORY, value));
	
			while(rs.next()) {
				Pages st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"), rs.getDate("Date"),rs.getString("img"));
				PageArray.add(st);
			}

			rs.close();
            statement.close();
            return PageArray;
			} catch (Exception e) {
				System.out.print(e);
				return null;
			}
	}
	
	public static ArrayList<String> getCategory(){
		ArrayList<String> PageArray = new ArrayList<>();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(Select_Content);
	
			while(rs.next()) {
				PageArray.add(rs.getString("content"));
			}

			rs.close();
            statement.close();
            return PageArray;
			} catch (Exception e) {
				System.out.print(e);
				return null;
			}
	}
	
	public static ArrayList<Pages> getPostIndex(String s, Integer k){
		ArrayList<Pages> PageArray = new ArrayList<>();

		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(String.format(Select_Item_Index,s, (k-1)*8));
			while(rs.next()) {
				Pages st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"), rs.getDate("Date"),rs.getString("img"));
				PageArray.add(st);
			}

			rs.close();
            statement.close();
            return PageArray;
			} catch (Exception e) {
				System.out.print(e);
				return null;
			}
	}
	
	public static void DeletePost(String s) {
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(String.format(Delete_Post_Index,s));
			rs.close();
            statement.close();
		}catch (Exception e) {
			
		}
	}
	
	
	
	public static void main(String[] args) {
	    System.out.println(GetAllPage());
	}
}
