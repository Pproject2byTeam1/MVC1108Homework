package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class MemberEditService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward forward=null;
      HttpSession session = request.getSession();
      koreaMemberDto member = (koreaMemberDto) session.getAttribute("member");
      String url = null;
         
        if (member == null || !member.getId().equals("admin")) { //관리자가 아니면..
           url = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
        } else { //관리자면...
           RegisterDao dao = new RegisterDao(); koreaMemberDto dto = dao.getMemberById(request.getParameter("id"));
           request.setAttribute("member", dto); 
           url = "/WEB-INF/views/Ex03_MemberEdit.jsp";
        }
        
        forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath(url);
        
      return forward;
   }

}