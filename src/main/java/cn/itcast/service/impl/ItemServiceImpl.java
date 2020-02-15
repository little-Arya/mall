package cn.itcast.service.impl;

import cn.itcast.dao.ItemDao;
import cn.itcast.domain.Item;
import cn.itcast.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("itemService")
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemDao itemDao;

    @Override
    public List<Item> findAllItem() {
        return itemDao.findAllItem();
    }

    @Override
    public void saveItem(Item item) {

        itemDao.saveItem(item);
    }

    @Override
    public List<Item> findItemByname(String username) {
        return itemDao.findItemByname(username);
    }

    @Override
    public void deleteById(Integer id) {
       itemDao.deleteById(id);
    }
}
