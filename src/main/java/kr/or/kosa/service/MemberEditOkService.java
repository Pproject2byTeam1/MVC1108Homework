package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class MemberEditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		 ActionForward forward=null;
		 String id = request.getParameter("id"); String name = request.getParameter("name"); 
		 int age = Integer.parseInt(request.getParameter("age")); 
		 String email = request.getParameter("email"); 
		 String gender = request.getParameter("gender");
		 
		 RegisterDao dao = new RegisterDao(); 
		 koreaMemberDto dto = new koreaMemberDto(); 
		 
		 dto.setId(id); 
		 dto.setName(name); 
		 dto.setAge(age);
		 dto.setEmail(email); 
		 dto.setGender(gender);
		 
		 int result = dao.updateOk(dto);
		 
		 String resultdata = ""; 
		 if (result > 0) { 
			 resultdata = "Update Success"; 
		 } else { 
				 resultdata = "Update Fail..."; 
		 }
		 
		 List<koreaMemberDto> memberlist = dao.getMemberListAll();
		 request.setAttribute("memberlist", memberlist);
		 request.setAttribute("updateinfo", resultdata);
		
		 forward = new ActionForward();
		 forward.setRedirect(false);
		 forward.setPath("/WEB-INF/views/Ex03_Memberlist.jsp");
		 
		return forward;
	}

}
