package org.jhonshen.boke.service;


import org.jhonshen.boke.pojo.Article;

import java.util.List;

public interface ArticleService {
    void add(Article article);
    void update(Article article);
    List<Article> list();
    List<Article> list(int id);
    Article get(int id);
    List<Article> search(String keyword);

    void delete(Integer id);
}