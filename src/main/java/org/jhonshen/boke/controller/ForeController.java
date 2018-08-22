package org.jhonshen.boke.controller;

import org.jhonshen.boke.pojo.Article;
import org.jhonshen.boke.pojo.Comment;
import org.jhonshen.boke.pojo.User;
import org.jhonshen.boke.service.ArticleService;
import org.jhonshen.boke.service.CommentService;
import org.jhonshen.boke.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("")
public class ForeController {
    @Autowired
    ArticleService articleService;
    @Autowired
    UserService userService;
    @Autowired
    CommentService commentService;
    @RequestMapping("foreArticle")
    public String article(int category,Model model) {
        List<Article> as = articleService.list(category);
        model.addAttribute("articles", as);
        model.addAttribute("category", category);
        return "fore/article";
    }
    @RequestMapping("firstPage")
    public String first(String category,Model model){
        List<Article> as = articleService.list();
        model.addAttribute("articles", as);
        model.addAttribute("category", category);
        return "fore/firstPage";
    }
    @RequestMapping("detail")
    public String detail(int id, Model model){
        Article a = articleService.get(id);
        model.addAttribute("article", a);
        List<Comment> cs = commentService.list(id);
        for(Comment c:cs) {
            c.setUser(userService.get(c.getUid()));
        }
        model.addAttribute("comments", cs);
        return "fore/detailPage";
    }
    @RequestMapping("foreSearch")
    public String search(String keyword, Model model) {
        System.out.println(keyword);
        List<Article> as = articleService.search(keyword);
        System.out.println(as.size());
        model.addAttribute("articles", as);
        return "fore/article";
    }
    @RequestMapping("foreregister")
    public String register(User user, Model model){
        String name = user.getName();
        name = HtmlUtils.htmlEscape(name);
        user.setName(name);
        boolean exit = userService.isExit(name);
        if(exit) {
            String m = "用户名已经被使用,不能使用";
            model.addAttribute("msg", m);
            model.addAttribute("user", null);
            return "fore/register";
        }
        userService.add(user);
        return "redirect:firstPage";
    }
    @RequestMapping("foreloginAjax")
    @ResponseBody
    public String login(@RequestParam("name") String name, @RequestParam("password") String password, HttpSession session) throws UnsupportedEncodingException {
        name = HtmlUtils.htmlEscape(name);
       name = URLDecoder.decode(name, "UTF-8");
        User user = userService.get(name, password);
        System.out.println(name);
        if(user != null){
            session.setAttribute("user", user);
            return "success";
        }
        else{
            return "fail";
        }
    }
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:firstPage";
    }
    @RequestMapping("forechecklogin")
    @ResponseBody
    public String check(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null)
            return "fail";
        else
            return "success";
    }
    @RequestMapping("foreWriteComment")
    public String writecomment(Comment comment){
        commentService.add(comment);
        return "redirect:detail?id="+comment.getAid();
    }
}
