package cn.itcast.controller;


import cn.itcast.domain.Account;


import cn.itcast.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * 账户web
 */

@Controller
//@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/accountfindAll")
    public String findAll(Model model){
        System.out.println("表现层：查询所有账户。。。。");
        //调用service方法
        List<Account> list=accountService.findAll();
        model.addAttribute("login",list);
        System.out.println("查询成功");
        //    accountService.findAll();
        return "login";
    }



    @RequestMapping("/accountsave")
    public String save(MultipartFile img,HttpServletRequest request) throws IOException {
        //因为封装不上信息所以用这种新方法
        Account account=new Account();
        String name=request.getParameter("name");
        account.setName(name);
        Double price= Double.parseDouble(request.getParameter("price"));
        account.setPrice(price);

        String imgs=img.getOriginalFilename();

        String detail=request.getParameter("detail");
        account.setDetail(detail);
        System.out.println("111111111111111111");

        //图片上传成功后，将图片的地址写到数据库
        String filePath = "E:\\upload";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = img.getOriginalFilename();
        System.out.println(originalFilename);
        //新的文件名字
        String newFileName = UUID.randomUUID()+originalFilename;

        account.setImg(newFileName);
        //封装上传文件位置的全路径
        File targetFile = new File(filePath,newFileName);
        //把本地文件上传到封装上传文件位置的全路径
        img.transferTo(targetFile);
        //文件名保存到实体类对应属性上

        accountService.saveAccount(account);
        System.out.println(newFileName);

     //   accountService .saveAccount(account);



        return "redirect:/accountfindAll";


    }

    @RequestMapping("/deleteItemById")
    public String deleteItemById(int id) { //接收页面的请求id
        accountService.deleteItemById(id);
        System.out.println("删除成功");
        return "redirect:/accountfindAll";  //重定向到展示数据页面
    }



    /** 接收用户id,展示id对应的用户信息*/
    @RequestMapping("/update")
 public String update(Model model,int id,HttpServletRequest request) {
        Account account = accountService.getItemById(id);
        System.out.println(account.getId());
        System.out.println(account.getName());

        int ids=account.getId();
        request.setAttribute("ids",ids);

        String itemname=account.getName();
        request.setAttribute("name", itemname);

        Double itemprice=account.getPrice();
        request.setAttribute("price",itemprice);

        String itemimg=account.getImg();
        request.setAttribute("img",itemimg);

        String itemdetail=account.getDetail();
        request.setAttribute("detail",itemdetail);


        model.addAttribute("item",account);
        return "item";

    }


    /**  public ModelAndView update(int id) {
     Account item = accountService.getItemById(id);
     ModelAndView mv = new ModelAndView();
     mv.addObject("item",item);
     System.out.println(item.getId());
     System.out.println(item.getName());
     System.out.println(item.getPrice() );
     mv.setViewName("item");
     return mv;
     }*/

    /** 接收客户端修改的数据,在数据库中更新,重定向到showAll*/
    @RequestMapping("/doupdata")
    public String doupdata(Account account) {
        accountService.updateItemById(account);
        return "redirect:/accountfindAll";
    }


    @RequestMapping("/findALLProduct")
  /**  @ResponseBody  //用于转换json对象
    public List<Account>findALLProduct(){
        List<Account> products=accountService.findAll();
        System.out.println(products);
        return products;
    }
**/

    public String findALLProduct(Model model,HttpServletRequest request){
        System.out.println("表现层：查询所有账户。。。。");
        //调用service方法
        List<Account> products=accountService.findAll();
        model.addAttribute("products",products);
      //  request.setAttribute("product", "list");
       System.out.println(products);
       System.out.println("查询成功");
        return "products";
    }


    @RequestMapping("/addaccount")
    public void addaccount(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        //   accountService.saveAccount(account);
        request.getRequestDispatcher("/WEB-INF/pages/system.jsp").forward(request,response);

    }

}
