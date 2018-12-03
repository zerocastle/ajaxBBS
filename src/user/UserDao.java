package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDao() {
		// TODO Auto-generated constructor stub

		try {
			String dbURL = "jdbc:mariadb://localhost:3306/ajax";
			String dbId = "root";
			String dbPassword = "1234";
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 연결성공");
			conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
			System.out.println("게시판 데이터베이스 연결성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<User> search(String userName) {
		// 고객에 이름에 맞추어 고개을 검색 해주는 역확을 한다.
		String sql = "select * from user where userName LIKE ?";

		ArrayList<User> userList = new ArrayList<User>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setUserAge(rs.getInt(2));
				user.setUserGender(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				userList.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;

	}

}
