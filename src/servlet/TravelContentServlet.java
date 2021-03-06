package servlet;

import java.io.File;

//2017/10/23 생성

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

		if (task.equals("read")) { // 후기 읽기 10/24작성 중
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			String contentNumberStr = request.getParameter("contentNumber");
			int contentNumber = Integer.parseInt(contentNumberStr);

			List<ContentDetailVO> contentDetailList = service.read(contentNumber);
			ContentVO content = service.read(email, contentNumber);
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
			// 페이지 만들기
			int page = 1;
			ContentPageVO contentPage = null;
			String pageStr = request.getParameter("page");
			if (pageStr != null && pageStr.length() > 0) {
				page = Integer.parseInt(pageStr);
			}
			request.setCharacterEncoding("EUC-KR");
			String search = request.getParameter("search");
			String category = request.getParameter("category");

			if ((search.equals("") && category.equals(""))) {
				// 둘 다 null이면 그냥 main
				contentPage = service.makePage(1, page, search, category);
				path = "main_search.jsp";
			} else if (category.equals("")) {
				// 타이틀 검색
				contentPage = service.makePage(2, page, search, category);
				path = "main_search.jsp";
			} else if (search.equals("")) {
				// 지역 검색
				contentPage = service.makePage(3, page, search, category);
				path = "main_search.jsp";
			} else {
				// 타이틀 + 지역 검색
				contentPage = service.makePage(4, page, search, category);
				path = "main_search.jsp";
			}
			request.setAttribute("contentPage", contentPage);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
		} else if (task.equals("wirteForm")) {
			// 글 쓰기 화면으로 갈 때(로그인 부분을 몰라서리...)
			path = "write_form_newest.jsp";
		} else if (task.equals("updateForm")) {
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");

			String contentNumStr = request.getParameter("contentNum");
			int contentNum = Integer.parseInt(contentNumStr);

			ContentVO content = service.read(email, contentNum);
			List<ContentDetailVO> contentDetailList = service.read(contentNum);

			int dayNumber = service.caculateDLNum(contentNum);
			
			request.setAttribute("dayNum", dayNumber);
			request.setAttribute("contentDetailList", contentDetailList);
			request.setAttribute("content", content);
			path = "update_form.jsp";
		} else if (task.equals("deleteForm")) {
			String contentNumStr = request.getParameter("contentNum");
			int contentNum = Integer.parseInt(contentNumStr);
			if (service.deleteContent(contentNum) == true) {
				path = "delete_success.jsp";
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		if (request.getParameter("task") == null) {
			System.out.println("task파라미터" + request.getParameter("task"));
			String uploadFolder = "C:\\Users\\student\\Documents\\Github\\JSPProject_4team\\WebContent\\download";
			MultipartRequest mReq = new MultipartRequest(request, uploadFolder, 1024 * 1024 * 40, "euc-kr",
					new DefaultFileRenamePolicy());
			String task = mReq.getParameter("task");
			String path = "";
			
			if (task.equals("write")) {
				request.setCharacterEncoding("euc-kr");
				HttpSession session = request.getSession();
				String loginId = (String) session.getAttribute("name");
				String email = (String) session.getAttribute("email");
				ContentVO content = new ContentVO();
				List<ContentDetailVO> detailList = new ArrayList<>();
				content.setTitle(mReq.getParameter("title"));
				content.setWriter(loginId);
				content.setLocation(mReq.getParameter("locations"));
				File uploadFile = mReq.getFile("main_image"); // 파일 업로드 완료

				content.setMain_img(mReq.getOriginalFileName("main_image"));
				content.setStart_date(mReq.getParameter("start_date"));
				content.setEmail(email);
				// day 개수 (Day02까지 썼으면 day=2)

				String dayStr = mReq.getParameter("day");
				int day = 0;
				if (dayStr != null && dayStr.length() > 0) {
					day = Integer.parseInt(dayStr);
				}

				int[] maxPath = new int[5];
				for (int y = 1; y < day + 1; y++) {
					String pathStr = mReq.getParameter("maxPath" + y);
					maxPath[y] = Integer.parseInt(pathStr);
				}
				// day 개수만큼 detailList 만들기
				// (Day02의 content, path의 parameter이름은 content2, path2)
				for (int i = 1; i < day + 1; i++) {
					String plusPath = "";

					ContentDetailVO detail = new ContentDetailVO();

					detail.setDay(i);
					detail.setContent(mReq.getParameter("content" + i));
					for (int x = 1; x < maxPath[i] + 1; x++) {
						plusPath = plusPath + mReq.getParameter("loc" + i + "_" + x) + "%"
								+ mReq.getParameterValues("sum" + i + "_" + x)[0] + "%";
					}
					detail.setPath(plusPath);
					detailList.add(detail);
				}
				if (service.write(content, detailList) == 1) {
					path = "write_success.jsp";
				} else {
					path = "write_fail.jsp";
				}

			} else if(task.equals("updateRead")) {
				request.setCharacterEncoding("euc-kr");
				
				ContentVO content = new ContentVO();
				List<ContentDetailVO> detailList = new ArrayList<>();
				List<ContentDetailVO> detailListOther = new ArrayList<>();
				ContentDetailVO detail = new ContentDetailVO();

				String contentNumStr = mReq.getParameter("contentNum");
				int contentNum = Integer.parseInt(contentNumStr);
				
				// 수정 전 day 개수
				String dayNumStr = mReq.getParameter("dayNum");
				int dayNum = Integer.parseInt(dayNumStr);
				
				content.setContent_no(contentNum);
				content.setTitle(mReq.getParameter("title"));
				content.setLocation(mReq.getParameter("locations"));
				File uploadFile = mReq.getFile("main_image");
				content.setMain_img(mReq.getOriginalFileName("main_image"));
				
				// 수정 후 day 개수
				String dayStr = mReq.getParameter("day");
				int day = 0;
				if (dayStr != null && dayStr.length() > 0) {
					day = Integer.parseInt(dayStr);
				}
				System.out.println("수정 전 day : " + dayNum);
				System.out.println("수정 후 day : " + day);

				int[] maxPath = new int[5];
				for (int y = 1; y < day + 1; y++) {
					String pathStr = request.getParameter("maxPath" + y);
					maxPath[y] = Integer.parseInt(pathStr);
				}

				if (day > dayNum) {// 수정시 day가 추가 되었을 때
					for (int i = 1; i < dayNum + 1; i++) {
						String plusPath = "";

						detail.setDay(i);
						detail.setContent(mReq.getParameter("content" + i));
						for (int x = 1; x < maxPath[i] + 1; x++) {
							plusPath = plusPath + mReq.getParameter("loc" + i + "_" + x) + "%"
									+ mReq.getParameterValues("sum" + i + "_" + x)[0] + "%";
						}
						detail.setPath(plusPath);
						detailList.add(detail);
					}
					for (int i = dayNum + 1; i < detailList.size() + 1; i++) {
						String plusPath = "";

						detail.setDay(i);
						detail.setContent(mReq.getParameter("content" + i));
						for (int x = 1; x < maxPath[i] + 1; x++) {
							plusPath = plusPath + mReq.getParameter("loc" + i + "_" + x) + "%"
									+ mReq.getParameterValues("sum" + i + "_" + x)[0] + "%";
						}
						detail.setPath(plusPath);
						detailListOther.add(detail);
					}

					if (service.updateRead(content, detailList) && service.insertDay(contentNum, detailListOther)) {
						path = "update_success.jsp";
					} else {
						path = "update_fail.jsp";
					}
				} else if (day == dayNum) { // 수정시 day가 같을 때
					for (int i = 1; i < detailList.size() + 1; i++) {
						String plusPath = "";

						detail.setDay(i);
						detail.setContent(mReq.getParameter("content" + i));
						for (int x = 1; x < maxPath[i] + 1; x++) {
							plusPath = plusPath + mReq.getParameter("loc" + i + "_" + x) + "%"
									+ mReq.getParameterValues("sum" + i + "_" + x)[0] + "%";
						}
						detail.setPath(plusPath);

						detailList.add(detail);
					}
					if (service.updateRead(content, detailList)) {
						path = "update_success.jsp";
					} else {
						path = "update_fail.jsp";
					}
				} else if (day < dayNum) { // 수정시 day가 삭제 되었을 때
					for (int i = 1; i < detailList.size() + 1; i++) {
						String plusPath = "";

						detail.setDay(i);
						detail.setContent(mReq.getParameter("content" + i));
						for (int x = 1; x < maxPath[i] + 1; x++) {
							plusPath = plusPath + mReq.getParameter("loc" + i + "_" + x) + "%"
									+ mReq.getParameterValues("sum" + i + "_" + x)[0] + "%";
						}
						detail.setPath(plusPath);

						detailList.add(detail);
					}

					for (int i = detailList.size() + 1; i < dayNum + 1; i++) {
						String plusPath = "";

						detail.setDay(i);
						detail.setContent(mReq.getParameter("content" + i));
						for (int x = 1; x < maxPath[i] + 1; x++) {
							plusPath = plusPath + mReq.getParameter("loc" + i + "_" + x) + "%"
									+ mReq.getParameterValues("sum" + i + "_" + x)[0] + "%";
						}
						detail.setPath(plusPath);

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

		} else {
			String task = request.getParameter("task");
			String path = "";
			if (task.equals("commentCheck")) {
				HttpSession session = request.getSession();
				String loginId = (String) session.getAttribute("name");
				String email = (String) session.getAttribute("email");

				String articleNumStr = request.getParameter("comment_board");
				int articleNum = Integer.parseInt(articleNumStr);
				String comment_content = request.getParameter("comment_content");
				comment_content = comment_content.replace("\r\n", "<br>");

				CommentVO comment = new CommentVO();
				comment.setBrdNo(articleNum);
				comment.setWriter(loginId);
				comment.setContent(comment_content);
				comment.setEmail(email);

				boolean result = service.commentSignUp(comment);

				if (result == true) {
					request.setAttribute("articleNum", articleNum);
					path = "comment_success.jsp";
				} else {
					request.setAttribute("articleNum", articleNum);
					path = "comment_fail.jsp";
				}
			} else if (task.equals("commentDelete")) {
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
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
	}
}
