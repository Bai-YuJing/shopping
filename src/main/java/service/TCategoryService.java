package service;

import entiy.TCategory;

import java.util.List;

public interface TCategoryService {
    /**
     * 查看所有餐品
     * @param
     * @return
     */
    List<TCategory> queryAddress(TCategory tcategory, int nowPage, int pageSize);


    /**
     *增加餐品
     * @return
     */
    int add(String name, String id);


    /**
     * 删除餐品
     * @return
     * @param id
     */
    int del(String id);


    /**
     * 修改餐品
     * @return
     */
    int update(String name, String id);

}
