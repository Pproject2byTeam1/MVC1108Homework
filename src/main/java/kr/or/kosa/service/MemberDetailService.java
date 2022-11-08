package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class MemberDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		RegisterDao dao = new RegisterDao();
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		String url = "";
		
		koreaMemberDto member = (koreaMemberDto) session.getAttribute("member");
        
		
		if (member == null || !member.getId().equals("admin")){ // 강제로 페이지 이동
		url = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
		} else {
			koreaMemberDto dto = dao.getMemberById(request.getParameter("id"));
			request.setAttribute("member", dto);
			url = "/WEB-INF/views/Ex03_MemberDetail.jsp";
			}
		
		forward.setRedirect(false);
		forward.setPath(url);
		return forward;
		
	}

}
