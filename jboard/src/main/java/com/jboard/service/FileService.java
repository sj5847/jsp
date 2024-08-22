package com.jboard.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dao.FileDao;
import com.jboard.dto.FileDto;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public enum FileService {

	INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private FileDao dao = FileDao.getInstance();
	
	public int insertFile(FileDto dto) {
		return 0;
		
	}
	public FileDto selectFile(String fno) {
		return dao.selectFile(fno);
	}
	public List<FileDto> selectFiles() {
		return null;
		
	}
	public void updateFile(FileDto dto) {
		dao.updateFile(dto);
	}
	public void deleteFile(int fno) {
		dao.deleteFile(fno);
	}
	
	public List<FileDto> fileUpload(HttpServletRequest req) {
		
		List<FileDto> files = new ArrayList<>();
		
		ServletContext ctx = req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");
		
		try {
			Collection<Part> parts = req.getParts(); //첨부파일 정보 객체 가져오기
						
			for(Part part : parts) {
				
				//파일명 추출
				String ofileName = part.getSubmittedFileName();
				
				if(ofileName != null && !ofileName.isEmpty()) {
					//파일을 첨부했으면
					logger.debug("ofileName : "+ofileName);
					
					
					//고유 파일명 생성
					int idx = ofileName.lastIndexOf(".");
					String ext = ofileName.substring(idx);
					String sfileName = UUID.randomUUID().toString()+ext;
					
					//파일 저장
					part.write(uploadPath+File.separator+sfileName);

					//fileDto 생성
					FileDto fileDto = new FileDto();
					fileDto.setoName(ofileName);
					fileDto.setsName(sfileName);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return files;

		
	}
	
	public void fileDownload() {

	}
}
