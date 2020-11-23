package firstProject.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import firstProject.db.LoginDAO;
import firstProject.db.LoginDTO;

@WebServlet(urlPatterns = {"/login", "/login.do"})
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("login.html");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("euc-kr");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		LoginDAO loginDAO = new LoginDAO();
		LoginDTO loginDTO = null;
		String result = "로그인 실패";
		String username = id;
		loginDTO = loginDAO.login(id, pw);
		
		if(loginDTO.isResult()){
			result = "로그인 성공";
			username = loginDTO.getName();
		}
		
		req.setAttribute("result", result);
		req.setAttribute("username", username);
		
		RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
		rd.forward(req, resp);

	}
	
}
