package cn.itcast.service;

import cn.itcast.domain.Order;

import java.util.List;

public interface OrderService {

    //查询所有订单
    public List<Order> findAllOrder();
    //保存订单信息
    public void saveOrder(Order order);

    //根据用户名查询订单信息
    public List<Order> findOrderByname(String username);

    /**
     * 删除指定id数据
     */
    public void deleteOrldById(int id);

}
