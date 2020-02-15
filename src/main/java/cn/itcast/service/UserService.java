package cn.itcast.service;

import cn.itcast.domain.User;

import java.util.List;

public interface UserService {

    //查询所有账户
    public List<User> findAll();
    //保存账户信息
    public void saveUser(User user);

    //判断用户登录
    User login(String username,String password);

    //验证用户名是否重复
    public User findUserByName(String username);
}
