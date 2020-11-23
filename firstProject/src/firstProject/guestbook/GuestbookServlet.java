package firstProject.guestbook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import firstProject.db.GuestbookDAO;
import firstProject.db.GuestbookDTO;

@WebServlet(urlPatterns = {"/guestbook"})
public class GuestbookServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GuestbookDAO dao = new GuestbookDAO();
		ArrayList<GuestbookDTO> list = dao.getList();
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getNo());
			System.out.println(list.get(i).getTitle());
			System.out.println(list.get(i).getContents());
			System.out.println(list.get(i).getDate());
			System.out.println(list.get(i).getName());
			System.out.println("-----------------------------");
		}
		
		req.setAttribute("list", list);
		//req.setAttribute("no", 7777);
		//req.setAttribute("title", "abcd");
		RequestDispatcher rd = req.getRequestDispatcher("guestbook.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GuestbookDAO dao = new GuestbookDAO();
		
		//int no = req.getParameter();
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		int result = dao.addGuestbook(title, contents, name);
		//result = dao.upGuestbook(no, title, contents, name);
		
		if(result > 0) {
			resp.getWriter().write("success");
		}else {
			resp.getWriter().write("error");
		}	
		
	}
	
}
