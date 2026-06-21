package in.ps.studentapp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	public static Connection requestConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// Use environment variables, fall back to localhost for development
			String dbHost = System.getenv("DB_HOST");
			String dbUser = System.getenv("DB_USER");
			String dbPassword = System.getenv("DB_PASSWORD");
			String dbName = System.getenv("DB_NAME");
			
			// Default to localhost for development
			if (dbHost == null) dbHost = "localhost";
			if (dbUser == null) dbUser = "root";
			if (dbPassword == null) dbPassword = "root";
			if (dbName == null) dbName = "student_db";
			
			String url = "jdbc:mysql://" + dbHost + ":3306/" + dbName;
			con = DriverManager.getConnection(url, dbUser, dbPassword);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
