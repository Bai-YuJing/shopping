package dao;

import entiy.Product;

import java.util.List;


public interface ProductDao {
    //查询所有
    List<Product> selectProduct();

    //增加或者修改
    int save(Product product);

    //分页和多条件
    List<Product> All(Product product, int nowPage, int pageSize);

    //删除
    int del(String id);

    //修改餐品状态
    int updateproductStatus(String type, String id);
}
