package Model;

import java.io.IOException;
import java.sql.*;

public class DBconnect {
	private static String url = "jdbc:postgresql://localhost:5432/btl";
	private static String userName = "postgres";
	private static String passWord = "19092003";

	public static Connection connect() {
		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = DriverManager.getConnection(url,userName,passWord);
			System.out.println("Successfully");
			return connection;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("False");
			return null;
		}
	}
}
