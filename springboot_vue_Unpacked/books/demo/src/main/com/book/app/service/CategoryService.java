package com.book.app.service;

import com.book.app.bean.Category;

import java.awt.print.Book;
import java.util.List;

public interface CategoryService {

    List<Category>listCategory();

    boolean   saveCategory(Category category);

    boolean   updateCategory(Category category);

    boolean  removeCategory(int cateid);
}
