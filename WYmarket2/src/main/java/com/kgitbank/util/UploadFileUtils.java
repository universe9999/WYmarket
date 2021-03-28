package com.kgitbank.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

// 날짜(연/월/일)로 구성된 폴더를 생성하고, 
// 같은 파일명이라도 중복되지 않도록 랜덤문자와 파일명을 조합한 뒤 생성된 폴더에 저장하며, 
// 썸네일을 생성하여 별도의 폴더에 저장

public class UploadFileUtils {
		 
	public static String fileUpload(String uploadPath,
			String fileName, 
			byte[] fileData, String ymdPath) throws Exception {

		// 랜덤문자 생성
		UUID uid = UUID.randomUUID();

		String newFileName = uid + "_" + fileName;  // "랜덤문자_파일명"
		String imgPath = uploadPath + ymdPath;  // 업로드 경로 + 연월일 경로 = 이미지 저장 경로

		// 이미지 저장 경로에 원본 파일을 저장
		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		//File image = new File(imgPath + File.separator + newFileName);

		return newFileName;
	}

	public static String calcPath(String uploadPath) {

		// 캘린더를 불러옴
		Calendar cal = Calendar.getInstance();

		// 캘린더에서 연도만 추출
		String yearPath = File.separator + cal.get(Calendar.YEAR);

		// 캘린더에서 월만 추출. 형식은 00(01월, 02월...11월, 12월)
		// 단, 1월은 캘린더상에서 0이므로, +1을 해줌
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

		// 캘린더에서 날짜만 추출
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		// 원본 이미지가 저장될 경로 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);

		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {

		// 폴더가 존재하는지 확인. 폴더가 존재하면 그대로 종료
		if (new File(paths[paths.length - 1]).exists()) { return; }

		// 폴더가 존재하지 않다면, 폴더를 생성
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

}