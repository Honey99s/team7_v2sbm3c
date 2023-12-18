package dev.mvc.sms;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.sms.SmsProc")
public class SmsProc implements SmsProcInter {
  @Autowired
  private SmsDAOInter smsDAO;

  @Override
  public ArrayList<SmsVO> list_all() {
    ArrayList<SmsVO> list = this.smsDAO.list_all();
    return list;
  }
  
  @Override
  public SmsVO read(int loginno) {
    SmsVO smsVO = this.smsDAO.read(loginno);
    return smsVO;
  }

  @Override
  public int delete(int loginno) {
    int cnt = this.smsDAO.delete(loginno);
    return cnt;
  }

}
