package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class UserController {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value="/checkId.me")
	public ModelAndView checkId(ModelAndView mav,
			@RequestParam(value="user_num", required=true) String user_num,
			HttpSession session) {
		MemberBean bean = memberDao.getKakaoData(user_num);
		System.out.println(bean);
		if(bean==null) {
			mav.addObject("checkId", "false");
			System.out.println("checkid-false");
		}
		else {
			mav.addObject("checkId", "true");
			session.setAttribute("user_num", user_num);
		}
		mav.setViewName("checkId");
		return mav;
	}
	
	@RequestMapping(value="/addUser.me")
	public void addUser(MemberBean bean, HttpSession session){
		bean.setUser_type(0);
		bean.setUser_review_list("10,11,12");
		bean.setUser_like_list("1,2,3");
		bean.setUser_diningName("");
		bean.setUser_diningAddr("");
		bean.setUser_diningReg("");
		bean.setUser_diningHp("");
		session.setAttribute("user_num", bean.getUser_num());
		memberDao.insertData(bean);
	}
	
	@RequestMapping(value="/updateLikelist.me")
	public ModelAndView updateLikelist(HttpSession session, ModelAndView mav,
			@RequestParam(value="user_like_num", required=true) String user_like_num){
		
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		
		String user_like_list = bean.getUser_like_list();
		String update_like_list = user_like_list+","+user_like_num;
		
		bean.setUser_like_list(update_like_list);
		memberDao.updateLikelist(bean);
		
		mav.setViewName("checkId");
		return mav;
	}
	
	@RequestMapping(value="/deleteLikelist.me")
	public ModelAndView deleteLikelist(HttpSession session, ModelAndView mav,
			@RequestParam(value="restNum", required=true) String restNum){
		
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		
		String user_like_list = bean.getUser_like_list();
		String [] array = user_like_list.split(",");
		
		ArrayList<String> arrayList = new ArrayList<String>();
		for(String temp : array){
		  arrayList.add(temp);
		}
		arrayList.remove(restNum);
		
		String [] newArray = arrayList.toArray(new String[arrayList.size()]);
		String update_like_list = String.join(",", newArray);
		
		bean.setUser_like_list(update_like_list);
		memberDao.updateLikelist(bean);
		
		mav.setViewName("checkId");
		return mav;
	}
	
	@RequestMapping(value="/updateReviewlist.me")
	public ModelAndView updateReviewlist(HttpSession session, ModelAndView mav,
			@RequestParam(value="user_review_num", required=true) String user_review_num){
		
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		
		String user_review_list = bean.getUser_review_list();
		String update_review_list = user_review_list+","+user_review_num;
		
		bean.setUser_review_list(update_review_list);
		memberDao.updateReviewlist(bean);
		
		mav.setViewName("checkId");
		return mav;
	}
	
	@RequestMapping(value="/deleteReviewlist.me")
	public ModelAndView deleteReviewlist(HttpSession session, ModelAndView mav,
			@RequestParam(value="reviewNum", required=true) String reviewNum){
		
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		
		String user_review_list = bean.getUser_review_list();
		String [] array = user_review_list.split(",");
		
		ArrayList<String> arrayList = new ArrayList<String>();
		for(String temp : array){
		  arrayList.add(temp);
		}
		arrayList.remove(reviewNum);
		
		String [] newArray = arrayList.toArray(new String[arrayList.size()]);
		String update_review_list = String.join(",", newArray);
		
		bean.setUser_review_list(update_review_list);
		memberDao.updateReviewlist(bean);
		memberDao.deleteReviewData(reviewNum);
		
		mav.setViewName("checkId");
		return mav;
	}
	
	@RequestMapping(value="/deleteUser.me")
	public ModelAndView deleteUser(HttpSession session, ModelAndView mav){
		String user_num = (String)session.getAttribute("user_num");
		memberDao.deleteData(user_num);
		session.removeAttribute(user_num);
		mav.setViewName("deleteUser");
		return mav;
	}
	
	@RequestMapping(value="/updateUser.me")
	public ModelAndView updateUser(ModelAndView mav,
			@RequestParam(value="user_num", required=true) String user_num,
			@RequestParam(value="user_name", required=true) String user_name,
			@RequestParam(value="user_email", required=true) String user_email,
			@RequestParam(value="uploadImage", required=false) MultipartFile uploadImage){
		MemberBean bean = memberDao.getKakaoData(user_num);
		bean.setUser_name(user_name);
		bean.setUser_email(user_email);
		if(uploadImage.getOriginalFilename()!="") {
			bean.setUploadImage(uploadImage);
		}
		int cnt = memberDao.updateUser(bean);
		if(cnt==1 && uploadImage.getOriginalFilename()!="") {
			String uploadPath = servletContext.getRealPath("/resources/images");
			File dest = new File(uploadPath+"/"+bean.getUser_image());
			try {
				uploadImage.transferTo(dest);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mav.setViewName("redirect:/main.tm");
		return mav;
	}
	
	@RequestMapping(value="/userInfo.me")
	public ModelAndView userInfo(ModelAndView mav, HttpSession session) {
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		if(bean.getUser_type()==1) {
			mav.setViewName("updateBizUser");
		}
		else {
			mav.setViewName("updateUser");
		}
		mav.addObject("bean", bean);
		return mav;
	}
	
	
}
