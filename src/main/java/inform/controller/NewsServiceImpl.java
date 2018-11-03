package inform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inform.bean.NewsVO;
import inform.dao.NewsDAO;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsDAO newsDAO;

	@Override
	public int newsWrite(NewsVO newsVO) {
		return newsDAO.newsWrite(newsVO);
	}

	@Override
	public List<NewsVO> newsListAll(NewsListDTO newsListDTO) {
		return newsDAO.newsListAll(newsListDTO);
	}

	@Override
	public List<NewsVO> newsList(NewsListDTO newsListDTO) {
		return newsDAO.newsList(newsListDTO);
	}

	@Override
	public NewsVO newsView(int news_num) {
		return newsDAO.newsView(news_num);
	}

	@Override
	public int newsDelete(int news_num) {
		return newsDAO.newsDelete(news_num);
	}

	@Override
	public int newsModify(NewsVO newsVO) {
		return newsDAO.newsModify(newsVO);
	}

	@Override
	public int getTotalAAll() {
		return newsDAO.getTotalAAll();
	}

	@Override
	public int getTotalA(String sort) {
		return newsDAO.getTotalA(sort);
	}

}
