package servlet;

//2017/10/23 ����

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.TravelContentService;
import vo.CommentVO;
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

		if (task.equals("read")) { // �ı� �б� 10/24�ۼ� ��
			HttpSession session = request.getSession();
			session.setAttribute("loginId", "123");
			String contentNumberStr = request.getParameter("contentNumber");
			int contentNumber = Integer.parseInt(contentNumberStr);
			System.out.println(contentNumber);
			List<ContentDetailVO> contentDetailList = service.read(contentNumber);
			ContentVO content = service.read("���̵�����ϼ���", contentNumber);
			List<CommentVO> comment = service.commentSelect(content.getContent_no());
			if (contentDetailList != null) {
				request.setAttribute("contentDetailList", contentDetailList);
				request.setAttribute("content", content);
				request.setAttribute("comment", comment);
				path = "read.jsp";
			} else {
				path = "article_not_found.jsp";
			}
		} else if (task.equals("contentList")) {
			// ������ �����
			int page = 1;
			ContentPageVO contentPage = null;
			String pageStr = request.getParameter("page");
			if (pageStr != null && pageStr.length() > 0) {
				page = Integer.parseInt(pageStr);
			}

			String search = request.getParameter("search");
			String category = request.getParameter("category");

			if ((search.equals("") && category.equals(""))) {
				// �� �� null�̸� �׳� main
				contentPage = service.makePage(1, page, search, category);
				path = "main_search.jsp";
			} else if (category.equals("")) {
				// Ÿ��Ʋ �˻�
				contentPage = service.makePage(2, page, search, category);
				path = "main_search.jsp";
			} else if (search.equals("")) {
				// ���� �˻�
				contentPage = service.makePage(3, page, search, category);
				path = "main_search.jsp";
			} else {
				// Ÿ��Ʋ + ���� �˻�
				contentPage = service.makePage(4, page, search, category);
				path = "main_search.jsp";
			}
			request.setAttribute("contentPage", contentPage);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
		} else if (task.equals("wirteForm")) {
			// �� ���� ȭ������ �� ��(�α��� �κ��� ���󼭸�...)

		} else if (task.equals("updateForm")) {
			HttpSession session = request.getSession();
			String loginId = (String) session.getAttribute("loginId");
			String contentNumStr = request.getParameter("contentNum");
			int contentNum = Integer.parseInt(contentNumStr);

			ContentVO content = service.read("", contentNum);
			List<ContentDetailVO> contentDetailList = service.read(contentNum);

			request.setAttribute("contentDetailList", contentDetailList);
			request.setAttribute("content", content);
			path = "update_Form.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String task = request.getParameter("task");
		String path = "";

		// �� �ۼ� �Ϸ� �� submit ��ư ������ ��
		if (task.equals("write")) {
			ContentVO content = new ContentVO();
			List<ContentDetailVO> detailList = new ArrayList<>();

			content.setTitle(request.getParameter("title"));
			content.setWriter(request.getParameter("writer"));
			content.setLocation(request.getParameter("location"));
			content.setMain_img(request.getParameter("main_img"));

			// day ���� (Day02���� ������ day=2)
			String dayStr = request.getParameter("day");
			int day = 0;
			if (dayStr != null && dayStr.length() > 0) {
				day = Integer.parseInt(dayStr);
			}

			// day ������ŭ detailList �����
			// (Day02�� content, path�� parameter�̸��� content2, path2)
			for (int i = 1; i < day + 1; i++) {
				ContentDetailVO detail = new ContentDetailVO();

				detail.setDay(i);
				detail.setContent(request.getParameter("content" + i));
				detail.setPath(request.getParameter("path" + i));

				detailList.add(detail);
			}

			if (service.write(content, detailList) == 1) {
				path = "write_success.jsp";
			} else {
				path = "write_fail.jsp";
			}
		} else if (task.equals("contentList")) {
			// ������ �����
			int page = 1;
			ContentPageVO contentPage = null;
			String pageStr = request.getParameter("page");
			if (pageStr != null && pageStr.length() > 0) {
				page = Integer.parseInt(pageStr);
			}

			String search = request.getParameter("search");
			String category = request.getParameter("category");

			if ((search.equals("") && category.equals(""))) {
				// �� �� null�̸� �׳� main
				contentPage = service.makePage(1, page, search, category);
				path = "main_search.jsp";
			} else if (category.equals("")) {
				// Ÿ��Ʋ �˻�
				contentPage = service.makePage(2, page, search, category);
				path = "main_search.jsp";
			} else if (search.equals("")) {
				// ���� �˻�
				contentPage = service.makePage(3, page, search, category);
				path = "main_search.jsp";
			} else {
				// Ÿ��Ʋ + ���� �˻�
				contentPage = service.makePage(4, page, search, category);
				path = "main_search.jsp";
			}
			request.setAttribute("contentPage", contentPage);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
		} else if (task.equals("commentCheck")) {
			String articleNumStr = request.getParameter("comment_board");
			int articleNum = Integer.parseInt(articleNumStr);
			String comment_content = request.getParameter("comment_content");
			comment_content = comment_content.replace("\r\n", "<br>");

			CommentVO comment = new CommentVO();
			comment.setBrdNo(articleNum);
			comment.setWriter(request.getParameter("comment_id"));
			comment.setContent(comment_content);
			System.out.println("commentCheck");
			boolean result = service.commentSignUp(comment);
			System.out.println("result: " + result);
			if (result == true) {
				request.setAttribute("articleNum", articleNum);
				path = "comment_success.jsp";
			} else {
				request.setAttribute("articleNum", articleNum);
				path = "comment_fail.jsp";
			}
		} else if (task.equals("commentDelete")) {
			System.out.println("ddd");
			String articleNumStr = request.getParameter("comment_board");
			int articleNum = Integer.parseInt(articleNumStr);
			CommentVO comment = new CommentVO();
			String comment_numStr = request.getParameter("comment_num");
			int comment_num = Integer.parseInt(comment_numStr);
			comment.setCommentNum(comment_num);
			boolean result = service.commentDelete(comment);

			if (result == true) {
				request.setAttribute("articleNum", articleNum);
				path = "commentDelete_success.jsp";
			} else {
				request.setAttribute("articleNum", articleNum);
				path = "commentDelete_fail.jsp";
			}
		} else if (task.contentEquals("updateRead")) {
			ContentVO content = new ContentVO();
			List<ContentDetailVO> detailList = new ArrayList<>();
			List<ContentDetailVO> detailListOther = new ArrayList<>();
			ContentDetailVO detail = new ContentDetailVO();

			String contentNumStr = request.getParameter("�� ��ȣ ����");
			int contentNum = Integer.parseInt(contentNumStr);
			int dayNumber = service.caculateDLNum(contentNum);
			
			content.setContent_no(contentNum);
			content.setTitle(request.getParameter("title"));
			content.setWriter(request.getParameter("writer"));
			content.setLocation(request.getParameter("location"));
			content.setMain_img(request.getParameter("main_img"));

			String dayStr = request.getParameter("day");
			int day = 0;
			if (dayStr != null && dayStr.length() > 0) {
				day = Integer.parseInt(dayStr);
			}

			if (detailList.size() > dayNumber) {//������ day�� �߰� �Ǿ��� ��
				for (int i = 1; i < dayNumber + 1; i++) { 
					detail.setDay(i);
					detail.setContent(request.getParameter("content" + i));
					detail.setPath(request.getParameter("path" + i));

					detailList.add(detail);
				}
				for (int i = dayNumber + 1; i < detailList.size() + 1; i++) {
					detail.setDay(i);
					detail.setContent(request.getParameter("content" + i));
					detail.setPath(request.getParameter("path" + i));

					detailListOther.add(detail);
				}

				if (service.updateRead(content, detailList) && service.insertDay(contentNum, detailListOther)) {
					path = "update_success.jsp";
				} else {
					path = "update_fail.jsp";
				}
			} else if (detailList.size() == dayNumber) { //������ day�� ���� ��
				for (int i = 1; i < detailList.size() + 1; i++) {
					detail.setDay(i);
					detail.setContent(request.getParameter("content" + i));
					detail.setPath(request.getParameter("path" + i));

					detailList.add(detail);
				}
				if (service.updateRead(content, detailList)) {
					path = "update_success.jsp";
				} else {
					path = "update_fail.jsp";
				}
			} else if (detailList.size() < dayNumber) { //������ day�� ���� �Ǿ��� ��
				for (int i = 1; i < detailList.size() + 1; i++) {
					detail.setDay(i);
					detail.setContent(request.getParameter("content" + i));
					detail.setPath(request.getParameter("path" + i));

					detailList.add(detail);
				}

				for (int i = detailList.size() + 1; i < dayNumber + 1; i++) {
					detail.setDay(i);
					detail.setContent(request.getParameter("content" + i));
					detail.setPath(request.getParameter("path" + i));

					detailListOther.add(detail);
				}

				if (service.updateRead(content, detailList) && service.DeleteDay(contentNum, detailListOther)) {
					path = "update_success.jsp";
				} else {
					path = "update_fail.jsp";
				}
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
