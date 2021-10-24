package teamx4.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import teamx4.model.teamx4Bean;

@Controller
public class cateKeyMapListController {
 
	private final String command = "/cartegorymore.tm";
	private final String gotoPage = "redirect:/mapDB.tm";
	private final String getPage = "maplist";

	@Autowired
	private  teamx4.model.teamx4Dao teamx4Dao;
	// 더보기 클릭시 요청 들어옴 
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "mapinputaddr",required = false)String mapinputaddr) {
		System.out.println("1단계 : "+ command+"요청 들어옴");
		Map<String, String> map =  new HashMap<String, String>();
		map.put("inputaddr", "%"+mapinputaddr+"%");
		ModelAndView  mav = new ModelAndView();
		System.out.println(mapinputaddr);
		List<teamx4Bean> lists=teamx4Dao.selectByInputArr(map);
		mav.addObject("lists", lists);
		System.out.println(lists.size());
		mav.setViewName(getPage);
		return mav;
	
	}
	
	
}
