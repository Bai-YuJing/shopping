package dao;


import entiy.Order;

import java.util.List;


public interface OrderDao {
    /**
     * 添加一个订单并返回自增主键
     *
     * @param order
     * @return
     */
    int addOrder(Order order);

    /**
     * 按照条件分页查询订单
     *
     * @param
     * @return
     */
    List<Order> OrderAll(Order order, int nowPage, int pageSize);
}
