package teamx4.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import rest.model.ReviewBean;
import teamx4.model.CrawlingBean;
import teamx4.model.UserBean;
import teamx4.model.teamx4Dao;




@Controller
public class ReviewFormController {

	private final String command = "/reviewForm.tm";
	private final String command2 =  "/reviewDelete.tm";
	private final String getPage = "reviewForm";
	private final String getPage2 = "redirect:/detail.rest";
	
	private final String commandupdate = "/reviewUpdate.tm";
	private final String getPageupdate = "UpdateForm";
	
	
	@Autowired
	private teamx4Dao crawlingDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doActionGet(
			@RequestParam(value = "restNum", required = true) int restNum,
			HttpSession session) {
		
		String usernum = (String)session.getAttribute("user_num");
		CrawlingBean cb = crawlingDao.getRestaurant(restNum);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("usernum", usernum);
		mav.addObject("cb", cb);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(
			@RequestParam(value = "restNum", required = true) int restNum,
			@RequestParam(value = "rate", required = false) int rate,
			@RequestParam(value = "reviewTaste", required = false) int reviewTaste,
			@RequestParam(value = "reviewPrice", required = false) int reviewPrice,
			@RequestParam(value = "reviewService", required = false) int reviewService,
			@RequestParam(value = "reviewContent", required = false) String reviewContent,
			@RequestParam(value = "file", required = false) MultipartFile[] file,
			@RequestParam(value = "usernum", required = true) String usernum,
			HttpServletRequest request) {
		
		//CrawlingBean cb = crawlingDao.getRestaurant(restNum);
		System.out.println("restNum: " + restNum);
		System.out.println("rate: " + rate);
		System.out.println("reviewTaste: " + reviewTaste);
		System.out.println("reviewPrice: " + reviewPrice);
		System.out.println("reviewService: " + reviewService);
		System.out.println("reviewContent: " + reviewContent);
		System.out.println("reviewusernum "+usernum);

		//System.out.println("파일 크기 : " + file.length);
		
		//System.out.println("file[0].getOriginalFilename(): " + file[0].getOriginalFilename());
		
		//파일이 업로드 될 경로 설정
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
		System.out.println("saveDir: " + request.getSession().getServletContext().getRealPath("/resources/upload/file"));
		
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
			
		ReviewBean rb = new ReviewBean();
		rb.setUsernum(usernum);
		rb.setRestnum(restNum);
		rb.setReviewstar(rate);
		rb.setReviewtaste(reviewTaste);
		rb.setReviewprice(reviewPrice);
		rb.setReviewservice(reviewService);
		rb.setReviewcontent(reviewContent);
		rb.setReviewimage(allFileName);
		//Timestamp ts = new Timestamp(System.currentTimeMillis());
		//rb.setReviewDate(ts);
		
		crawlingDao.insertReview(rb);
		
		
		UserBean ub = crawlingDao.selectUser2(usernum);
		ub.setRestNum(restNum);
		ReviewBean review = crawlingDao.getReview(ub);
		int reviewNum = review.getReviewnum();
		String user_review_list = ub.getUser_review_list();
		System.out.println(user_review_list);
		String update_review_list= "";
		if(user_review_list==null) {
			update_review_list = reviewNum+"";
		}
		else {
			update_review_list = user_review_list+","+reviewNum;
		}
		ub.setUser_review_list(update_review_list);
		crawlingDao.updateUser(ub);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("restnum", rb.getRestnum());
		mav.setViewName(getPage2);
		return mav;
	}
	
	@RequestMapping(value = commandupdate, method = RequestMethod.GET)
	public ModelAndView doActionUpdate(
			@RequestParam(value = "reviewNum", required = true) int reviewNum) {
		
		ReviewBean rb = crawlingDao.getReview(reviewNum);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rb", rb);
		mav.setViewName(getPageupdate);
		return mav;
	}
	
	@RequestMapping(value = commandupdate, method = RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam(value = "reviewNum", required = true) int reviewNum,
			@RequestParam(value = "rate", required = false) int rate,
			@RequestParam(value = "reviewTaste", required = false) int reviewTaste,
			@RequestParam(value = "reviewPrice", required = false) int reviewPrice,
			@RequestParam(value = "reviewService", required = false) int reviewService,
			@RequestParam(value = "reviewContent", required = false) String reviewContent,
			@RequestParam(value = "file", required = false) MultipartFile[] file,
			HttpServletRequest request) {
		
		//CrawlingBean cb = crawlingDao.getRestaurant(restNum);
		System.out.println("reviewNum: " + reviewNum);
		System.out.println("rate: " + rate);
		System.out.println("reviewTaste: " + reviewTaste);
		System.out.println("reviewPrice: " + reviewPrice);
		System.out.println("reviewService: " + reviewService);
		System.out.println("reviewContent: " + reviewContent);
		
		ReviewBean bean = crawlingDao.getReview(reviewNum);
		System.out.println(bean.getReviewimage());
		//rb.getReviewImage();
	
		//System.out.println("파일 크기 : " + file.length);
		
		//System.out.println("file[0].getOriginalFilename(): " + file[0].getOriginalFilename());
		
		//파일이 업로드 될 경로 설정
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/file");
		
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
				
				if(file == null) {
					allFileName = bean.getReviewimage();
				}
				
				// 파일 이름 합치기
				allFileName += reName + "/";
			} 
		}
	}
			
		ReviewBean rb = new ReviewBean();
		rb.setReviewnum(reviewNum);
		rb.setReviewstar(rate);
		rb.setReviewtaste(reviewTaste);
		rb.setReviewprice(reviewPrice);
		rb.setReviewservice(reviewService);
		rb.setReviewcontent(reviewContent);
		rb.setReviewimage(allFileName);
		//Timestamp ts = new Timestamp(System.currentTimeMillis());
		//rb.setReviewDate(ts);
		
		crawlingDao.updateReview(rb);
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("cb", cb);
		System.out.println("ddddddddd:"+rb.getRestnum());
		mav.setViewName("redirect:/detail.rest?restnum="+bean.getRestnum());
		return mav;
	}
	
	@RequestMapping(value = command2, method = RequestMethod.GET)
	public ModelAndView doActionDelet(
			@RequestParam(value = "reviewNum", required = true) int reviewNum,
			@RequestParam(value="restnum") int restnum) {
		
		crawlingDao.deleteReview(reviewNum);
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("rb", rb);
		mav.setViewName("redirect:/detail.rest?restnum="+restnum);
		return mav;
	}
	
}
