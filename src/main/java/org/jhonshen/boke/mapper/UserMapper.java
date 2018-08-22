package org.jhonshen.boke.mapper;

import java.util.List;
import org.jhonshen.boke.pojo.User;
import org.jhonshen.boke.pojo.UserExample;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}