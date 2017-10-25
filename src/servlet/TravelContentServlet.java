package servlet;

//2017/10/23 생성

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TravelContentService;
import vo.ContentDetailVO;
import vo.ContentVO;

@WebServlet("/content")
public class TravelContentServlet extends HttpServlet {
	private TravelContentService service = TravelContentService.getInstance();
	//////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		
		if(task.equals("read")) { //후기 읽기 10/24작성 중
			String contentNumberStr = request.getParameter("contentNumber");
			int contentNumber = Integer.parseInt(contentNumberStr);
			
			List<ContentDetailVO> contentDetailList = service.read(contentNumber);
			ContentVO content = service.read(id,contentNumber);
			
			if (contentDetailList != null) {
				request.setAttribute("contentDetail", contentDetailList);
				request.setAttribute("content", content);
				path = "read.jsp";
			} else {
				path = "article_not_found.jsp";
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String task = request.getParameter("task");
		String path = "";

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
