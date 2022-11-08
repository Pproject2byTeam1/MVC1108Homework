package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class MemberListService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {


      ActionForward forward = null;
      HttpSession session = request.getSession();
      koreaMemberDto member = (koreaMemberDto) session.getAttribute("member");
      String url = "";
      
      if (member == null) { 
         url="/WEB-INF/views/Ex02_JDBC_Login.jsp";
         
      } else{ 
         String id = member.getId();

         if (!id.equals("admin")) { 
            url="/WEB-INF/views/Ex02_JDBC_Login.jsp";
         } 
         else { RegisterDao dao = new RegisterDao();

            List<koreaMemberDto> memberlist = dao.getMemberListAll();
            request.setAttribute("memberlist", memberlist);
            url="/WEB-INF/views/Ex03_Memberlist.jsp"; 
         } 
      }

      forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath(url); 
      
      return forward;
   }
}