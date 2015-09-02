package com.nailro.util;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
private FileOutputStream fos;
public String uploadFile(MultipartFile file,String path,String filename){
	byte fileDate[];
	try {
		fileDate = file.getBytes();
		fos = new FileOutputStream(path+filename);
		fos.write(fileDate);
		
	} catch (IOException e) {
		e.printStackTrace();
	}finally{
		if(fos !=null){
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	return path+filename;
}
}
