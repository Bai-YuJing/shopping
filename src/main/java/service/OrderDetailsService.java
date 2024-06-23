package service;

import entiy.Order;
import entiy.OrderDetails;

import java.util.List;


public interface OrderDetailsService {
    void  addOrderDetails(List<OrderDetails> OrderDetails);

    List<Order> selectOrderAndDetails(Order order, int nowPage, int pageSize);
}
