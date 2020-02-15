package cn.itcast.dao;


import cn.itcast.domain.Item;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemDao {
    /**
     * 账户dao接口
     */
    //查询所有账户
    @Select("select * from item")
    public List<Item> findAllItem();

    //保存账户信息
    @Insert("insert into item(username,pid,prname,total,num) values(#{username},#{pid},#{prname},#{total},#{num})")
    public void saveItem(Item item);

    @Select("select * from item where username=#{username}")
    public List<Item> findItemByname(String username);

    //根据id查询数据
    @Delete("delete from item where id=#{id}")
    public void deleteById(Integer id);

}
