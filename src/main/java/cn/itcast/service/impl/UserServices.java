package cn.itcast.service.impl;

import cn.itcast.dao.UserDao;
import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServices implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findAll() {
        System.out.println("业务层：查询所有账户。。。。");
        return userDao.findAll();
    }

    @Override
    public void saveUser(User user) {
        System.out.println("业务层：保存账户。。。。");
        userDao.saveUser(user);

    }

    @Override
    public User login(String username, String password) {
        return userDao.findWithLoginAndPassword(username,password);
    }

    @Override
    public User findUserByName(String username) {
        return userDao.findUserByName(username);
    }


}
