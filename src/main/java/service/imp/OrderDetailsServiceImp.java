package service.imp;

import dao.OrderDao;
import dao.OrderDetailsDao;
import dao.imp.OrderDaoImpl;
import dao.imp.OrderDetailsDaoImp;
import entiy.Order;
import entiy.OrderDetails;
import service.OrderDetailsService;

import java.util.ArrayList;
import java.util.List;

public class OrderDetailsServiceImp implements OrderDetailsService {
    OrderDetailsDao odd = new OrderDetailsDaoImp();
    private OrderDao od = new OrderDaoImpl();

    @Override
    public void addOrderDetails(List<OrderDetails> OrderDetails) {
        odd.addOrderDetails(OrderDetails);
    }

    @Override
    public List<Order> selectOrderAndDetails(Order order, int nowPage, int pageSize) {
        List<Order> orders = od.OrderAll(order, nowPage, pageSize);

        //获取订单详情
        if (orders != null && orders.size() > 0 && nowPage != 0) {
            //获取订单编号集合
            String oids = "(" + orders.get(0).getOrderId()+",";
            for (int i = 1; i < orders.size() - 1; i++) {
                oids += orders.get(i).getOrderId() + ",";
            }
            oids += orders.get(orders.size() - 1).getOrderId() + ")";


            List<OrderDetails> OrderDetails = odd.getByIds(oids);

            //数据重新封装
            List<OrderDetails> ord;  //每个订单下的订单详情的集合
            Double sum;   //  每个订单的总金额
            for (int i = 0; i < orders.size(); i++) {
                ord = new ArrayList<OrderDetails>();
                sum = 0.0;
                for (int j = 0; j < OrderDetails.size(); j++) {
                    if (orders.get(i).getOrderId().intValue() == OrderDetails.get(j).getOrderId().intValue()) {
                        ord.add(OrderDetails.get(j));
                        sum += OrderDetails.get(j).getProductMoney();
                    }
                }
                orders.get(i).setOrderDetails(ord);
                orders.get(i).setSum(sum);
            }

        }


        return orders;
    }

//    测试
//    public static void main(String[] args) {
//        OrderDetailsServiceImp ods = new OrderDetailsServiceImp();
//        Order o = new Order();
//        o.setOrderType(1);
//        List<Order> orders = ods.selectOrderAndDetails(o, 1, 10);
//        for (Order or:orders){
//            System.out.println(or);
//        }
//    }
}
