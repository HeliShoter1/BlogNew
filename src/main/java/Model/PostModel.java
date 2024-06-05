package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import controller.post;

public class PostModel {
	
	private static Connection connection = DBconnect.connect();
	
	public ArrayList<Pages> getPostByid_user(int id_user){
		ArrayList<Pages> posts = new ArrayList<Pages>();
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM post WHERE \"Id_Author\" = "+id_user+" ");
			while(rs.next()) {
				Pages st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"), rs.getDate("Date"),rs.getString("img"));
				posts.add(st);
			}
			return posts;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Pages getPostByid(int id) {
		Pages st = null;
		try {		
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery("SELECT * FROM post WHERE id = '"+id+"' ");
			while(rs.next()) {
				 st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"), rs.getDate("Date"),rs.getString("img"));
			}
			return st;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Boolean UpdatePost(int id, String tt, String des, String content) {
		try {
			Statement stmt = connection.createStatement();
			stmt.execute("UPDATE post  set title = '"+tt+"', description= '"+des+"', content = '"+content+"'  WHERE id = '"+id+"' ");
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public Boolean DeletePostByID(int id) {
		try {
			Statement stmt = connection.createStatement();
			stmt.execute("DELETE FROM post WHERE id = "+id+" ");
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public ArrayList<String> getIDPostArr(){
		ArrayList<String> id_list = new ArrayList<String>();
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT id from  post");
			while(rs.next()) {
				id_list.add(rs.getString("id"));
			}
			return id_list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
