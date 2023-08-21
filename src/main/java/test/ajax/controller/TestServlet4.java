package test.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import test.ajax.model.vo.User;

/**
 * Servlet implementation class TestServlet4
 */
@WebServlet("/test4.do")
public class TestServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 

		String no = request.getParameter("no");
		System.out.println("test4.do no: " + no);

		//응답에 사용할 객체 생성
		User user = new User("user1234","pass1234","홍길동",27,"hong@ict.org","010-4444-4444");

		//자바의 vo 객체를 JSON(JavaScript Object Notation)으로 바꿈
		//JSON 을 다루는 클레스를 자바가 제공하지 않음 => 외부에서 제공되는 JAR 파일을 다운받아 사용함
		//json-simple-1.1.1.jar 파일 사용한 경우
		//WEB-INF/lib 폴더 안에 복사해 넣음

		JSONObject job = new JSONObject();
		
		job.put("userid", user.getUserid());
		job.put("userpwd", user.getUserpwd());
		//JSON 에서 한글 깨짐을 막으려면, java.net.URLEncoder 클래스의 encode() 메소드로 인코딩 처리함
		job.put("username", URLEncoder.encode(user.getUsername(),"UTF-8"));
		job.put("age", user.getAge());
		job.put("email", user.getEmail());
		job.put("phone", user.getPhone());
		System.out.println(job.toJSONString());
		
		response.setContentType("application/json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(job.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
