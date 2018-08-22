package org.jhonshen.boke.service;

import org.jhonshen.boke.pojo.Comment;

import java.util.List;

public interface CommentService {
    void add(Comment comment);
    void delete(int id);
    List<Comment> list();
    List<Comment> list(int aid);
}
