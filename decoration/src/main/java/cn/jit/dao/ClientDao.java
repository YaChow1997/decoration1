package cn.jit.dao;

import cn.jit.po.Client;

import java.util.List;
import java.util.Map;

public interface ClientDao {
    public int addClient(Client client);

    public int updateClient(Client client);
    public Client queryClientByUserId(Integer userId);

    public List<Client> queryClients(Map<String, Object> params);
    public Client queryClientById(Integer id);
}
