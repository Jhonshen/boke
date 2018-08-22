package org.jhonshen.boke.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.jhonshen.boke.pojo.Article;
import org.jhonshen.boke.pojo.Category;
import org.jhonshen.boke.pojo.User;
import org.jhonshen.boke.service.ArticleService;
import org.jhonshen.boke.service.CategoryService;
import org.jhonshen.boke.service.UserService;
import org.jhonshen.boke.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.HttpCookie;
import java.util.List;

@Controller
@RequestMapping("")
public class ArticleController {
    @Autowired
    ArticleService articleService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    UserService userService;
    @RequestMapping("admin_article_edit")
    public  String list(Model model, Integer id) {
        List<Category> cs= categoryService.list();
        model.addAttribute("categorys", cs);
        if(id != null) {
            Article a = articleService.get(id);
            model.addAttribute("artilce", a);
        }
        return "admin/editArticle";
    }
    @RequestMapping("admin_article_update")
    public String update(Article article) {
        if(article.getId() != null) {
            articleService.update(article);
        }
        else
            articleService.add(article);
        return "redirect:admin_article_management";
    }
    @RequestMapping("admin_article_management")
    public String management(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Article> as = articleService.list();
        for(Article a : as) {
            Category c = categoryService.get(a.getCid());
            a.setCategory(c);
        }
        int total = (int) new PageInfo<>(as).getTotal();
        page.setTotal(total);
        model.addAttribute("articles", as);
        return "admin/listArticle";
    }
    @RequestMapping("admin_article_delete")
    public String delete(Integer id){
        articleService.delete(id);
        return "redirect:admin_article_management";
    }
    @RequestMapping("loginPage")
    public String login(){
        return "admin/loginPage";
    }
    @RequestMapping("jhonLogin")
    public String adminlogin(User user, HttpSession session){
        User u = userService.get(user.getName(), user.getPassword());
        if(u != null){
            session.setAttribute("admin", u);
            User use =(User) session.getAttribute("admin");
            System.out.println("session:"+use.getName());
            return "redirect:admin_article_management";
        }else
            return "admin/loginPage";
    }
}