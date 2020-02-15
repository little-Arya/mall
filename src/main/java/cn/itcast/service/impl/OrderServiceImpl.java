package cn.itcast.service.impl;

import cn.itcast.dao.OrderDao;
import cn.itcast.domain.Order;
import cn.itcast.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Order> findAllOrder() {
        return orderDao.findAllOrder();
    }

    @Override
    public void saveOrder(Order order) {
        orderDao.saveOrder(order);
    }

    @Override
    public List<Order> findOrderByname(String username) {
        return orderDao.findOrderByname(username);
    }

    @Override
    public void deleteOrldById(int id) {
        orderDao.deleteOrldById(id);
    }
}
