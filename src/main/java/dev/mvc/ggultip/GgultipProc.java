package dev.mvc.ggultip;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.ggultip.GgultipProc")
public class GgultipProc implements GgultipProcInter {
  @Autowired
  private GgultipDAOInter ggultipDAO;

  @Override
  public int create(GgultipVO ggultipVO) {
    int cnt = this.ggultipDAO.create(ggultipVO);
    return cnt;
  }

  @Override
  public ArrayList<GgultipVO> list_all() {
    ArrayList<GgultipVO> list = this.ggultipDAO.list_all();
    return list;
  }

  @Override
  public GgultipVO read(int ggultipno) {
    GgultipVO ggultipVO = this.ggultipDAO.read(ggultipno);
    return ggultipVO;
  }

  @Override
  public int update(GgultipVO ggultipVO) {
    int cnt = this.ggultipDAO.update(ggultipVO);
    return cnt;
  }

  @Override
  public int delete(int ggultipno) {
    int cnt = this.ggultipDAO.delete(ggultipno);
    return cnt;
  }
  

}
