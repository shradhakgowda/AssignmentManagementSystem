package com.crimsonlogic.ASM.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.crimsonlogic.ASM.model.LoginBean;
import com.crimsonlogic.ASM.utils.JDBCUtils;



public class LoginDao {
	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;

		//Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from users where userName = ? and userPassword = ? and userrole=?")) {
			preparedStatement.setString(1, loginBean.getUserName());
			preparedStatement.setString(2, loginBean.getUserPassword());
			preparedStatement.setString(3, loginBean.getUserRole());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return status;
	
}
}

