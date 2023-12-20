package com.book.app.service.impl;

import com.book.app.bean.Category;
import com.book.app.dao.CategoryDao;
import com.book.app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
// 使用spring的Autowired将数据访问层(dao)的接口注入过来直接使用，该标签的作用就是实例化CategoryDao对象
    @Autowired
    private CategoryDao categoryDao;
    public List<Category> listCategory() {
        return categoryDao.listCategory();
    }

    public boolean saveCategory(Category category) {

        return categoryDao.insert(category)>0?true:false;
    }

    public boolean updateCategory(Category category) {

        return categoryDao.update(category)>0?true:false;
    }

    public boolean removeCategory(int cateid) {
        return categoryDao.delete(cateid)>0?true:false;
    }
}
