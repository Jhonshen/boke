package org.jhonshen.boke.service.impl;

import org.jhonshen.boke.mapper.UserMapper;
import org.jhonshen.boke.pojo.User;
import org.jhonshen.boke.pojo.UserExample;
import org.jhonshen.boke.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public void add(User user) {
        userMapper.insert(user);
    }

    @Override
    public void delete(int id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<User> list() {
        UserExample example = new UserExample();
        example.setOrderByClause("id desc");
        return userMapper.selectByExample(example);
    }

    @Override
    public User get(Integer uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public boolean isExit(String name) {
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(name);
        List<User> users = userMapper.selectByExample(example);
        if(users.size() == 0)
            return false;
        else
            return true;
    }

    @Override
    public User get(String name, String password) {
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<User> us=userMapper.selectByExample(example);
        return us.get(0);
    }
}
