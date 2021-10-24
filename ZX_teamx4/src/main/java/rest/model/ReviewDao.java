package rest.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("reviewDao")
public class ReviewDao {

	private String namespace = "rest.model.ReviewBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<ReviewDetailBean> selectReview(int restnum) {
		
		
		List<ReviewDetailBean> arr = new ArrayList<ReviewDetailBean>();
		arr = sqlSessionTemplate.selectList(namespace+".selectReview", restnum);
		return arr;
	}


	public int reviewCount(int restnum) {
		int total = sqlSessionTemplate.selectOne(namespace+".total", restnum);
		return total;
	}


	public int userReviewCount(String string) {
		
		int cnt = sqlSessionTemplate.selectOne(namespace+".userReviewCount",string);
		return cnt;
	}



	




	
}
