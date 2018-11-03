package inform.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import inform.bean.NewsVO;
import inform.controller.NewsListDTO;

@Repository
public class NewsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int newsWrite(NewsVO newsVO) {
		return sqlSession.insert("newsMapper.newsWrite", newsVO);
	}
	
	public List<NewsVO> newsListAll(NewsListDTO newsListDTO) {
		return sqlSession.selectList("newsMapper.newsListAll", newsListDTO);
	}
	
	public List<NewsVO> newsList(NewsListDTO newsListDTO) {
		return sqlSession.selectList("newsMapper.newsList", newsListDTO);
	}
	
	public NewsVO newsView(int news_num) {
		return sqlSession.selectOne("newsMapper.newsView", news_num);
	}
	
	public int newsDelete(int news_num) {
		return sqlSession.delete("newsMapper.newsDelete", news_num);
	}
	
	public int newsModify(NewsVO newsVO) {
		return sqlSession.update("newsMapper.newsModify", newsVO);
	}
	
	public int getTotalAAll() {
		return sqlSession.selectOne("newsMapper.getTotalAAll");
	}
	
	public int getTotalA(String sort) {
		return sqlSession.selectOne("newsMapper.getTotalA", sort);
	}
}
