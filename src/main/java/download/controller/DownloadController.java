package download.controller;

import java.io.File;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DownloadController implements ApplicationContextAware{
 
    private WebApplicationContext context = null;
     
    @RequestMapping(value= "/down/downloadGame.do")
    public ModelAndView downloadGame(){
         System.out.println("testsetset");
        String fullPath = "C:\\Users\\John\\Desktop\\yutnoriGame" + "\\" + "yutnori.exe";
         
        File file = new File(fullPath);
        return new ModelAndView("download", "downloadFile", file);

    }
 
    @Override
    public void setApplicationContext(ApplicationContext arg0)
            throws BeansException {
        // TODO Auto-generated method stub
         
        this.context = (WebApplicationContext)arg0;
         
    }
     
}
