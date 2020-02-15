package cn.itcast.dao;


import cn.itcast.domain.Account;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 账户dao接口
 */
@Repository
public interface AccountDao {
    //查询所有账户
    @Select("select * from product")
    public List<Account> findAll();

    //保存账户信息
    @Insert("insert into product(name,price,img,detail) values(#{name},#{price},#{img},#{detail})")
    public void saveAccount(Account account);


    /**删除指定id数据*/
    @Delete("delete from product where id=#{id}")
    public void deleteItemById(int id);


    //更新前的查询
    @Select("select * from product where id=#{id}")
    Account getItemById(int id);

    //更新
    @Update("update product set name=#{name},price=#{price},img=#{img},detail=#{detail} where id=#{id}")
    public void updateItemById(Account account);



}
