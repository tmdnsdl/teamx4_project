package member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.RestBean;
import member.model.ReviewBean;
import teamx4.paging.Paging;

@Controller
public class ListController {
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value="/reviewlist.me")
	public ModelAndView reviewList(ModelAndView mav, HttpSession session,
			@RequestParam(value="pageNumber", required=false) String pageNumber) {
		
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		
		Paging page = null;
		String url = "/ex/reviewlist.me";
		int totalCount = 0;
		
		String user_review_list = bean.getUser_review_list();
		if(user_review_list!=null) {
			String [] reviewarray = user_review_list.split(",");
			totalCount = reviewarray.length;
			page = new Paging(pageNumber,null,totalCount,url); 
			List<ReviewBean> lists = memberDao.getReviewData(page, reviewarray);
			
			for(int i=0;i<lists.size();i++) {
				ReviewBean review = lists.get(i);
				/*
				 * String reviewImage = review.getReviewImage(); if(reviewImage!=null) { int
				 * imgnum = reviewImage.indexOf("/"); String newReviewImage =
				 * reviewImage.substring(0, imgnum); review.setReviewImage(newReviewImage); }
				 */
				
				RestBean rest = memberDao.getRest(review.getRestNum());
				review.setRestName(rest.getRestName());
				lists.set(i, review);
				
			}
			mav.addObject("lists", lists);
		}
		
		mav.addObject("page", page);
		mav.setViewName("reviewlist");
		return mav;
	}
	
	@RequestMapping(value="/likelist.me")
	public ModelAndView likeList(ModelAndView mav, HttpSession session,
		@RequestParam(value="pageNumber", required=false) String pageNumber) {
		
		String user_num = (String)session.getAttribute("user_num");
		MemberBean bean = memberDao.getKakaoData(user_num);
		
		Paging page = null;
		String url = "/ex/likelist.me";
		int totalCount = 0;
		
		String user_like_list = bean.getUser_like_list();
		System.out.println(user_like_list);
		if(user_like_list!=null) {
			String [] likearray = user_like_list.split(",");
			totalCount = likearray.length;
			page = new Paging(pageNumber,null,totalCount,url);
			List<RestBean> lists = memberDao.getRestData(page, likearray);
			mav.addObject("lists", lists);
		}
		
		mav.addObject("page", page);
		mav.setViewName("likelist");
		return mav;
	}
}
