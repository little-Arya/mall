package cn.itcast.service;

import cn.itcast.domain.Item;

import java.util.List;

public interface ItemService {
    //查询所有订单
    public List<Item> findAllItem();
    //保存订单信息
    public void saveItem(Item item);

    //根据用户名查询订单信息
    public List<Item> findItemByname(String username);

    //根据id查询数据
    public void deleteById(Integer id);


}
