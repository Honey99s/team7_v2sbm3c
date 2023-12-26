package dev.mvc.reply;

import java.util.List;
import java.util.Map;

public interface ReplyProcInter {
  /**
   * 등록
   * @param replyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  public List<ReplyVO> list();
  
  public List<ReplyVO> list_by_carno(int carno);
  
  public List<ReplyCustomerVO> list_by_carno_join(int carno);
  
  public List<ReplyCustomerVO> list_customer_join();
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int replyno);
  
}