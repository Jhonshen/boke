package org.jhonshen.boke.service;

import org.jhonshen.boke.pojo.User;

import java.util.List;

public interface UserService {
    void add(User user);
    void delete(int id);
    List<User> list();

    User get(Integer uid);

    boolean isExit(String name);

    User get(String name, String password);
}
