package com.jboard.controller.user;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.TermsDTO;
import com.jboard.service.TermsService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/terms.do")
public class TermsController extends HttpServlet {
	

	private static final long serialVersionUID = 5481006211308686602L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private TermsService service = TermsService.getInstance();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 조회
		TermsDTO termsDTO = service.selectTerms();
		
		//시스템 출력(실제 개발과정에서는 사용 가능하지만 배포했을 경우에는 제거해야 됨)
		logger.info("termsDTO - "+termsDTO);
		
		//데이터 공유 참조
		req.setAttribute("termsDTO", termsDTO);

		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/terms.jsp");
		dispatcher.forward(req, resp);
	
	}
}
