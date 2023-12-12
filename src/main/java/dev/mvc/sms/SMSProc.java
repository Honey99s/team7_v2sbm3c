package dev.mvc.sms;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.sms.SMSProc")
public class SMSProc implements SMSProcInter {
  @Autowired
  private SMSDAOInter smsDAO;

  @Override
  public ArrayList<SMSVO> list_all() {
    ArrayList<SMSVO> list = this.smsDAO.list_all();
    return list;
  }



}
