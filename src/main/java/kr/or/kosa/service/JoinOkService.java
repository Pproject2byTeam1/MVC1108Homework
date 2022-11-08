package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class JoinOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String ip = request.getRemoteAddr();

		RegisterDao dao = new RegisterDao();
		koreaMemberDto dto = new koreaMemberDto();

		dto.setId(id);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setAge(age);
		dto.setGender(gender);
		dto.setEmail(email);
		dto.setIp(ip);

		int result = dao.insertMember(dto);

		String url = "";

		if (result > 0) { // 회원가입 성공
			url = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
		} else { // 회원가입 실패
			url = "/WEB-INF/views/Ex02_JDBC_JoinForm.jsp";
		}
		
		ActionForward forward = new ActionForward();
	  	forward.setRedirect(false);
	  	forward.setPath(url);

		return forward;
	}

}
