package com.lcomputerstudy.example.domain;

public class Pagination {
	int count;		//테이블에 등록된 총 수 
	int page;		//현재 페이지번호
	int pageNum;	//(boardCount / page) = 화면에 나타 낼 board index 번호
	int startPage;	//pagination의 시작 ex)1,6,11
	int endPage;	//pagination의 끝	 ex)5,10,15
	int lastPage;	//(userCount/ 화면에표시할갯수) , pagination 마지막 번호
	int prevPage;	//pagination의 이전 목록
	int nextPage;	//pagination의 다음 목록
	
	public static final int pageUnit = 5;	//넘길 페이지갯수
	public static final int perPage = 10;	//화면에 표시할 갯수
	
	private Search search;
	
	public Pagination() {
		this.page = 1;
	}
	
	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}
	
	public void init() {
		pageNum = (page-1)*perPage;
		startPage = ((page-1)/pageUnit)*pageUnit+1;
		lastPage = (int)Math.ceil(count/(float)perPage);
		endPage = startPage + pageUnit -1;
		endPage = endPage < lastPage ? endPage : lastPage;
		prevPage = (startPage-pageUnit);
		nextPage = (startPage+pageUnit);		
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	
}
