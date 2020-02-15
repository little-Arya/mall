package cn.itcast.service.impl;

import cn.itcast.dao.AccountDao;
import cn.itcast.domain.Account;
import cn.itcast.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;



    public List<Account> findAll() {
        System.out.println("业务层：查询所有账户。。。。");
        return accountDao.findAll();
    }


    public void saveAccount(Account account) {

        accountDao.saveAccount(account);
        System.out.println("业务层：保存账户。。。。");
    }

    @Override
    public void deleteItemById(int id) {
        accountDao.deleteItemById(id);
    }

    @Override
    public Account getItemById(int id) {
        return accountDao.getItemById(id);
    }

    @Override
    public void updateItemById(Account account) {

        accountDao.updateItemById(account);
    }



}
