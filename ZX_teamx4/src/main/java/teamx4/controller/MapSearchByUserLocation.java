 package teamx4.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import teamx4.model.teamx4Bean;

@Controller
public class MapSearchByUserLocation {
	
	private final String command = "/goSearchmap.tm";
	private final String getPage = "maplist";
	@Autowired
	private  teamx4.model.teamx4Dao teamx4Dao;
	
	@RequestMapping(value=command ,method =RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav,
							@RequestParam(value = "whatColumn" ,required = true) String whatColumn,
							@RequestParam(value = "goSearchWord",required = true)String goSearchWord) {
		Map<String, String> map =  new HashMap<String, String>();
		map.put("whatColumn",whatColumn);
		map.put("goSearchWord", "%"+goSearchWord+"%");
		System.out.println(goSearchWord);
		System.out.println(whatColumn);
		
		List<teamx4Bean> lists=teamx4Dao.selectByMapSearchWord(map);
		mav.addObject("lists", lists);
		System.out.println("selectByMapSearchWord"+ lists.size());
		mav.setViewName(getPage);
		return mav;
	
	}
	
	
}
