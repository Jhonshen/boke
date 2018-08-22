package org.jhonshen.boke.service.impl;

import org.jhonshen.boke.mapper.CommentMapper;
import org.jhonshen.boke.pojo.Comment;
import org.jhonshen.boke.pojo.CommentExample;
import org.jhonshen.boke.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;
    @Override
    public void add(Comment comment) {
        commentMapper.insert(comment);
    }

    @Override
    public void delete(int id) {
        commentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Comment> list() {
        CommentExample example = new CommentExample();
        example.setOrderByClause("id desc");
        return commentMapper.selectByExample(example);
    }

    @Override
    public List<Comment> list(int aid) {
        CommentExample example = new CommentExample();
        example.createCriteria().andAidEqualTo(aid);
        example.setOrderByClause("id desc");
        return commentMapper.selectByExample(example);
    }
}
