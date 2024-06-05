package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Login {
	private String email;
    private String password;
    
	private static Connection connection = DBconnect.connect();

    // Constructors, getters and setters
    public Login() {}

    public Login(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    

    
	public User validate() {
		try {
			String sql = "SELECT * FROM user_data WHERE email = '%s' and password = '%s'";
			Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(String.format(sql, this.email,this.password));
            User user = null;
            while(resultSet.next()) {
            	user = new User(resultSet.getString("name"),resultSet.getString("email"),resultSet.getString("password"));
            	user.setRole(resultSet.getString("role"));
            	user.setUserId(resultSet.getInt("user_id"));
            }
            resultSet.close();
            statement.close();
            return user;
		} catch (Exception e) {
			System.out.print(e);
			return null;
		}
		
	}
}
