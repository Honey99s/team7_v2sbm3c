package dev.mvc.condition;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.condition.ConditionProc")
public class ConditionProc implements ConditionProcInter {
  @Autowired
  private ConditionDAOInter conditionDAO;

  @Override
  public int create(ConditionVO conditionVO) {
    int cnt = this.conditionDAO.create(conditionVO);
    return cnt;
  }

  @Override
  public ArrayList<ConditionVO> list_all() {
    ArrayList<ConditionVO> list = this.conditionDAO.list_all();
    return list;
  }

  @Override
  public ConditionVO read(int conditionno) {
    ConditionVO conditionVO = this.conditionDAO.read(conditionno);
    return conditionVO;
  }

  @Override
  public int update(ConditionVO conditionVO) {
    int cnt = this.conditionDAO.update(conditionVO);
    return cnt;
  }

  @Override
  public int delete(int conditionno) {
    int cnt = this.conditionDAO.delete(conditionno);
    return cnt;
  }
  

}
