package cn.itcast.controller;


import cn.itcast.domain.Order;
import cn.itcast.service.ItemService;
import cn.itcast.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.IntrospectionException;
import java.io.IOException;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ItemService itemService;


    @RequestMapping("/findAllOrder")
    public String findAllOrder(Model model){
        System.out.println("表现层：查询所有账户。。。。");
        //调用service方法

        List<Order> list=orderService.findAllOrder();
        model.addAttribute("order",list);
        //    accountService.findAll();
        return "order";
    }



    @RequestMapping("/addOrders")
    public void addOrders(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Order order=new Order();
        String username=request.getParameter("username");
        order.setUsername(username) ;
        System.out.println(username);
        Integer pid= Integer.valueOf(request.getParameter("pid"));
        order.setPid(pid);
        System.out.println(pid);
        String prname=request.getParameter("prname");
        order.setPa(prname);
        System.out.println(prname);
        Double total= Double.valueOf(request.getParameter("total"));
        order.setTotal(total);
        System.out.println(total);


        String phone=request.getParameter("phone");
        order.setPhone(phone);
        System.out.println(phone);
        String address=request.getParameter("address");
        order.setAddress(address);
        System.out.println(address);

        Integer num= Integer.valueOf(request.getParameter("num"));
        order.setNum(num);
        System.out.println(num);
        orderService.saveOrder(order);
        System.out.println("保存成功");
        //保存订单了应该删除购物车那条记录


        Integer id= Integer.valueOf(request.getParameter("id"));
        System.out.println("该删除的"+id);
        itemService.deleteById(id);
        System.out.println("删除购物车信息成功");
        response.sendRedirect(request.getContextPath()+"/findOneOrder");
        return;
    }


    //查询某个特定的用户名查询订单
    @RequestMapping("/findOneOrder")
    public String findOneOrder(Model model,HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String username= (String) session.getAttribute("username");
        List<Order> list=orderService.findOrderByname(username);
        model.addAttribute("moder",list);
        return "moder";
    }

    @RequestMapping("/deleteOrldById")
    public String deleteOrldById(int id) { //接收页面的请求id
        orderService.deleteOrldById(id);
        System.out.println("删除成功");
        return "redirect:/findAllOrder";  //重定向到展示数据页面
    }


}
