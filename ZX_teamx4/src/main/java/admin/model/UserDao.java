package admin.model;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import rest.model.RestBean;
import utility.Paging;



@Component("userDao")
public class UserDao {

	private String namespace = "admin.model.UserBean";
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserBean> selectUser(Map<String, String> map, Paging pg) {
		
		RowBounds rb = new RowBounds(pg.getOffset(),pg.getLimit());
		
		List<UserBean> ub = sqlSessionTemplate.selectList(namespace+".userInfo",map,rb);
		return ub;
	}

	public int TotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".userCount",map);
		return cnt;
	}

	public int TotalCountbusiness(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".businessCount",map);
		return cnt;
	}

	public List<UserBean> selectbusiness(Map<String, String> map, Paging pg) {
		RowBounds rb = new RowBounds(pg.getOffset(),pg.getLimit());
		
		List<UserBean> ub = sqlSessionTemplate.selectList(namespace+".businessInfo",map,rb);
		return ub;
	}
	
	public List<RestBean> selectRest(Map<String, String> map, Paging pg) {
		RowBounds rb = new RowBounds(pg.getOffset(),pg.getLimit());
		List<RestBean> ub = sqlSessionTemplate.selectList(namespace+".selectRest",map,rb);
		return ub;
	}

	public int TotalCountRest(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".TotalCountRest",map);
		return cnt;
	}

	public int TotalCountReview(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".TotalCountReview",map);
		return cnt;
	}

	public List<AdminReviewBean> selectReview(Map<String, String> map, Paging pg) {
		RowBounds rb = new RowBounds(pg.getOffset(),pg.getLimit());
		List<AdminReviewBean> ub = sqlSessionTemplate.selectList(namespace+".selectReview",map,rb);
		return ub;
	}

	public void deleteUser(String usernum) {
		sqlSessionTemplate.delete(namespace+".deleteUser",usernum);
		
	}

	public void deleteRest(int restnum) {
		sqlSessionTemplate.delete(namespace+".deleteRest",restnum);
		
	}

	public void deleteReview(int reviewnum) {
		sqlSessionTemplate.delete(namespace+".deleteReview",reviewnum);
		
	}

	public RestBean updateRest(int restnum) {
		
		RestBean rb = sqlSessionTemplate.selectOne(namespace+".updateRest",restnum);
		return rb;
	}

	public void updateRestFinal(RestBean arb) {
		
		
		sqlSessionTemplate.update(namespace+".updateRestFinal",arb);
	}

	public void deleteReviewByUser(String usernum) {
		sqlSessionTemplate.delete(namespace+".deleteReviewByUser",usernum);
		
	}
	
	
	
}
