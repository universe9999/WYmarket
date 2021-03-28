package com.kgitbank.model;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
@Component
public class Pagination {

	private int pageNum;
	private int amount;
    private final int PAGINATION_SIZE = 5;
    private int total;
    private String search;
    
	public Pagination() {
		this(1, 10);
	}
	
	public Pagination(int pageNum, int amount){
		this.pageNum = pageNum;
		this.amount = amount <= 0 ? 10 : amount;
	}
	
}