package community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.FreeboardDTO;
import community.bean.Freeboard_commentDTO;
import community.bean.ImgboardDTO;
import community.dao.CommunityDAO;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityDAO communityDAO;
	
	// 자유 게시판 - 게시글
	@Override
	public int freeboard_write(FreeboardDTO freeboardDTO) {
		return communityDAO.freeboard_write(freeboardDTO);
	}

	@Override
	public int freeboard_delete(int freeboard_num) {
		return communityDAO.freeboard_delete(freeboard_num);
	}

	@Override
	public FreeboardDTO freeboard_view(int freeboard_num) {
		return communityDAO.freeboard_view(freeboard_num);
	}

	@Override
	public List<FreeboardDTO> freeboard_list(int free_startNum, int free_endNum, String freeboard_searchType, String freeboard_keyword) {
		return communityDAO.freeboard_list(free_startNum, free_endNum, freeboard_searchType, freeboard_keyword);
	}

	@Override
	public int freeboard_getTotalA(String freeboard_searchType, String freeboard_keyword) {
		return communityDAO.freeboard_getTotalA(freeboard_searchType, freeboard_keyword);
	}

	@Override
	public void freeboard_hit(int freeboard_num) {
		communityDAO.freeboard_hit(freeboard_num);
	}

	@Override
	public int freeboard_modify(FreeboardDTO freeboardDTO) {
		return communityDAO.freeboard_modify(freeboardDTO);
	}
	// 자유 게시판 - 게시글

	
	// 자유 게시판 - 덧글
//	@Override
//	public void free_commentInsert(Freeboard_commentDTO freeboard_commentDTO) {
//		communityDAO.free_commentInsert(freeboard_commentDTO);
//	}
//
//	@Override
//	public int free_commentDelete(int free_comment_num) {
//		return communityDAO.free_commentDelete(free_comment_num);
//	}
//
//	@Override
//	public int free_commentCount(int freeboard_num) {
//		return communityDAO.free_commentCount(freeboard_num);
//	}
//
//	@Override
//	public List<Freeboard_commentDTO> free_commentList(int freeboard_num) {
//		return communityDAO.free_commentList(freeboard_num);
//	}
	// 자유 게시판 - 덧글
	
	
	// 스샷 게시판 - 게시글
	@Override
	public int imgboard_write(ImgboardDTO imgboardDTO) {
		return communityDAO.imgboard_write(imgboardDTO);
	}

	@Override
	public int imgboard_modify(ImgboardDTO imgboardDTO) {
		return communityDAO.imgboard_modify(imgboardDTO);
	}

	@Override
	public int imgboard_delete(int imgboard_num) {
		return communityDAO.imgboard_delete(imgboard_num);
	}

	@Override
	public ImgboardDTO imgboard_view(int imgboard_num) {
		return communityDAO.imgboard_view(imgboard_num);
	}

	@Override
	public List<ImgboardDTO> imgboard_list(int img_startNum, int img_endNum, String imgboard_searchType, String imgboard_keyword) {
		return communityDAO.imgboard_list(img_startNum, img_endNum, imgboard_searchType, imgboard_keyword);
	}

	@Override
	public int imgboard_getTotalA(String imgboard_searchType, String imgboard_keyword) {
		return communityDAO.imgboard_getTotalA(imgboard_searchType, imgboard_keyword);
	}

	@Override
	public void imgboard_hit(int imgboard_num) {
		communityDAO.imgboard_hit(imgboard_num);
	}
	// 스샷 게시판 - 게시글


}
