package cn.itcast.service;

import cn.itcast.domain.Account;


import java.util.List;

public interface AccountService {

    //查询所有账户
    public List<Account> findAll();

    //保存账户信息
    public void saveAccount(Account account);

    /**
     * 删除指定id数据
     */
    public void deleteItemById(int id);


    //根据id查询数据
    Account getItemById(int id);



    //根据参数更新数据
    public void updateItemById(Account account);


}
