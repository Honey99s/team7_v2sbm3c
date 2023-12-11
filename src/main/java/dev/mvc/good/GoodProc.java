package dev.mvc.good;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.good.GoodProc")
public class GoodProc implements GoodProcInter {
  @Autowired
  private GoodDAOInter goodDAO;

  @Override
  public int create(GoodVO goodVO) {
    int cnt = this.goodDAO.create(goodVO);
    return cnt;
  }

  @Override
  public ArrayList<GoodVO> list_all() {
    ArrayList<GoodVO> list = this.goodDAO.list_all();
    return list;
  }

  @Override
  public GoodVO read(int goodno) {
    GoodVO goodVO = this.goodDAO.read(goodno);
    return goodVO;
  }

  @Override
  public int delete(int goodno) {
    int cnt = this.goodDAO.delete(goodno);
    return cnt;
  }

}
