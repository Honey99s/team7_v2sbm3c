package dev.mvc.recommend;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.recommend.RecommendProc")
public class RecommendProc implements RecommendProcInter {
  @Autowired
  private RecommendDAOInter recommendDAO;

  @Override
  public int create(RecommendVO recommendVO) {
    int cnt = this.recommendDAO.create(recommendVO);
    return cnt;
  }

  @Override
  public ArrayList<RecommendVO> list_all() {
    ArrayList<RecommendVO> list = this.recommendDAO.list_all();
    return list;
  }

  @Override
  public RecommendVO read(int recommendno) {
    RecommendVO recommendVO = this.recommendDAO.read(recommendno);
    return recommendVO;
  }
  
  @Override
  public RecommendVO read_by_customerno(int customerno) {
    RecommendVO recommendVO = this.recommendDAO.read_by_customerno(customerno);
    return recommendVO;
  }
  
  @Override
  public int delete(int recommendno) {
    int cnt = this.recommendDAO.delete(recommendno);
    return cnt;
  }


}
