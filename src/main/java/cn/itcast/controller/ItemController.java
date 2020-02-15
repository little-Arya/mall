package cn.itcast.controller;


import cn.itcast.domain.Account;
import cn.itcast.domain.Item;
import cn.itcast.domain.User;
import cn.itcast.service.AccountService;
import cn.itcast.service.ItemService;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;
    @Autowired
    private AccountService accountService;

    //保存订单信息
    @RequestMapping("/saveitem")
    public void saveitem(HttpServletRequest request, HttpServletResponse response)throws Exception{
        Item item=new Item();
        //获取Session中的用户名字
        //获取总价
        String total=request.getParameter("total");
        System.out.println("total:===="+total);
        item.setTotal(total);
        //获取用户名
        HttpSession session = request.getSession();
        String username= (String) session.getAttribute("username");
        item.setUsername(username);
        System.out.println(username);

        //map是HashMap对象
        Map map=new HashMap();
        Map pMap=request.getParameterMap();

        //entrySet()的作用是返回“HashMap中所有Entry的集合”，它是一个集合
        //通过entrySet()获取到的Iterator的next()方法去遍历HashMap时，实际上调用的是 nextEntry() 。
        // 而nextEntry()的实现方式，先遍历Entry(根据Entry在table中的序号，从小到大的遍历)；
        // 然后对每个Entry(即每个单向链表)，逐个遍历。

//根据entrySet()获取HashMap的“键值对”的Set集合。
        Iterator it=pMap.entrySet().iterator();

        while (it.hasNext())
        {
            Map.Entry en = (Map.Entry) it.next();
            //获取pid的值
            String pid=request.getParameter((String) en.getKey());

            if(((String) en.getKey()).contains("text_box"))
            {
                String s= (String) en.getKey();

                String regEx="[^0-9]";
                Pattern p = Pattern.compile(regEx);
                Matcher m = p.matcher(s);
                System.out.println("id=");

                try {
                    int id= Integer.parseInt(m.replaceAll("").trim());
                    item.setPid(id);
                    System.out.println(id);

                    int num=Integer.parseInt(request.getParameter(s));
                    System.out.println("这是数量"+num);

                    item.setNum(num);

                    Account account = accountService.getItemById(id);
                    String prname=  account.getName();
                    item.setPrname(prname);
                    System.out.println(prname);
                }
                catch (NumberFormatException e){
                    System.out.println("....");
                }
            }
         //   System.out.println("---------");
           /* if (((String) en.getKey()).contains("text_box"))
            {
                System.out.println("-----------------11------------------");
                System.out.println(en.getKey());
                System.out.println(pMap.get(pid));
                System.out.println("-------------------22--------------------");
            }*/

        }

      //  System.out.println(pid);*/
        //通过商品id获取商品名称
       /* Account account = accountService.getItemById(pid);*/
      /*  */
     //   String prname=request.getParameter("name");
      /*  item.setPrname(prname);
        System.out.println(prname);*/

        itemService.saveItem(item);
     //   request.getRequestDispatcher("/WEB-INF/pages/system.jsp").forward(request,response);
        response.sendRedirect(request.getContextPath()+"/findOneItem");
    }


//查询所有账户
    @RequestMapping("/findAllItem")
    public String findAllItem(Model model){
        System.out.println("表现层：查询所有账户。。。。");
        //调用service方法
        List<Item> list=itemService.findAllItem();
        model.addAttribute("Syitem",list);
        //    accountService.findAll();
        return "Syitem";
    }


    //查询某个特定的用户名查询订单
    @RequestMapping("/findOneItem")
    public String findOneItem(Model model,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String username= (String) session.getAttribute("username");
        List<Item> list=itemService.findItemByname(username);
        model.addAttribute("Aitem",list);
        return "Aitem";
    }

    @RequestMapping("/deleteCartById")
    public String deleteCartById(Integer id) { //接收页面的请求id
        itemService.deleteById(id);
        System.out.println("删除成功");
        return "redirect:/findOneItem";  //重定向到展示数据页面
    }


}

