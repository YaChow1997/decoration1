package cn.jit.service;

import cn.jit.dao.ClientDao;
import cn.jit.po.Client;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ClientService {
    @Autowired
    private ClientDao clientDao;

    /**
     * 添加客户
     * @param client
     * @return
     */
    @Transactional
    public Client addClinet(Client client){
        clientDao.addClient(client);
        return client;
    }


    /**
     * 更新客户信息
     * @param client
     * @return
     */
    @Transactional
    public int updateClient(Client client){
        return clientDao.updateClient(client);
    }
    public Client queryClientByUserId(Integer userId){
        return clientDao.queryClientByUserId(userId);
    }

    /**
     * 查询客户信息
     * @param params
     * @return
     */
    public Map<String, Object> queryClients(Map<String,Object> params){
        Integer pageNumber=(Integer) params.get("pageNumber");
        Integer pageSize=(Integer) params.get("pageSize");
        params.put("isDelete","0");
        PageHelper.startPage(pageNumber,pageSize);
        List<Client> ClientList=clientDao.queryClients(params);
        PageInfo pageInfo=new PageInfo(ClientList);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("size",pageInfo.getSize());
        map.put("data",ClientList);
        return map;
    }
}
