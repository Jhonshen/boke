package org.jhonshen.boke.service.impl;

import org.jhonshen.boke.mapper.ArticleMapper;
import org.jhonshen.boke.pojo.Article;
import org.jhonshen.boke.pojo.ArticleExample;
import org.jhonshen.boke.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServicleImpl implements ArticleService {
    @Autowired
    ArticleMapper articleMapper;
    @Override
    public void add(Article article) {
        articleMapper.insert(article);
    }

    @Override
    public void update(Article article) {
        articleMapper.updateByPrimaryKey(article);
    }

    @Override
    public List<Article> list() {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("id desc");
        return articleMapper.selectByExample(example);
    }

    @Override
    public List<Article> list(int cid) {
        ArticleExample example = new ArticleExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        return articleMapper.selectByExample(example);
    }

    @Override
    public Article get(int id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Article> search(String keyword) {
        ArticleExample example = new ArticleExample();
        example.createCriteria().andTitleLike("%" + keyword + "%");
        example.setOrderByClause("id desc");
        return articleMapper.selectByExample(example);
    }

    @Override
    public void delete(Integer id) {
        articleMapper.deleteByPrimaryKey(id);
    }
}

