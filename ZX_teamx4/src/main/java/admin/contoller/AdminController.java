package admin.contoller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminReviewBean;
import admin.model.UserBean;
import admin.model.UserDao;
import rest.model.RestBean;
import utility.Paging;




@Controller
public class AdminController {

	private final String userPage = "user";
	private final String businessPage = "business";
	private final String restPage = "rest";
	private final String reviewPage = "review";
	private final String command = "/user.admin";
	
	@Autowired
	UserDao udao;
	
	
	@RequestMapping(value="/main.admin")
	public void Main() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
	}
	
	
	@RequestMapping(value=command)
	public ModelAndView userSelect(@RequestParam(value="column",required = false) String column,
			 @RequestParam(value="keyword",required = false) String keyword,
			 @RequestParam(value="pageNumber",required = false) String pageNumber,
			 HttpServletRequest request) {
		
		String url = request.getContextPath()+command;
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("column", column);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = udao.TotalCount(map);
		
		
		Paging pg = new Paging(pageNumber,null,totalCount,url,column,keyword,null);
		
		
		List<UserBean> ub = udao.selectUser(map,pg);
		
		int number = 0;
		
		number= totalCount-(pg.getPageNumber()-1) * 10;
		
		
		mav.addObject("ub",ub);
		mav.addObject("number",number);
		mav.addObject("pg",pg);
		mav.setViewName(userPage);
		return mav;
	}
	
	@RequestMapping(value="/business.admin")
	public ModelAndView businessSelect(@RequestParam(value="column",required = false) String column,
			 @RequestParam(value="keyword",required = false) String keyword,
			 @RequestParam(value="pageNumber",required = false) String pageNumber,
			 HttpServletRequest request) {
		
		String url = request.getContextPath()+"/business.admin";
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("column", column);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = udao.TotalCountbusiness(map);
		Paging pg = new Paging(pageNumber,null,totalCount,url,column,keyword,null);
		
		
		List<UserBean> ub = udao.selectbusiness(map,pg);

		int number = 0;
		
		number= totalCount-(pg.getPageNumber()-1) * 10;
		
		
		mav.addObject("ub",ub);
		mav.addObject("number",number);
		mav.addObject("pg",pg);
		mav.setViewName(businessPage);
		
		return mav;
	}
	
	@RequestMapping(value="/rest.admin")
	public ModelAndView restSelect(@RequestParam(value="column",required = false) String column,
			 @RequestParam(value="keyword",required = false) String keyword,
			 @RequestParam(value="pageNumber",required = false) String pageNumber,
			 HttpServletRequest request) {
		
		String url = request.getContextPath()+"/rest.admin";
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("column", column);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = udao.TotalCountRest(map);
		
		Paging pg = new Paging(pageNumber,null,totalCount,url,column,keyword,null);
		
		
		List<RestBean> ub = udao.selectRest(map,pg);
		int number = 0;
		
		number= totalCount-(pg.getPageNumber()-1) * 10;
		
		mav.addObject("ub",ub);
		mav.addObject("number",number);
		mav.addObject("pg",pg);
		mav.setViewName(restPage);
		
		return mav;
	}
	
	@RequestMapping(value="/review.admin")
	public ModelAndView reviewSelect(@RequestParam(value="column",required = false) String column,
			 @RequestParam(value="keyword",required = false) String keyword,
			 @RequestParam(value="pageNumber",required = false) String pageNumber,
			 HttpServletRequest request) {
		
		String url = request.getContextPath()+"/review.admin";
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("column", column);
		map.put("keyword", keyword);
		
		int totalCount = udao.TotalCountReview(map);
		
		Paging pg = new Paging(pageNumber,null,totalCount,url,column,keyword,null);
		
		
		List<AdminReviewBean> ub = udao.selectReview(map,pg);
		int number = 0;
		
		number= totalCount-(pg.getPageNumber()-1) * 10;
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("ub",ub);
		mav.addObject("number",number);
		mav.addObject("pg",pg);
		mav.setViewName(reviewPage);
		
		return mav;
	}
	
	@RequestMapping(value="/deleteuser.admin")
	public ModelAndView deleteUser( @RequestParam(value="usernum") String usernum,
							@RequestParam(value="pageNumber") String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		udao.deleteUser(usernum);
		udao.deleteReviewByUser(usernum);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("redirect:/user.admin");
		return mav;
		
	}
	
	@RequestMapping(value="/deletebusi.admin")
	public ModelAndView deleteBusi( @RequestParam(value="usernum") String usernum,
							@RequestParam(value="pageNumber") String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		udao.deleteUser(usernum);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("redirect:/business.admin");
		return mav;
		
	}
	
	@RequestMapping(value="/deleterest.admin")
	public ModelAndView deleteRest( @RequestParam(value="restnum") int restnum,
							@RequestParam(value="pageNumber") String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		udao.deleteRest(restnum);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("redirect:/rest.admin");
		return mav;
		
	}
	
	@RequestMapping(value="/deletereview.admin")
	public ModelAndView deleteReview( @RequestParam(value="reviewnum") int reviewnum,
							@RequestParam(value="pageNumber") String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		udao.deleteReview(reviewnum);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("redirect:/review.admin");
		return mav;
		
	}
	
	@RequestMapping(value="/updaterest.admin",method=RequestMethod.GET)
	public ModelAndView updateRest( @RequestParam(value="restnum") int restnum,
							@RequestParam(value="pageNumber") String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		RestBean rb = udao.updateRest(restnum);
		mav.addObject("rb",rb);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("update");
		return mav;
		
	}
	
	@RequestMapping(value="/update.admin",method=RequestMethod.POST)
	public ModelAndView updateRestPost(RestBean arb,
									   @RequestParam(value = "uploadFile", required = false) MultipartFile[] file,
									   HttpServletRequest request) {
									  
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
		System.out.println(arb.getRestkeyword()+"1");
		System.out.println(arb.getResttel()+"2");
					   
		//위에서 설정한 경로의 폴더가 없을 경우 생성 
		File dir = new File(saveDir); 
		if(!dir.exists()) {
			dir.mkdirs(); 
		}
		
		String allFileName = "";
		if(file != null) {
		// 파일 업로드 
		for(MultipartFile f : file) {
			if(!f.isEmpty()) { 
				// 기존 파일 이름을 받고 확장자 저장 
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf(".")); 
				
				// 이름 값 변경을 위한 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS"); 
				int rand = (int)(Math.random()*1000); 
				
				// 파일 이름 변경 
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				
				// 파일 저장 
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				// 파일 이름 합치기
				allFileName += reName + "/";
			} 
		}
	}
	
		arb.setRestimg(allFileName);
		
		udao.updateRestFinal(arb);
		
		
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("redirect:/rest.admin");
		return mav;
		
	}
	
		
	
	
	
	
}
