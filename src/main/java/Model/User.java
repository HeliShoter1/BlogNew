package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class User {
	private static Connection connection = DBconnect.connect();

    private String fullName;
	private String email;
    private String password;
    private String role;
    private int user_id;

    // Constructors, getters and setters
    public User() {}

    public User(String fullName, String email, String password) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
    }
    
    public void setFullName(String fullName) {
    	this.fullName = fullName;
    }
    
    public void setEmail(String email) {
    	this.email = email;
    }
    
    public void setRole(String role) {
    	this.role = role;
    }
    
    public void setPassword(String password) {
    	this.password = password;
    }
    
    public void setId(int id) {
    	this.user_id = id;
    }
    
    public String getFullName() {
    	return fullName;
    }
    
    public String getEmail() {
    	return email;
    }
    
    public String getPassword() {
    	return password;
    }
    
    public String getRole() {
    	return this.role;
    }
    
    public int getUserId() {
    	return this.user_id;
    }
    public void setUserId(int user_id) {
    	 this.user_id = user_id;
    }
    
    
    public User exists(String email) {
    	User user = null;
    	
    	try {
			String sql = "SELECT * FROM user_data WHERE email = ? ";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
            	user  = new User(resultSet.getString("name"),resultSet.getString("email"),resultSet.getString("password"));
            }
		    resultSet.close();
		    preparedStatement.close();
		    return user;
		} catch (Exception e) {
			System.out.print(e);
			return user;
		}
		
    }
	
	public boolean register() {
		boolean success = false;
		try {
			String sql = "INSERT INTO user_data (name, email, password) VALUES (?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            
            preparedStatement.executeUpdate();
            
            success = true;
            preparedStatement.close();
		} catch (Exception e) {
			System.out.print(e);
		}
		
		return success;
	}
	
	public User NewUserModel(String user_id) {
		try {
			Statement  pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM user_data WHERE user_id = "+user_id +";");
			while(rs.next()) {
				this.user_id = rs.getInt("user_id");
				this.fullName = rs.getString("name");
				this.email = rs.getString("email");
				this.password = rs.getString("password");
				this.role = rs.getString("role");
			}
			return this;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Boolean SavenewInfo(int id, String name, String des) {
		try {
			Statement stmt = connection.createStatement();

			stmt.execute("UPDATE user_data set name = '"+name+"'  WHERE user_id= "+id+" ");
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public ArrayList<User> GetAllUser() {
		ArrayList<User> allUser = new ArrayList<User>();
		try {
			Statement  pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM user_data order by user_id ");
			while(rs.next()) {
				User temp = new User(rs.getString("name"),rs.getString("email"),rs.getString("password"));
				temp.setId(rs.getInt("user_id"));
				temp.setRole(rs.getString("role"));
				allUser.add(temp);
			}
			return allUser;
		}catch(SQLException e) {
			e.printStackTrace();
			return allUser;
		}
	}
	public User EditRole(String user_id, String role) {
		User temp= new User();
		try {
			Statement stmt = connection.createStatement();
			stmt.execute("UPDATE user_data set role = '"+role+"'  WHERE user_id= "+user_id+" ");
			ResultSet rs = stmt.executeQuery("SELECT * FROM user_data where user_id =" + user_id +";");
			while(rs.next()) {
				temp = new User(rs.getString("name"),rs.getString("email"),rs.getString("password"));
				temp.setId(rs.getInt("user_id"));
				temp.setRole(rs.getString("role"));
			}
			return temp;
		}catch(Exception e) {
			e.printStackTrace();
			return temp;
		}
	}
	public boolean DeleteUser(String user_id) {
		try {
			Statement stmt = connection.createStatement();
			stmt.execute("Delete From user_data WHERE user_id= "+user_id+" ");	
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
