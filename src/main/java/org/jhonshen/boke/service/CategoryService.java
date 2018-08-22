package org.jhonshen.boke.service;

import org.jhonshen.boke.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> list();
    Category get(int id);
}
