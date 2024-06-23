package service;

import entiy.Product;

import java.util.List;


public interface ProductService {
    //获取所有数据
    List<Product> selectProduct();


    //修改数据
    int save(Product product);


    /**
     * 根据条件查询实现分页
     */
    List<Product> All(Product product, int nowPage, int pageSize);

    /**
     * 删除
     * @param id
     */
    int del(String id);

    /**
     * 修改餐品状态
     * @param type
     * @param id
     * @return
     */

    int updateproductStatus(String type,String id);
}
