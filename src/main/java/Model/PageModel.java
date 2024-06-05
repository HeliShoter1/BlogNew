package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class PageModel {
	private static Connection connection = DBconnect.connect();
	
	private static String Select_One_Post = "Select * From public.\"post\" where \"id\" = '%s'  ";
	
	public static Pages GetPage(int id) {
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(String.format(Select_One_Post, id));
			rs.next();
			Pages st = new Pages(rs.getInt("id"),rs.getString("title"),rs.getString("description"),rs.getString("content"),rs.getInt("view"),rs.getDate("date"),rs.getString("img"));
			rs.close();
            statement.close();
            return st;
			} catch (Exception e) {
				System.out.print(e);
				return null;
			}
	}
}
