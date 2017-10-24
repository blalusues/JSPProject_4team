package servlet;

//10/23 »ý¼º

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MemberService;

@WebServlet("/member")
public class MemberServlet extends HttpServlet{
	MemberService service = new MemberService();
	///////////////////////////////////////////////////////////////////////////////////////////
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	////////////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
