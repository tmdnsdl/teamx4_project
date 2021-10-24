package member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class BizUserController {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value="/addBizUser.me")
	public ModelAndView checkBizUser(ModelAndView mav, HttpSession session) {
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		if(bean.getUser_type()==1) {
			mav.setViewName("redirect:/main.tm");
		}
		else {
			mav.setViewName("addBizUser");
		}
		return mav;
	}
	
	@RequestMapping(value="/insertBizUser.me", method=RequestMethod.POST)
	public ModelAndView insertBizUser(ModelAndView mav, HttpSession session,
			@RequestParam(value="uploadFile") MultipartFile uploadFile,
			@RequestParam(value="name") String name,
			@RequestParam(value="addr") String addr,
			@RequestParam(value="tel") String tel) {
		
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		bean.setUploadFile(uploadFile);
		bean.setUser_diningName(name);
		bean.setUser_diningAddr(addr);
		bean.setUser_diningHp(tel);
		bean.setUser_type(1);
		
		int cnt = memberDao.updateData(bean);
		
		if(cnt==1) {
			String uploadPath = servletContext.getRealPath("/resources/images");
			File dest = new File(uploadPath+"/"+bean.getUser_diningReg());
			
			try {
				uploadFile.transferTo(dest);
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
	
	@RequestMapping(value="/updateBizUser.me")
	public ModelAndView updateBizUser(ModelAndView mav,
			@RequestParam(value="user_num", required=true) String user_num,
			@RequestParam(value="user_name", required=true) String user_name,
			@RequestParam(value="user_email", required=true) String user_email,
			@RequestParam(value="uploadImage", required=false) MultipartFile uploadImage,
			@RequestParam(value="user_diningName", required=true) String user_diningName,
			@RequestParam(value="user_diningAddr", required=true) String user_diningAddr,
			@RequestParam(value="user_diningHp", required=true) String user_diningHp,
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile){
		MemberBean bean = memberDao.getKakaoData(user_num);
		bean.setUser_name(user_name);
		bean.setUser_email(user_email);
		if(uploadFile.getOriginalFilename()!="") {
			bean.setUploadFile(uploadFile);
		}
		bean.setUser_diningName(user_diningName);
		bean.setUser_diningAddr(user_diningAddr);
		bean.setUser_diningHp(user_diningHp);
		if(uploadFile.getOriginalFilename()!="") {
			bean.setUploadFile(uploadFile);
		}
		int cnt = memberDao.updateBizUser(bean);
		if(cnt==1 && uploadFile.getOriginalFilename()!="") {
			String uploadPath = servletContext.getRealPath("/resources/images");
			File dest = new File(uploadPath+"/"+bean.getUser_diningReg());
			try {
				uploadFile.transferTo(dest);
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
	
}
