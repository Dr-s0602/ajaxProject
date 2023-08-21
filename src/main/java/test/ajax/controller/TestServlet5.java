package test.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import test.ajax.model.vo.User;

/**
 * Servlet implementation class TestServlet5
 */
@WebServlet("/test5.do")
public class TestServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestServlet5() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		String no = request.getParameter("no");
		System.out.println("test5.do no : " + no);

		// 서버측에서 list 를 json 배열에 옯겨 담기
		ArrayList<User> list = new ArrayList<User>();
		list.add(new User("u1111", "p1111", "홍길동", 25, "h1111@test.org", "010-1111-1111"));
		list.add(new User("u2222", "p2222", "김철수", 25, "h2222@test.org", "010-2222-2222"));
		list.add(new User("u3333", "p3333", "박영희", 25, "h3333@test.org", "010-3333-3333"));
		list.add(new User("u4444", "p4444", "이사람", 25, "h4444@test.org", "010-4444-4444"));
		list.add(new User("u5555", "p5555", "저사람", 25, "h5555@test.org", "010-5555-5555"));
		// 전송할 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (User user : list) {
			// 한 사람의 정보를 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("userid", user.getUserid());
			job.put("userpwd", user.getUserpwd());
			// JSON 에서 한글 깨짐을 막으려면, java.net.URLEncoder 클래스의 encode() 메소드로 인코딩 처리함
			job.put("username", URLEncoder.encode(user.getUsername(), "UTF-8"));
			job.put("age", user.getAge());
			job.put("email", user.getEmail());
			job.put("phone", user.getPhone());

			//json 배열에 job 저장 처리
			jarr.add(job);
		}

		//json 배열을 전송할 수 없음 = 전송용 json  객체에 json 배열을 저장 처리
		
		sendJson.put("list",jarr);
		System.out.println(sendJson.toJSONString());
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
