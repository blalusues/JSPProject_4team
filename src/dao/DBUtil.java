package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	private static final String DB_DRIVER="com.mysql.jdbc.Driver";
	private static final String DB_URL="jdbc:mysql://localhost:3306/jsp";
	private static final String DB_ID="root";
	private static final String DB_PW="sds1501";
	////////////////////////////////////////////////////////////////////////////////////////
	public static void loadDriver() {
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("DBUtil loadDriver 에러");
			e.printStackTrace();
		}
	}
	
	public static Connection makeConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(DB_URL,DB_ID,DB_PW);
		} catch (SQLException e) {
			System.out.println("DBUtil makeConnection 에러");
			e.printStackTrace();
		}
		return con;
	}
	//////////////////////////////////////////////////////////////////////////////////////////
	public static void closeCon(Connection con) {
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void closePstmt(PreparedStatement pstmt) {
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void closeRs(ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
