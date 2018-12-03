package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	public String getJSON(String userName) {
		if (userName == null)
			userName = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDao userDao = new UserDao();

		ArrayList<User> userList = userDao.search(userName);
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();
//		for (int i = 0; i < userList.size(); i++) {
//			array.add(userList.get(i).getUserName());
//			array.add(userList.get(i).getUserAge());
//			array.add(userList.get(i).getUserGender());
//			array.add(userList.get(i).getUserEmail());
//		}
//		object.put("userList", array);
//		System.out.println("내가 json 객체로 만든것 : " + object.toString());

		for (int i = 0; i < userList.size(); i++) {
			result.append("[{\"value\" : \"" + userList.get(i).getUserName() + "\"},");
			result.append("[{\"value\" : \"" + userList.get(i).getUserAge() + "\"},");
			result.append("[{\"value\" : \"" + userList.get(i).getUserGender() + "\"},");
			result.append("[{\"value\" : \"" + userList.get(i).getUserEmail() + "\"}],");

		}
		result.append("]}");
		System.out.println(result.toString());
		return result.toString();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset=UTF-8");

		String userName = request.getParameter("userName");
		System.out.println(userName);
		response.getWriter().write(getJSON(userName)); // json 형태로 값을 뿌려주기 위한 것이다.

	}

}
