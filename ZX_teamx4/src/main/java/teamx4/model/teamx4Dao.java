package teamx4.model;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import rest.model.ReviewBean;

@Component("teamx4Dao")
public class teamx4Dao {

	String namespace = "teamx4.teamx4Bean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertAllData(List<teamx4Bean> list) {
		
		int cnt = sqlSessionTemplate.insert(namespace + ".insertAllData", list);
		System.out.println("cnt: " + cnt);
		return cnt;
		
	}
	public List<reviewsBean> selectAllreviews() {
		List<reviewsBean> reviewslists = new ArrayList<reviewsBean>();
		reviewslists = sqlSessionTemplate.selectList(namespace+".selectAllreviews");
		System.out.println("selectAllreviews:" + reviewslists.size());
		return reviewslists;
		
	}
	public List<teamx4Bean> selectAllrest() {
		List<teamx4Bean> lists = new ArrayList<teamx4Bean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectAllrest");
		System.out.println("selectAllrest:" + lists.size());
		return lists;
		
	}
	
	public List<teamx4Bean> selectByInputArr(Map<String, String> map) {
		List<teamx4Bean> lists = new ArrayList<teamx4Bean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectByInputArr",map);
		System.out.println("selectByInputArr:" + lists.size());
		return lists;
		
	}
	
	public List<teamx4Bean> selectByMapSearchWord(Map<String, String> map) {
		List<teamx4Bean> lists = new ArrayList<teamx4Bean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectByMapSearchWord",map);
		System.out.println("selectByMapSearchWord:" + lists.size());
		return lists;
		
	}
	
public CrawlingBean getRestaurant(int restNum) {
		
		CrawlingBean cb = sqlSessionTemplate.selectOne(namespace + ".getRestaurant", restNum);
		return cb;
	}

	public int insertReview(ReviewBean rb) {

		int cnt = sqlSessionTemplate.insert(namespace + ".insertReview", rb);
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	public ReviewBean getReview(int reviewNum) {
		
		ReviewBean rb = sqlSessionTemplate.selectOne(namespace + ".getReview", reviewNum);
		return rb;
	}
	
	public ReviewBean getReview(UserBean ub) {
		ReviewBean rb = sqlSessionTemplate.selectOne(namespace + ".getReview2", ub);
		return rb;
	}

	public int updateReview(ReviewBean rb) {
		
		int cnt = sqlSessionTemplate.update(namespace + ".updateReview", rb);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	public int deleteReview(int reviewnum) {
		
		int cnt = sqlSessionTemplate.delete(namespace + ".deleteReview", reviewnum);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	public UserBean selectUser(String user_name) {
		
		UserBean ub = sqlSessionTemplate.selectOne(namespace+".selectUser", user_name);
		return ub;
		
	}
	
	public UserBean selectUser2(String user_num) {
		
		UserBean ub = sqlSessionTemplate.selectOne(namespace+".selectUser2", user_num);
		return ub;
		
	}
	
	public int updateUser(UserBean ub) {
		int cnt =sqlSessionTemplate.update(namespace+".updateUser", ub);
		return cnt;
	}
	
	

}