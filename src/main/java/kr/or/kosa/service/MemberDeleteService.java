package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class MemberDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		RegisterDao dao = new RegisterDao();
		int result = dao.deleteOk(request.getParameter("id"));
		
		String resultdata = "";
		
		if (result > 0) {
			resultdata = "Delete Success";
			List<koreaMemberDto> memberlist = dao.getMemberListAll();
			request.setAttribute("memberlist", memberlist);
			System.out.println(resultdata);
			}else{
				resultdata = "Delete Fail...";
				System.out.println(resultdata);
			}
		
		request.setAttribute("delete", resultdata);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/Ex03_Memberlist.jsp");
		  
		return forward;
	}

}
