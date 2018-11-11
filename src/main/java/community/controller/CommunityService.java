package community.controller;

import java.util.List;

import community.bean.FreeboardDTO;
import community.bean.Freeboard_commentDTO;
import community.bean.ImgboardDTO;

public interface CommunityService {
	// 자유 게시판 - 게시글
	int freeboard_write(FreeboardDTO freeboardDTO);
	
	int freeboard_modify(FreeboardDTO freeboardDTO);
	
	int freeboard_delete(int freeboard_num);
	
	FreeboardDTO freeboard_view(int freeboard_num);
	
	List<FreeboardDTO> freeboard_list(int free_startNum, int free_endNum, String freeboard_searchType, String freeboard_keyword);
	
	int freeboard_getTotalA(String freeboard_searchType, String freeboard_keyword);
	
	void freeboard_hit(int freeboard_num);
	// 자유 게시판 - 게시글
	
	
	// 자유 게시판 - 덧글
//	public void free_commentInsert(Freeboard_commentDTO freeboard_commentDTO);
//
//	public int free_commentDelete(int free_comment_num);
//
//	public int free_commentCount(int freeboard_num);
//
//	public List<Freeboard_commentDTO> free_commentList(int freeboard_num);
	// 자유 게시판 - 덧글
	
	
	// 스샷 게시판 - 게시글
	int imgboard_write(ImgboardDTO imgboardDTO);
	
	int imgboard_modify(ImgboardDTO imgboardDTO);
	
	int imgboard_delete(int imgboard_num);
	
	ImgboardDTO imgboard_view(int imgboard_num);
	
	List<ImgboardDTO> imgboard_list(int img_startNum, int img_endNum, String imgboard_searchType, String imgboard_keyword);
	
	int imgboard_getTotalA(String imgboard_searchType, String imgboard_keyword);
	
	void imgboard_hit(int imgboard_num);
	// 스샷 게시판 - 게시글
	
	
	// 스샷 게시판 - 덧글
	
	// 스샷 게시판 - 덧글
}
