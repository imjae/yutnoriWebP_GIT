package inform.controller;

import java.util.List;

import inform.bean.NewsVO;

public interface NewsService {
	
	int newsWrite(NewsVO newsVO);
	
	List<NewsVO> newsListAll(NewsListDTO newsListDTO);
	
	List<NewsVO> newsList(NewsListDTO newsListDTO);
	
	NewsVO newsView(int news_num);
	
	int newsDelete(int news_num);
	
	int newsModify(NewsVO newsVO);
	
	int getTotalAAll();
	
	int getTotalA(String sort);
}
