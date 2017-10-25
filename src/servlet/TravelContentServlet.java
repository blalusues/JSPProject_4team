package servlet;

//2017/10/23 생성

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TravelContentService;
import vo.ContentDetailVO;
import vo.ContentPageVO;
import vo.ContentVO;

@WebServlet("/content")
public class TravelContentServlet extends HttpServlet {
	private TravelContentService service = TravelContentService.getInstance();
/////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		
		if(task.equals("read")) { //후기 읽기 10/24작성 중
			String contentNumberStr = request.getParameter("contentNumber");
			int contentNumber = Integer.parseInt(contentNumberStr);
			System.out.println(contentNumber);
			List<ContentDetailVO> contentDetailList = service.read(contentNumber);
			ContentVO content = service.read("아이디수정하세염",contentNumber);
			
			if (contentDetailList != null) {
				request.setAttribute("contentDetail", contentDetailList);
				request.setAttribute("content", content);
				path = "read.jsp";
			} else {
				path = "article_not_found.jsp";
			}
		} else if(task.equals("contentList")) {
			// 메인페이지 만들기 위한 Page 정보 만들기 
			int page = 1;
			String pageStr = request.getParameter("page");
			if(pageStr != null && pageStr.length() > 0) {
				page = Integer.parseInt(pageStr);
			}
			ContentPageVO contentPage = service.makePage(page);
			request.setAttribute("contentPage", contentPage);
			path = "main.jsp";
		} else if(task.equals("search")) {
			// 검색 버튼 클릭 시
			int page = 1;
			String pageStr = request.getParameter("page");
			if(pageStr != null && pageStr.length() > 0) {
				page = Integer.parseInt(pageStr);
			}
			String searchTitle = (String) request.getParameter("searchTitle");
			ContentPageVO searchPage = service.makeSearchPage(page, searchTitle);
			request.setAttribute("contentPage", searchPage);
			request.setAttribute("searchTitle", searchTitle);
			
			path = "main.jsp";
		} else if(task.equals("wirteForm")) { 
			 // 글 쓰기 화면으로 갈 때(로그인 부분을 몰라서리...)
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String task = request.getParameter("task");
		String path = "";
		
		// 글 작성 완료 후 submit 버튼 눌렀을 때 
		if(task.equals("write")) {
			ContentVO content = new ContentVO();
			List<ContentDetailVO> detailList = new ArrayList<>();
			
			content.setTitle(request.getParameter("title"));
			content.setWriter(request.getParameter("writer"));
			content.setLocation(request.getParameter("location"));
			content.setMain_img(request.getParameter("main_img"));
			
			// day 개수 (Day02까지 썼으면 day=2)
			String dayStr = request.getParameter("day");
			int day = 0;
			if(dayStr != null && dayStr.length() > 0) {
				day = Integer.parseInt(dayStr);
			}
			
			// day 개수만큼 detailList 만들기 
			// (Day02의 content, path의 parameter이름은 content2, path2)
			for(int i=1; i<day+1; i++) {
				ContentDetailVO detail = new ContentDetailVO();
	
				detail.setDay(i);
				detail.setContent(request.getParameter("content" + i));
				detail.setPath(request.getParameter("path" + i));
				
				detailList.add(detail);
			}
			
			if(service.write(content, detailList) == 1) {
				path = "write_success.jsp";
			} else {
				path = "write_fail.jsp";
			}
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
