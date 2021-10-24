package rest.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import rest.model.BlogBean;
import rest.model.BlogDao;
import rest.model.RestBean;
import rest.model.RestDao;
import rest.model.ReviewDao;
import rest.model.ReviewDetailBean;
import rest.model.ReviewScoreBean;
import rest.model.UserBean;



@Controller
public class RestController {

	private final String command = "/detail.rest";
	
	@Autowired
	RestDao ddao;
	
	@Autowired
	ReviewDao rdao;
	
	@Autowired
	BlogDao bdao;
	
	
	@RequestMapping(value=command)
	public ModelAndView selectDetail(HttpSession session,
									@RequestParam(value="restnum") int restnum) {
		
		System.out.println("restnum" + restnum);
		RestBean db =ddao.selectData(restnum);
		// image 파일을 하나씩 불러오는 작업
		String [] viewImage = db.getRestimg().split(",");  //  /로구별중
		
		
		UserBean ub = ddao.findLikeList("@k1922914339");
		int checkLikeList = 0;
		if(ub!=null) {
		String [] userlikes = ub.getUser_like_list().split(",");
		boolean chk = false;
		
		for(int i=0;i<userlikes.length;i++) {
			System.out.println(userlikes[i]);
			if( userlikes[i].equals(String.valueOf(restnum)) ) {
				checkLikeList = 1;
			}
			
			
		}
		
		}
		List<ReviewDetailBean> rv = rdao.selectReview(db.getRestNum());
		int reviewCount = rdao.reviewCount(db.getRestNum());
		int avgStar =0;
		int avgPrice =0;
		int avgService=0;
		int avgTaste =0;
		int userReviewCount=0;
		ReviewScoreBean  res = new ReviewScoreBean();
		
		System.out.println("rvsize:"+rv.size());
		if(rv.size()!=0) {
		
		for(int i=0;i<rv.size();i++) {
			
			userReviewCount = rdao.userReviewCount(rv.get(i).getUsernum());
			
			rv.get(i).setUserreviewcount(userReviewCount);
			avgStar += rv.get(i).getReviewstar();
			avgPrice += rv.get(i).getReviewprice();
			avgTaste += rv.get(i).getReviewtaste();
			avgService += rv.get(i).getReviewservice();
			UserBean cb = ddao.reviewUserInfo(rv.get(i).getUsernum());
			//	System.out.println(cb.getUser_name());
			
			rv.get(i).setUsername(cb.getUser_name());
			
		}
	
		res = new ReviewScoreBean((avgStar/reviewCount),(avgPrice/reviewCount),(avgTaste/reviewCount),(avgService/reviewCount));
		}
		ModelAndView mav = new ModelAndView();
		
		String clientId = "pE3wgWDVLSb_IaO6KBkq"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "NXH6oRYwvW"; //애플리케이션 클라이언트 시크릿값"

        
        String text = null;
        try {
            text = URLEncoder.encode(db.getRestname(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과


        Map<String, String> requestHeaders = new HashMap<String,String>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = bdao.get(apiURL,requestHeaders);
         
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject ;
        JSONArray infoArray =null;
        ArrayList<BlogBean> abb = new ArrayList<BlogBean>();
        BlogBean bb;
      
        try {
 			jsonObject = (JSONObject) jsonParser.parse(responseBody);
 			infoArray = (JSONArray) jsonObject.get("items");
 		} catch (ParseException e) {
 			e.printStackTrace();
 		}
        try {
            for(int i = 0; i < infoArray.size();  i++) {
                JSONObject itemObject = (JSONObject) infoArray.get(i);
                
                String bloggername = (String) itemObject.get("bloggername");
                String postdate = (String) itemObject.get("postdate");
                String bloggerlink = (String) itemObject.get("bloggerlink");
                String title = (String) itemObject.get("title");
                String description = (String) itemObject.get("description");
                String link = (String) itemObject.get("link");
                bb = new rest.model.BlogBean(bloggername,postdate,bloggerlink,title,description,link);
                abb.add(bb);
            }
    		}catch (NullPointerException e) {
    			System.out.println("NullPointerException 발생");
              
    		}
        
        String user_num = (String)session.getAttribute("user_num");
        mav.addObject("checkLikeList",checkLikeList);
        mav.addObject("user_num",user_num);
        mav.addObject("res",res);
        mav.addObject("reviewCount",reviewCount);
        mav.addObject("abb",abb);
		mav.addObject("rv",rv);
		mav.addObject("viewImage",viewImage);
		mav.addObject("db",db);
		mav.setViewName("detail");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value ="like.rest",method = RequestMethod.GET)
	public Map<String, Integer> likelist(@RequestParam String usernum,
						 @RequestParam String restnum,
						 HttpSession session) {	
		
		System.out.println(usernum);
		UserBean ub = ddao.findLikeList(usernum);
		int cnt = 0;
		Map<String,Integer> total = new HashMap<String,Integer>();
		
		
		Map<String,String> map = new HashMap<String,String>();
		String comparelikelist ="";
		int flag = 0;
		
		if(ub==null) {
			map.put("compaerelikelist", restnum);
			ddao.addlikelist2(map);
		}
		else {
		String[]likelist = ub.getUser_like_list().split(",");
		
		for(int i=0;i<likelist.length;i++) {
			
			if(String.valueOf(restnum).equals(likelist[i])) {
				flag = 1;
				
				
			}
			else {
				
				if(i == likelist.length-1) {
					comparelikelist += likelist[i];
				}
				else {
					comparelikelist += likelist[i]+",";
				}
			}
		}
		
		}
		System.out.println("flag: "+flag);
		if(flag==1) {
			map.put("comparelikelist", comparelikelist);
			map.put("usernum", usernum);
			ddao.subLikeCount(restnum);
			ddao.addlikelist2(map);
		}
		else {
			comparelikelist += ","+restnum;
			map.put("comparelikelist", comparelikelist);
			map.put("usernum",usernum);
			ddao.addLikeCount(restnum);
			ddao.addlikelist2(map);
		}

		
		
			cnt = ddao.countrestlike(restnum);
			total.put("flag", flag);
			total.put("cnt", cnt);
			
			return total;
		}
		
		
		
		
		
	
	
}
