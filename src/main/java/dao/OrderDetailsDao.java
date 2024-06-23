package dao;

import entiy.OrderDetails;

import java.util.List;


public interface OrderDetailsDao {
    void  addOrderDetails(List<OrderDetails>OrderDetails);

    List<OrderDetails> getByIds(String ids);
}
