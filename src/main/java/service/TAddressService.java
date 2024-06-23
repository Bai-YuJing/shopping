package service;

import entiy.TAddress;
import entiy.TUser;

import java.util.List;

public interface TAddressService {
    /**
     * 查看所有用户的地址和分页
     * @param user
     * @return
     */
    List<TAddress> queryAddress(TUser user,int nowPage, int pageSize);


    /**
     *增加用户地址
     * @return
     */
    int add(String addressProvince,String addressCity,String addressDistrict,String addressDescribe,int id);


    /**
     * 删除用户地址
     * @return
     */
    int del(String id);


    /**
     * 修改用户地址
     * @return
     */
    int update(String addressProvince,String addressCity,String addressDistrict,String addressDescribe,String id);


    /**
     * 根据实现分页
     */
//    List<TAddress> All(TAddress tAddress, int nowPage, int pageSize);
}

