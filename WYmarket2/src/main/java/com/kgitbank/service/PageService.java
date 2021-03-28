package com.kgitbank.service;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.kgitbank.model.Pagination;

import lombok.Data;

@Data
@Service
@Component
public class PageService {

	int startPage;
	int endPage;
	int lastPage;
	int pageNum;
	int PAGINATION_SIZE;
	int amount;
	int total;
	boolean previous;
	boolean next;

	public PageService(Pagination pg) {
		 pageNum = pg.getPageNum();
		 PAGINATION_SIZE = pg.getPAGINATION_SIZE();
		 amount = pg.getAmount();
		 total = pg.getTotal();
		 
		startPage = pageNum % PAGINATION_SIZE == 0
				? (pageNum / PAGINATION_SIZE) * PAGINATION_SIZE - (PAGINATION_SIZE - 1)
				: (pageNum / PAGINATION_SIZE + 1) * PAGINATION_SIZE - (PAGINATION_SIZE - 1);

		endPage = pageNum % PAGINATION_SIZE == 0 ? (pageNum / PAGINATION_SIZE) * PAGINATION_SIZE
				: (pageNum / PAGINATION_SIZE + 1) * PAGINATION_SIZE;

		lastPage = total % amount == 0 ? total / amount : total / amount + 1;

		endPage = endPage > lastPage ? lastPage : endPage;

		previous = startPage != 1;
		next = lastPage != endPage;
	}


}