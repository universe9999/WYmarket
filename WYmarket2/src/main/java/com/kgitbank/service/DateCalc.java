package com.kgitbank.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class DateCalc {

	private int year;
	private int month;
	private int day;
	private Calendar cal;
	
	private String totalDate;
	
	public DateCalc() {
		cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR);
	}
	
	public DateCalc(int year, int month) {
		System.out.println(year + "/" + month);
		cal = Calendar.getInstance();
		cal.set(year, month - 1, 1);
		day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println(day);
	}
	
	public DateCalc(String year, String month, String day) {
		year = year.substring(2, year.length());
		
		if((month == null || month.equals("월 선택")) && (day == null || day.equals("일 선택"))) {
			totalDate = year;
		} else if((month != null || !month.equals("월 선택")) && ( day == null || day.equals("일 선택"))) {
			if(Integer.parseInt(month) < 10) {
				month = "0" + month;
			}
			totalDate = year + "/" + month;
		} else {
			if(Integer.parseInt(month) < 10) {
				month = "0" + month;
			}
			if(Integer.parseInt(day) < 10) {
				day = "0" + day;
			}
			totalDate = year + "/" + month + "/" + day;
		}
		
		
	}
	
	public int getYear() {
		return year;
	}
	
	public int getDay() {
		System.out.println(day);
		return day;
	}

	public String getTotalDate() {
		return totalDate;
	}
	
}
