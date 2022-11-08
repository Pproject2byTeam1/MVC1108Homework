package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class MemberSearchService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		koreaMemberDto member = (koreaMemberDto) session.getAttribute("member");
		
		String url = "";
		
		if (member == null || !member.getId().equals("admin")) {
			url = "/WEB-INF/views/Ex02_JDBC_Login.jsp"; // 관리자 계정이 아님
		} else {
			RegisterDao dao = new RegisterDao();

			List<koreaMemberDto> membersearch = dao.getMemberListBySearch(request.getParameter("search"));

			if (membersearch == null) { // 조회결과 없음
				request.setAttribute("rowcount", 0);
			} else {
				request.setAttribute("rowcount", membersearch.size());
				request.setAttribute("memberserch", membersearch);
			}

			url = "/WEB-INF/views/Ex03_MemberSearch.jsp";
		}
		
		ActionForward forward = new ActionForward();
	  	forward.setRedirect(false);
	  	forward.setPath(url);
	  	
		return forward;
	}

}
