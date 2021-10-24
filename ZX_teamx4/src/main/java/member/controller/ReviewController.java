package member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDao;
import member.model.RestBean;
import member.model.ReviewBean;

@Controller
public class ReviewController {
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value="/updateReviewForm.me")
	public ModelAndView updateReviewForm(ModelAndView mav,
			@RequestParam(value="reviewNum", required=true) String reviewNum) {
		
		ReviewBean review = memberDao.getReview(reviewNum); 
		RestBean rest = memberDao.getRest(review.getRestNum());
		
		mav.addObject("review", review);
		mav.addObject("rest", rest);
		mav.setViewName("updateReviewForm");
		return mav;
	}
}
