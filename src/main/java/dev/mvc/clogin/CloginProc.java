package dev.mvc.clogin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.clogin.CloginProc")
public class CloginProc implements CloginProcInter {
  @Autowired
  private CloginDAOInter cloginDAO;
  
  @Override
  public int create(CloginVO cloginVO) {
    int cnt = this.cloginDAO.create(cloginVO);
    return cnt;
  }
  
  @Override
  public ArrayList<CloginVO> list_all() {
    ArrayList<CloginVO> list = this.cloginDAO.list_all();
    return list;
  }
  
  @Override
  public CloginVO read(int cloginno) {
    CloginVO cloginVO = this.cloginDAO.read(cloginno);
    return cloginVO;
  }

  @Override
  public int delete(int cloginno) {
    int cnt = this.cloginDAO.delete(cloginno);
    return cnt;
  }

  @Override
  public int delete1(int customerno) {
    int cnt = this.cloginDAO.delete(customerno);
    return cnt;
  }
}
