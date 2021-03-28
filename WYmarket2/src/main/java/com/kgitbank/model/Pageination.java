package com.kgitbank.model;

import lombok.Data;
import lombok.Getter;

@Data
public class Pageination {

	private String usernick;	
	private int pagenum;
	private int amount;
	private String psearch;
	private String istate;
	
	
	public Pageination() {
		this(1,8);
	}
	
	public Pageination(int pagenum, int amount){
		this.pagenum = pagenum;
		this.amount = amount <= 0 ? 10 : amount;
	}
	
	public PageDTO getPageData(int paginate_size, int rowCount) {
		return new PageDTO(paginate_size, rowCount);
	}
	
	@Getter
	public class PageDTO{
		private int currPage;
		private int startPage;
		private int endPage;
		private int size;
		private boolean previous;
		private boolean next;
		private int lastPage;
		
		
		private PageDTO(int size, int total) {
			this.currPage = pagenum;
			
	        this.endPage = pagenum % size == 0 ? (pagenum / size) * size : (pagenum / size + 1) * size;	            
	        this.startPage = endPage - (size - 1);
	        this.lastPage = total % amount == 0 ? total / amount : total / amount + 1;                
	        this.endPage = endPage > lastPage ? lastPage : endPage; 
	        this.previous = startPage != 1;
	        this.next = lastPage != endPage;
			this.size = size;
		}
		
		
		public int getAmount() {
			return amount;
		}
		
		
	}
	
}
