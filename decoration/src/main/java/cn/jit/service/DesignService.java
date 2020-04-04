package cn.jit.service;

import cn.jit.dao.DesignDao;
import cn.jit.po.Design;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DesignService {
    @Autowired
    private DesignDao designDao;

    @Transactional
    public int addDesign(Design design){return designDao.addDesign(design);};

    @Transactional
    public int updateDesign(Design design){return designDao.updateDesign(design);};


    @Transactional
    public Design queryDesignByClientId(Integer clientId){return designDao.queryDesignByClientId(clientId);};
}
