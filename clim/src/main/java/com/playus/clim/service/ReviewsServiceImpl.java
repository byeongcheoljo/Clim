package com.playus.clim.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playus.clim.dao.LikesDAO;
import com.playus.clim.dao.ReportsDAO;
import com.playus.clim.dao.ReviewsDAO;
import com.playus.clim.dao.SurveysDAO;
import com.playus.clim.util.PaginateUtil;
import com.playus.clim.vo.Like;
import com.playus.clim.vo.PageVO;
import com.playus.clim.vo.Report;
import com.playus.clim.vo.Review;

@Service
public class ReviewsServiceImpl implements ReviewsService{
	/* 0802 홍성표 */
	@Autowired
	private ReviewsDAO reviewsDAO;
	@Autowired
	private PaginateUtil paginateUtil;
	@Autowired
	private SurveysDAO surveysDAO;
	@Autowired
	private ReportsDAO reportsDAO;
	@Autowired
	private LikesDAO likesDAO;
	
	@Override
	public Map<String, Object> getMyReviews(int memberNo, int page) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(page, 10, memberNo);
		
		int total = reviewsDAO.myWriteReviewsTotal(memberNo);
		
		map.put("reviews", reviewsDAO.myWriteReviewsList(pageVO));
		map.put("paginate", paginateUtil.getPaginate(page, total, 10, 5, "/ajax/member"+memberNo+"reviews"));
		
		return map;
	}
	//재현
		@Override
		public Map<String, Object> getReviewList(int movieNo, int page, Report report, Like like) {
			// TODO Auto-generated method stub
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			
			PageVO pageVO = new PageVO(page, 5, movieNo);
			
			int total =reviewsDAO.getReviewTotalList(movieNo);
			
			List<Review> reviews = reviewsDAO.getReviewList(pageVO);
			
			for (Review review: reviews) {
				report.setPostNo(review.getNo());
				report.setReporterNo(review.getMemberNo());
				report.setType('S');
				review.setCheckSpoiler(0 < reportsDAO.checkSpoiler(report));
				
				like.setPostNo(review.getNo());
				like.setMemberNo(review.getMemberNo());
				like.setType('M');
				like.setEmotion('L');
				review.setLike(likesDAO.countLike(like));
				review.setCheckLike(0 < likesDAO.checkLike(like));
				
				like.setPostNo(review.getNo());
				like.setMemberNo(review.getMemberNo());
				like.setType('M');
				like.setEmotion('D');
				review.setDislike(likesDAO.countDisLike(like));
				review.setCheckDisLike(0 < likesDAO.checkLike(like));
			}
			
			map.put("reviews", reviews);
			map.put("paginate", paginateUtil.getPaginate(page, total, 5, 5, "/ajax/movie/"+movieNo+"/review"));
			
			return map;
		}
		
		@Override
		public Map<String, Object> registerReview(Review review) {
			// TODO Auto-generated method stub
			
			surveysDAO.deleteSurvey(review);
			
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			
			map.put("review", reviewsDAO.registerReview(review));
			
			return map;
		}
		@Override
		public int deleteMyReview(int no) {
			// TODO Auto-generated method stub
			return reviewsDAO.deleteMyReview(no);
		}

}
