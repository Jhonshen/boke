package org.jhonshen.boke.service.impl;

import org.jhonshen.boke.mapper.CategoryMapper;
import org.jhonshen.boke.pojo.Category;
import org.jhonshen.boke.pojo.CategoryExample;
import org.jhonshen.boke.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public List<Category> list() {
        CategoryExample example = new CategoryExample();
        example.setOrderByClause("id desc");
        return categoryMapper.selectByExample(example);
    }

    @Override
    public Category get(int id) {
        return categoryMapper.selectByPrimaryKey(id);
    }
}
