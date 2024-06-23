package service;

import entiy.Order;

import java.util.List;


public interface OrderService {
    /**
     * 添加一个订单并返回自增主键
     * @param order
     * @return
     */
    int addOrder(Order order);



    /**
     * 获得所有order数据
     * @param Order
     * @return
     */
    List<Order> OrderAll(Order Order,int nowPage,int pageSize);
}
