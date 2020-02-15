package cn.itcast.dao;

import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDao {
    /**
     * 账户dao接口
     */
    //查询所有账户
    @Select("select * from user")
    public List<User> findAll();

    //保存账户信息
    @Insert("insert into user(username,password) values(#{username},#{password})")
    public void saveUser(User user);

    //判断用户是否登录
    @Select("select * from user where username=#{username} and password=#{password}")
    User findWithLoginAndPassword(@Param("username")String username,@Param("password")String password);

    @Select("select * from user where username=#{username}")
    public User findUserByName(String username);
}