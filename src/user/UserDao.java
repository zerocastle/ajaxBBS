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
			System.out.println("����̹� ���Ἲ��");
			conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
			System.out.println("�Խ��� �����ͺ��̽� ���Ἲ��");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<User> search(String userName) {
		// ���� �̸��� ���߾� ���� �˻� ���ִ� ��Ȯ�� �Ѵ�.
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
