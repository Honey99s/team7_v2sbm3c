package dev.mvc.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//Controller가 사용하는 이름
@Component("dev.mvc.model.ModelProc")
public class ModelProc implements ModelProcInter {
  @Autowired //ModelDAOInter interface
  private ModelDAOInter modelDAO;
  
  @Override
  public int create(ModelVO modelVO) {
    int cnt = this.modelDAO.create(modelVO);
    return cnt;
  }

  @Override
  public ArrayList<ModelVO> list_all() {
    ArrayList<ModelVO> list = this.modelDAO.list_all();
    return list;
  }

  @Override
  public ModelVO read(int modelno) {
   ModelVO modelVO = this.modelDAO.read(modelno);
    return modelVO;
  }

  @Override
  public int update(ModelVO modelVO) {
    int cnt = this.modelDAO.update(modelVO);
    return cnt;
  }

  @Override
  public int delete(int modelno) {
    int cnt = this.modelDAO.delete(modelno);
    return cnt;
  }

  @Override
  public int update_seqno_forward(int modelno) {
    int cnt = this.modelDAO.update_seqno_forward(modelno);
    return cnt;
  }

  @Override
  public int update_seqno_backward(int modelno) {
    int cnt = this.modelDAO.update_seqno_backward(modelno);
    return cnt;
  }

  @Override
  public int update_visible_y(int modelno) {
    int cnt = this.modelDAO.update_visible_y(modelno);
    return cnt;
  }

  @Override
  public int update_visible_n(int modelno) {
    int cnt = this.modelDAO.update_visible_n(modelno);
    return cnt;
  }

  @Override
  public ArrayList<ModelVO> list_all_y() {
    ArrayList<ModelVO> list = this.modelDAO.list_all_y();
    return list;
  }

}
