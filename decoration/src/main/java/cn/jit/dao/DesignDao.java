package cn.jit.dao;
import cn.jit.po.Design;

public interface DesignDao {
    public int addDesign(Design design);
    public int updateDesign(Design design);
    public Design queryDesignByClientId(Integer clientId);
}
