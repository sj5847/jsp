package com.jboard.service;

import java.util.List;

import com.jboard.dao.ArticleDao;
import com.jboard.dto.ArticleDto;
import com.jboard.dto.PageGroupDto;

public enum ArticleService {
	
	
	INSTANCE;
	private  ArticleDao dao = ArticleDao.getInstance();
	
	//전체 게시물 갯수에 마지막 페이지 번호 구하기
	public int getLastPageNum(int total) {
		
		int lastPPageNum=0;
		
		if(total % 10==0) {
			 lastPPageNum = total/10;
			
		}else {// 10의 배수가 아니라면 남은 게시물이 표시되는 페이지가 필요하기 때문에 +1
			int lastPageNum = total /10+1;
		}
		return lastPPageNum;
	}
	
	//페이지 시작번호(limit) 현재 페이지에 표시될 게시물 목록의 시작 인덱스를 currentPage로 매개변수를 설정
	public int getStartNum(int currentPage) {
		return (currentPage-1)*10;
	}
	
	//현재 페이지번호 구하기
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	//현재 페이지 그룹 구하기
	public PageGroupDto getcurrentPageGroup(int currentPage) {
		int current = (int)Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPage -1) *10 +1;  //페이지의 시작번호
		int pageGroupEnd = currentPage * 10;
		
		return new PageGroupDto(pageGroupStart, pageGroupEnd);
	}
	
	public int insertArticle(ArticleDto dto) {
		dao.insertArticle(dto);
		return 0;
	}
	
	public int selectCountTotal() {
		return dao.selectCountTotal();
	}
	
	public ArticleDto selectArticle(String no) {
		return dao.selectArticle(no);
	}
	
	public List<ArticleDto> selectArticles(int start) {		
		return dao.selectArticles(start);
	}
	public void updateArticle(ArticleDto dto) {
		dao.updateArticle(dto);
	}
	public void deleteArticle(int no) {
		dao.deleteArticle(no);
	}
}
