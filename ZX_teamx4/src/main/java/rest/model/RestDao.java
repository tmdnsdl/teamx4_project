package rest.model;



import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




@Component("restDao")
public class RestDao {

	
	private String namespace = "rest.model.RestBean";
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	

	public RestBean selectData(int i) {
		
		RestBean db = sqlSessionTemplate.selectOne(namespace+".selectData",i);
		
		return db;
		
	}



	public UserBean findLikeList(String usernum) {
		UserBean ub = sqlSessionTemplate.selectOne(namespace+".findLikeList",usernum);
		return ub;
		
	}
	
	public void addLikelist(Map<String, String> map) {
		
		sqlSessionTemplate.update(namespace+".addlikelist",map);
		
	}



	public void addlikelist2(Map<String, String> map) {
		
		sqlSessionTemplate.update(namespace+".addlikelist2",map);
		
	}



	public void addLikeCount(String restnum) {
		
		sqlSessionTemplate.update(namespace+".addLikeCount",restnum);
	}



	public void subLikeCount(String restnum) {
		sqlSessionTemplate.update(namespace+".subLikeCount",restnum);
		
	}



	public int countrestlike(String restnum) {
		
		int cnt =sqlSessionTemplate.selectOne(namespace+".countrestlike",restnum);
		return cnt;
	}


	public UserBean reviewUserInfo(String usernum) {
		
		UserBean ub = sqlSessionTemplate.selectOne(namespace+".reviewUserInfo",usernum);
		return ub;
	}
	



	

}
