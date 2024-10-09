package com.crimsonlogic.ASM.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.crimsonlogic.ASM.model.Users;
import com.crimsonlogic.ASM.utils.JDBCUtils;

public class UserDao {

	public int registerUser(Users employee) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "INSERT INTO users(userName,userEmail,userPassword,userRole) VALUES(?,?,?,?);";

		int result = 0;
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, employee.getUserName());
			preparedStatement.setString(2, employee.getUserEmail());
			preparedStatement.setString(3, employee.getUserPassword());
			preparedStatement.setString(4, employee.getUserRole());

			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return result;
	}
	   public int getUserIdByUsername(String username) throws ClassNotFoundException {
	        String SELECT_USER_ID_SQL = "SELECT userid FROM users WHERE username = ?;";
	        
	        int userId = 0;
	        try (Connection connection = JDBCUtils.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_ID_SQL)) {
	            preparedStatement.setString(1, username);

	            // Log the PreparedStatement for debugging
	            System.out.println(preparedStatement);

	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    userId = resultSet.getInt("userid");
	                }
	            }
	        } catch (SQLException e) {
	            // Process SQL exception
	            JDBCUtils.printSQLException(e);
	        }
	        return userId;
	    }
	   

}

