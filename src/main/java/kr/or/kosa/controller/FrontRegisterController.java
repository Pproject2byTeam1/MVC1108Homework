package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.service.JoinOkService;
import kr.or.kosa.service.LoginOkService;
import kr.or.kosa.service.LogoutService;
import kr.or.kosa.service.MemberDeleteService;
import kr.or.kosa.service.MemberDetailService;
import kr.or.kosa.service.MemberEditOkService;
import kr.or.kosa.service.MemberEditService;
import kr.or.kosa.service.MemberListService;
import kr.or.kosa.service.MemberSearchService;

@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontRegisterController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String urlcommand = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		if (urlcommand.equals("/Ex02_JDBC_Login.do")) { // 로그인

			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/Ex02_JDBC_Login.jsp");

		} else if (urlcommand.equals("/Ex02_JDBC_loginok.do")) { // 로그인
			
			action = new LoginOkService();
			forward = action.execute(request, response);
			
		} else if (urlcommand.equals("/Ex02_JDBC_Logout.do")) { // 로그아웃

			action = new LogoutService();
			forward = action.execute(request, response);

		} else if (urlcommand.equals("/Ex02_JDBC_JoinForm.do")) { // 회원가입 view

			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/Ex02_JDBC_JoinForm.jsp");

		} else if (urlcommand.equals("/Ex02_JDBC_JoinOK.do")) { // 회원가입 로직

			action = new JoinOkService();
			forward = action.execute(request, response);
			

		} else if (urlcommand.equals("/Ex03_Memberlist.do")) { // 유저 목록

			action = new MemberListService();
			forward = action.execute(request, response);
			
			
		} else if (urlcommand.equals("/Ex03_MemberDetail.do")) {// 멤버 세부정보
			
			action = new MemberDetailService();
			forward = action.execute(request, response);
			
			RegisterDao dao = new RegisterDao();


		} else if (urlcommand.equals("/Ex03_MemberEdit.do")) {// 멤버 세부정보 수정 view

			action = new MemberEditService();
			forward = action.execute(request, response);
		

		} else if (urlcommand.equals("/Ex03_MemberEditok.do")) {// 수정 확인

			action = new MemberEditOkService();
			forward = action.execute(request, response);
			

		} else if (urlcommand.equals("/Ex03_MemberSearch.do")) {// 멤버 검색

			action = new MemberSearchService();
			forward = action.execute(request, response);
			
		} else if (urlcommand.equals("/Ex03_MemberDelete.do")) {
			
			action = new MemberDeleteService();
			forward = action.execute(request, response);

		} else if (urlcommand.equals("/Main.do")) {
			
			forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/Ex02_JDBC_Main.jsp");
		}

		if (forward != null) {
			if (forward.isRedirect()) { // true 페이지 재 요청 (location.href="페이지"
				response.sendRedirect(forward.getPath());
			} else { // 기본적으로 forward ....
						// 1. UI 전달된 경우
						// 2. UI + 로직
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}