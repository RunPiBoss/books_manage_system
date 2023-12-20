package com.book.app.dao;

import com.book.app.bean.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 数据访问层接口，该接口使用mybatis技术访问数据库
 */

@Repository
public interface CategoryDao {

    List<Category>listCategory();

    int insert(Category category);

    int   update(Category category);

    int  delete(int cid);


}
