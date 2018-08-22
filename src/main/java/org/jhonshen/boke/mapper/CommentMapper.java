package org.jhonshen.boke.mapper;

import java.util.List;
import org.jhonshen.boke.pojo.Comment;
import org.jhonshen.boke.pojo.CommentExample;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}