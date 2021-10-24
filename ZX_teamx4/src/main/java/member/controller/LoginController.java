package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login.me")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value="/logout.me")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.removeAttribute("user_num");
		mav.setViewName("logout");
		return mav;
	}
}
