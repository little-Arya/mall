package cn.itcast.controller;


import cn.itcast.domain.User;
import cn.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller

public class UserController {

    @Autowired
    private UserService userService;

//查询所有账户
    @RequestMapping("/findAll")
    public String findAll(Model model){
        System.out.println("表现层：查询所有账户。。。。");
        //调用service方法
        List<User> list=userService.findAll();
        model.addAttribute("list",list);
        //    accountService.findAll();
        return "list";
    }

//注册新用户
    @RequestMapping("/save")
    public void save(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException {
        System.out.println("保存账户");
        userService.saveUser(user);
       request.getRequestDispatcher("/WEB-INF/pages/list.jsp").forward(request,response);
   //     response.sendRedirect(request.getContextPath()+"/user/findAll");
        return ;
    }


//页面跳转
    @RequestMapping("/login")
    public void Login(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        //   accountService.saveAccount(account);
        request.getRequestDispatcher("/WEB-INF/pages/list.jsp").forward(request,response);

    }

//页面跳转
    @RequestMapping("/register")
    public void Register(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        //   accountService.saveAccount(account);
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request,response);

    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        //   accountService.saveAccount(account);
       return "redirect:/index.jsp";
    }

//登录操作
    @RequestMapping("/loginServlet")
    public ModelAndView login(String username,String password,ModelAndView mv,HttpSession session,HttpServletRequest request){

        User user=userService.login(username, password);
        String username1=request.getParameter("username");
        String password1=request.getParameter("password");
        System.out.println(username1);

        if(user!=null){
         //这是管理员
            if(username1.equals("admin")&&password1.equals("admin")) {
                session.setAttribute("user", user);
                mv.setViewName("system");
            }
else {
    //这是普通用户
                //登录成功，将user对象设置到HttpSession作用范围域中
                session.setAttribute("user", user);
                //转发到main请求
                //  mv.setView(new RedirectView("/index.jsp"));
                System.out.println("登录成功");
                System.out.println(username);
                //放在session方便后面取名字
                request.getSession().setAttribute("username",username);
                mv.setViewName("redirect:/findALLProduct");
            }     }
        else {
            //登录失败，设置失败信息，并调转到登录页面
            mv.addObject("message","登录名和密码错误，请重新输入");
            System.out.println("登录名和密码错误，请重新输入");
            mv.setViewName("list");
        }
        return mv;
    }

    //注销登录
    @RequestMapping("/login-out")
    public String loginOut(HttpServletRequest request){
        request.getSession().setAttribute("user", null);
        return "list";
    }

    //注册验证用户名是否存在

    @RequestMapping("/checkName")
    @ResponseBody//返回给jsp字符串格式
    public String checkName(HttpServletRequest request) {
        String username = request.getParameter("username");
        System.out.println(username);
        //根据用户名查询是否存在该用户名
        User user=userService.findUserByName(username);
        //当对象不为空，说明用户名存在
        if(user==null) {
            //然后返回给前端执行success方法。
             return "{\"msg\":\"false\"}";
        }
       return "{\"msg\":\"true\"}";
    }

}
