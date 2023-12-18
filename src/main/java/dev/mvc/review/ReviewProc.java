package dev.mvc.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter {
  @Autowired
  private ReviewDAOInter reviewDAO;

  @Override
  public int create(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.create(reviewVO);
    return cnt;
  }

  @Override
  public ArrayList<ReviewVO> list_all() {
    ArrayList<ReviewVO> list = this.reviewDAO.list_all();
    return list;
  }

  @Override
  public ReviewVO read(int reviewno) {
    ReviewVO reviewVO = this.reviewDAO.read(reviewno);
    return reviewVO;
  }

  @Override
  public int update(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.update(reviewVO);
    return cnt;
  }

  @Override
  public int delete(int reviewno) {
    int cnt = this.reviewDAO.delete(reviewno);
    return cnt;
  }
  

}
