package dev.mvc.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.reply.ReplyProc")
public class ReplyProc implements ReplyProcInter {
  @Autowired
  private ReplyDAOInter replyDAO; 
  
  @Override
  public int create(ReplyVO replyVO) {
    int count = replyDAO.create(replyVO);
    return count;
  }

  @Override
  public List<ReplyVO> list() {
    List<ReplyVO> list = replyDAO.list();
    return list;
  }

  @Override
  public List<ReplyVO> list_by_carno(int carno) {
    List<ReplyVO> list = replyDAO.list_by_carno(carno);
    String content = "";
    
    // 특수 문자 변경
    for (ReplyVO replyVO:list) {
      content = replyVO.getContent();
      content = Tool.convertChar(content);
      replyVO.setContent(content);
    }
    return list;
  }

  @Override
  public List<ReplyCustomerVO> list_by_carno_join(int carno) {
    List<ReplyCustomerVO> list = replyDAO.list_by_carno_join(carno);
    String content = "";
    
    // 특수 문자 변경
    for (ReplyCustomerVO replyCustomerVO:list) {
      content = replyCustomerVO.getContent();
      content = Tool.convertChar(content);
      replyCustomerVO.setContent(content);
    }
    return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
    int count = replyDAO.checkPasswd(map);
    return count;
  }

  @Override
  public int delete(int replyno) {
    int count = replyDAO.delete(replyno);
    return count;
  }

  @Override
  public List<ReplyCustomerVO> list_customer_join() {
  List<ReplyCustomerVO> list = replyDAO.list_customer_join();
    
    // 특수 문자 변경
    for (ReplyCustomerVO replyCustomerVO:list) {
      String content = replyCustomerVO.getContent();
      content = Tool.convertChar(content);
      replyCustomerVO.setContent(content);
    }
    
    return list;
  }
   
}