package member.model;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import teamx4.paging.Paging;

@Component("memberDao")
public class MemberDao {
	private final String namespace="member.model.teamx4_member.";
	private int count=-1;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertData(MemberBean bean) {
		count = sqlSessionTemplate.insert(namespace+"insertData", bean);
		return count;
	}
	
	public int updateData(MemberBean bean) {
		count = sqlSessionTemplate.update(namespace+"updateData", bean);
		return count;
	}
	
	public int updateUser(MemberBean bean) {
		count = sqlSessionTemplate.update(namespace+"updateUser", bean);
		return count;
	}
	
	public int updateBizUser(MemberBean bean) {
		count = sqlSessionTemplate.update(namespace+"updateBizUser", bean);
		return count;
	}

	public MemberBean getKakaoData(String user_num) {
		MemberBean bean = sqlSessionTemplate.selectOne(namespace+"getKakaoData", user_num);
		return bean;
	}
	
	public List<RestBean> getRestData(Paging page, String [] likearray) {
		RowBounds rowbounds = new RowBounds(page.getOffset(), page.getLimit());
		List<RestBean> lists = sqlSessionTemplate.selectList(namespace+"getRestData", likearray, rowbounds);
		return lists;
	}
	
	public List<ReviewBean> getReviewData(Paging page, String [] reviewarray) {
		RowBounds rowbounds = new RowBounds(page.getOffset(), page.getLimit());
		List<ReviewBean> lists = sqlSessionTemplate.selectList(namespace+"getReviewData", reviewarray, rowbounds);
		return lists;
	}
	
	public ReviewBean getReview(String reviewNum) {
		ReviewBean bean = sqlSessionTemplate.selectOne(namespace+"getReview", reviewNum);
		return bean;
	}
	
	public int updateLikelist(MemberBean bean) {
		count = sqlSessionTemplate.update(namespace+"updateLikelist", bean);
		return count;
	}
	
	public int updateReviewlist(MemberBean bean) {
		count = sqlSessionTemplate.update(namespace+"updateReviewlist", bean);
		return count;
	}
	
	public int deleteData(String user_num) {
		count = sqlSessionTemplate.delete(namespace+"deleteData", user_num);
		return count;
	}
	
	public int deleteReviewData(String reviewNum) {
		count = sqlSessionTemplate.delete(namespace+"deleteReviewData", reviewNum);
		return count;
	}

	public RestBean getRest(int restNum) {
		RestBean bean = sqlSessionTemplate.selectOne(namespace+"getRest", restNum);
		return bean;
	}
}
