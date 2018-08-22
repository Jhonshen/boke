package org.jhonshen.boke.mapper;

import java.util.List;
import org.jhonshen.boke.pojo.Article;
import org.jhonshen.boke.pojo.ArticleExample;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    List<Article> selectByExample(ArticleExample example);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);
}