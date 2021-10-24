package teamx4.controller;

import java.util.ArrayList;
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

import teamx4.model.reviewsBean;
import teamx4.model.teamx4Bean;

@Controller
public class MapSearchController {
	
	private final String command = "/goSearchByUserLocation.tm";
	private final String getPage = "mainhome";
	private final String gotoPage = "";
	@Autowired
	private  teamx4.model.teamx4Dao teamx4Dao;
	
	 String []korean = {"고등어구이","오징어볶음","고기집","소갈비찜",
			 "된장찌개","보쌈","고기국수","김치찌개","계란말이","쌀국수","갈비",
			 "비빔국수","초계국수","칼국수","닭한마리","닭곰탕","김밥","수제비"
			 ,"계란찜","해장국","국수","비빔밥","제육볶음","불고기","양념갈비","막걸리",
			  "해물파전","닭도리탕","찜닭","육개장","감자전","족발","쌈밥","순대국","수육국밥",
			 "닭갈비","한정식","백반","떡볶이","차돌박이","낙지","아구찜","냉면","곰탕"
			  ,"육회","한식","막국수","병어조림","남도음식","포장마차","삼계탕","바베큐","순대",
			  "감자탕","추어탕","빈대떡"};
			  
			  String[] chinese = {"꿔바로우","도삭면","중식당","중식","짜장면","짬뽕","탕수육","유린기",
			  "양장피","팔보채","칠리새우","간짜장","마라샹궈","마라탕","양꼬치","훠궈","완탕","라조기","딤섬","볶음밥","중화요리","사천꿔바로우 R/사천해물짜장도삭면/"
			  };
			  
			  String[] italic = {"스파게티","라자냐","파스타","크림파스타","리조토","피자","필라프","샹그리아",
			  "뇨끼","아란치니"};
			  
			  String[] mexican = {"타코","멕시칸","멕시코","퀘사디아","부리또"};
			  
			  String[] cafes = {"파이","까페","밀크티","커피","아메리카노","라떼","와플","샌드위치","아메리카노",
			  "베이글","베이커리","마카롱","스콘","디저트","cafe","루프탑","다방","원두","케이크","팥빙수","빙수","오리지날 벨기에 와플/젤라또 와플/후르츠 젤라또 와플/오레오 밀크 쉐이크/아메리카노/에스프레소/카페라떼/카푸치노/"};
			  
			  String[] japanese = {"스시","연어","광어","일본","야끼","초밥","사케동","돈부리",
			  "꼬동","돈까스","야끼","부타동","덮밥","일식당","일식","사시미","라멘"};
	
	@RequestMapping(value=command ,method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav,
							@RequestParam(value = "inputaddr",required = true)String inputaddr) {
		System.out.println(command +"�슂泥�");
		Map<String, String> map =  new HashMap<String, String>();
		map.put("inputaddr", "%"+inputaddr+"%");
		System.out.println(inputaddr);
		List<reviewsBean> reviewslists=teamx4Dao.selectAllreviews();
		List<teamx4Bean> lists=teamx4Dao.selectByInputArr(map);
		List<teamx4Bean> korean_lists = new ArrayList<teamx4Bean>();
		List<teamx4Bean> chinese_lists = new ArrayList<teamx4Bean>();
		List<teamx4Bean> italic_lists = new ArrayList<teamx4Bean>();
		List<teamx4Bean> cafes_lists = new ArrayList<teamx4Bean>();
		
		for(int i =0;i<lists.size();i++) {
			for(int j =0;j<korean.length;j++) {
				if (lists.get(i).getRestMenu() == null) {
					break;
				}
				else if(lists.get(i).getRestMenu().contains(korean[j])) {
					korean_lists.add(lists.get(i));	
					break;
				}
				
			}
		}
		mav.addObject("korean_lists" ,korean_lists);
		System.out.println("koreanArr:"+korean.length);
		System.out.println("korean_lists:"+korean_lists.size());
		//////// korean ---- end ------ 
		
		
		for(int i =0;i<lists.size();i++) {
			for(int j =0;j<chinese.length;j++) {
				if (lists.get(i).getRestMenu() == null) {
					break;
				}
				else if(lists.get(i).getRestMenu().contains( chinese[j])) {
					chinese_lists.add(lists.get(i));	
					break;
				}
				
			}
		}//for(list.size()
		mav.addObject("chinese_lists" ,chinese_lists);
		System.out.println("chineseArr:"+chinese.length);
		System.out.println("chinese_lists:"+chinese_lists.size());
	
		//////////chinese ---end---
		
		
		for(int i =0;i<lists.size();i++) {
			for(int j =0;j<italic.length;j++) {
				if (lists.get(i).getRestMenu() == null) {
					break;
				}
				else if(lists.get(i).getRestMenu().contains( italic[j])) {
					italic_lists.add(lists.get(i));	
					break;
				}
			}
		}//for(list.size()
		mav.addObject("italic_lists" ,italic_lists);
		System.out.println("italicArr:"+italic.length);
		System.out.println("italic_lists:"+italic_lists.size());
		
		///// italic ==== end ====
		
		for(int i =0;i<lists.size();i++) {
			for(int j =0;j<cafes.length;j++) {
				if (lists.get(i).getRestMenu() == null) {
					break;
				}
				else if(lists.get(i).getRestMenu().contains( cafes[j])) {
					cafes_lists.add(lists.get(i));	
					break;
				}
			}
		}//for(list.size()
		mav.addObject("cafes_lists" ,cafes_lists);
		System.out.println("cafesArr:"+cafes.length);
		System.out.println("cafes_lists:"+cafes_lists.size());
		///// cafes ==== end ====
		
		mav.addObject("reviewslists" ,reviewslists);
		mav.addObject("lists", lists);
		System.out.println("selectByInputArr"+ lists.size());
		System.out.println("reviewslists"+reviewslists.size());
		mav.setViewName(getPage);
		return mav;
	
	}
	
	
}
