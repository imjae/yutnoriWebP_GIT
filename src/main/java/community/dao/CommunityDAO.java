package community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import community.bean.FreeboardDTO;
import community.bean.Freeboard_commentDTO;
import community.bean.ImgboardDTO;

@Repository
public class CommunityDAO {
   @Autowired
   private SqlSessionTemplate session;
   
   // 자유 게시판(게시글)
   public int freeboard_write(FreeboardDTO freeboardDTO) {
      return session.insert("mybatis.communityMapper.freeboardWrite", freeboardDTO);
   }
   
   public int freeboard_modify(FreeboardDTO freeboardDTO) {
      return session.update("mybatis.communityMapper.freeboardModify", freeboardDTO);
   }
   
   public void freeboard_hit(int freeboard_num) {
      session.update("mybatis.communityMapper.freeboardHit", freeboard_num);
   }
   
   public int freeboard_delete(int freeboard_num) {
      return session.delete("mybatis.communityMapper.freeboardDelete", freeboard_num);
   }
   
   public List<FreeboardDTO> freeboard_list(int free_startNum, int free_endNum) {
      Map<String, Integer> map = new HashMap<>();
      map.put("free_startNum", free_startNum);
      map.put("free_endNum", free_endNum);
      return session.selectList("mybatis.communityMapper.freeboardList", map);
   }
   
   public FreeboardDTO freeboard_view(int freeboard_num) {
      return session.selectOne("mybatis.communityMapper.freeboardView", freeboard_num);
   }
   
   public int freeboard_getTotalA() {
      return session.selectOne("mybatis.communityMapper.freeboard_getTotalA");
   }
   
   
   // 자유 게시판(댓글)
   public void free_commentInsert(Freeboard_commentDTO freeboard_commentDTO) throws Exception {
      session.insert("mybatis.communityMapper.free_commentInsert", freeboard_commentDTO);
   }

   public void free_commentDelete(Freeboard_commentDTO freeboard_commentDTO) throws Exception {
      session.delete("mybatis.communityMapper.free_commentDelete", freeboard_commentDTO);
   }

   public int free_commentCount(int freeboard_num) {
      return session.selectOne("mybatis.communityMapper.free_commentCount", freeboard_num);
   }

   public List<Freeboard_commentDTO> free_commentList(int freeboard_num) throws Exception {
      return session.selectList("mybatis.communityMapper.free_commentList", freeboard_num);
   }
   
   
   // 스샷 게시판(게시글)
   public int imgboard_write(ImgboardDTO imgboardDTO) {
      return session.insert("mybatis.communityMapper.imgboardWrite", imgboardDTO);
   }
   
   public int imgboard_modify(ImgboardDTO imgboardDTO) {
      return session.update("mybatis.communityMapper.imgboardModify", imgboardDTO);
   }
   
   public void imgboard_hit(int imgboard_num) {
      session.update("mybatis.communityMapper.imgboardHit", imgboard_num);
   }
   
   public int imgboard_delete(int imgboard_num) {
      return session.delete("mybatis.communityMapper.imgboardDelete", imgboard_num);
   }
   
   public List<ImgboardDTO> imgboard_list(int img_startNum, int img_endNum) {
      Map<String, Integer> map = new HashMap<>();
      map.put("img_startNum", img_startNum);
      map.put("img_endNum", img_endNum);
      return session.selectList("mybatis.communityMapper.imgboardList", map);
   }
   
   public ImgboardDTO imgboard_view(int imgboard_num) {
      return session.selectOne("mybatis.communityMapper.imgboardView", imgboard_num);
   }
   
   public int imgboard_getTotalA() {
      return session.selectOne("mybatis.communityMapper.imgboard_getTotalA");
   }
   
   
   
   
   
}