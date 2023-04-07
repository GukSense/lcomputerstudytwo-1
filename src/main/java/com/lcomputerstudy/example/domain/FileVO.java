package com.lcomputerstudy.example.domain;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {

	public Board init(Board board, MultipartFile file) throws Exception{
		String path = System.getProperty("user.dir") + "/src/main/resources/static/file/";
		/*식별자 랜덤.생성*/
		UUID uuid = UUID.randomUUID();
		/*랜덤식별자 _ 원래파일이름 = 저장될 파일이름 지정*/
		String fileName = uuid + "_" + file.getOriginalFilename();
		/*빈 껍데기 생성*/
		/*File을 생성할건데, 이름은 "fileName" 으로할거고, Path 라는 경로에 담긴다는 뜻*/
		File savaFile = new File(path, fileName);
		if(board.getFileName()!= null) {
			file.transferTo(savaFile);
			/*디비에 파일 넣기*/
			board.setFileName(fileName);
			/*저장되는 경로*/
			board.setFilePath(fileName); /*저장된파일의이름,저장된파일의경로*/
			/*파일 저장*/
		}
		
		return board;
	};
}
