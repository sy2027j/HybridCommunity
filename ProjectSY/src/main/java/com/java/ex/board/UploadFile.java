package com.java.ex.board;
import java.io.File;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFile {
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData) throws Exception{
		UUID uid=UUID.randomUUID();
		String newFileName=uid+"_"+fileName;
		
		File target=new File(uploadPath, newFileName);
		FileCopyUtils.copy(fileData, target);
		
		return newFileName;
	}

}
