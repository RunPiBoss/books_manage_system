package com.book.app.controller;

import com.book.app.bean.Category;
import com.book.app.service.CategoryService;
import com.book.app.service.impl.CategoryServiceImpl;
import com.book.app.utils.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;
@Api(tags = "图书类别API文档")
@RestController
@RequestMapping("/category")
@CrossOrigin  // 主要作用就是用来处理跨服务器j访问数据问题，该标签的作用是用于服务器之间进行数据传递的
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    // 该方法他给客户端返回的数据格式必须是json格式
    //@RequestMapping("/list")
    @ApiOperation("查询图书操作")
    @GetMapping("/list")
    public CommonResult list(){
        return success(categoryService.listCategory());
    }

//    这里的函数的参数int cateid要和前端保持一致，会自动匹配
    @ApiOperation("根据ID删除图书")
    @DeleteMapping("/delete")
    public boolean delete(@RequestParam int cateid, String test){
        System.out.println(test);
        return categoryService.removeCategory(cateid);
    }

    @ApiOperation("添加图书类别信息")
    @PostMapping("/save")
    public boolean save(@RequestBody Category category){
        return categoryService.saveCategory(category);
    }

    @ApiOperation("修改图书信息")
    @PutMapping("/update")
    public  boolean update(@RequestBody Category category){
        return categoryService.updateCategory(category);
    }
}
