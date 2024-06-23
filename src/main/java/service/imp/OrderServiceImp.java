package service.imp;

import dao.OrderDao;
import dao.imp.OrderDaoImpl;
import entiy.Order;
import service.OrderService;

import java.util.List;


public class OrderServiceImp  implements OrderService {
    OrderDao od= new OrderDaoImpl();
    @Override
    public int addOrder(Order order) {
        return od.addOrder(order);
    }

    @Override
    public List<Order> OrderAll(Order order,int nowPage,int pageSize) {
        return od.OrderAll(order,nowPage,pageSize);
    }
}
