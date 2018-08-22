package org.jhonshen.boke.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.jhonshen.boke.pojo.Comment;
import org.jhonshen.boke.service.ArticleService;
import org.jhonshen.boke.service.CommentService;
import org.jhonshen.boke.service.UserService;
import org.jhonshen.boke.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class CommentController {
    @Autowired
    CommentService commentService;
    @Autowired
    ArticleService articleService;
    @Autowired
    UserService userService;
    @RequestMapping("admin_comment_list")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Comment> cs =  commentService.list();
        for(Comment c :cs) {
            c.setArticle(articleService.get(c.getAid()));
            c.setUser(userService.get(c.getUid()));
        }
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("comments", cs);
        return "admin/listComment";
    }
    @RequestMapping("admin_comment_delete")
    public String delete(int id){
        commentService.delete(id);
        return "redirect:admin_comment_list";
    }
}
