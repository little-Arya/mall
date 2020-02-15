package cn.itcast.dao;


import cn.itcast.domain.Order;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {

    //查询所有订单
    @Select("select * from qisi")
    public List<Order> findAllOrder();
    //保存订单信息
//保存账户信息
    //@Insert("insert into order(username,pid,prname,total,address,phone,num) values(#{username},#{pid},#{prname},#{total},#{address},#{phone},#{num})")
   // @Insert("insert into order(username,pid,prname,total,address,phone,num) values(#{username},#{pid},#{prname},#{total},#{address},#{phone},#{num})")
    @Insert("insert into qisi(username,pid,pa,total,address,phone,num) values (#{username},#{pid},#{pa},#{total},#{address},#{phone},#{num})")
    public void saveOrder(Order order);

    //根据用户名查询订单信息
    @Select("select * from qisi where username=#{username}")
    public List<Order> findOrderByname(String username);

    @Delete("delete from qisi where id=#{id}")
    public void deleteOrldById(int id);

}
