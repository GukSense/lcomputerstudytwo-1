package com.lcomputerstudy.example.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired  BoardMapper  boardmapper;
	
	@Override
	public List<Board> selectBoardList(Pagination pagination){
		System.out.println("----- at Service -----");
		System.out.println("카테고리: " + pagination.getSearch().getCategory());
		System.out.println("타겟: " + pagination.getSearch().getTarget());
		System.out.println("키워드: " + pagination.getSearch().getKeyword());
		return boardmapper.selectBoardList(pagination);
	}
	@Override
	public void insertBoard(Board board, MultipartFile file) throws Exception {
		
		String path = System.getProperty("user.dir") + "/src/main/resources/static/file/";
		/*식별자 랜덤.생성*/
		UUID uuid = UUID.randomUUID();
		/*랜덤식별자 _ 원래파일이름 = 저장될 파일이름 지정*/
		String fileName = uuid + "_" + file.getOriginalFilename();
		 /*빈 껍데기 생성*/
        /*File을 생성할건데, 이름은 "fileName" 으로할거고, Path 라는 경로에 담긴다는 뜻*/
		File savaFile = new File(path, fileName);
		if(file.getOriginalFilename()!= "") {
			file.transferTo(savaFile);
			/*디비에 파일 넣기*/
			board.setFileName(fileName);
			 /*저장되는 경로*/
			board.setFilePath(fileName); /*저장된파일의이름,저장된파일의경로*/
			 /*파일 저장*/
		}
		
		boardmapper.insertBoard(board);
		System.out.println(board.getbIdx());	//bIDx check
		boardmapper.updateBoard(board);
		
	}
	@Override
	public void replyBoard(Board board, MultipartFile file) {
		
		boardmapper.replyInsertBoard(board);
		System.out.println(board.getbIdx() + "  " + board.getbGroup() + "  " + board.getbDepth() + "  " + board.getbOrder() );
		boardmapper.depthGroupUpdate(board);
		System.out.println(board.getbIdx() + "  " + board.getbGroup() + "  " + board.getbDepth() + "  " + board.getbOrder() );
		boardmapper.orderUpdate(board);
		
	}
	@Override
	public Board viewBoard(Board board) {
		System.out.println(board.getbIdx());	// bIdx check
		boardmapper.hitsBoard(board);
		return boardmapper.viewBoard(board);
	} 
	@Override
	public void deleteBoard(Board board) {
		boardmapper.deleteBoard(board);
	}
	@Override
	public void editBoard(Board board, MultipartFile file) {
		boardmapper.editBoard(board);
	}
	@Override
	public int countBoard(Pagination pagination) {
		return boardmapper.countBoard(pagination);
	}
}
