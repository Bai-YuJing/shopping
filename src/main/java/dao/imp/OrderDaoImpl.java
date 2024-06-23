package dao.imp;


import dao.OrderDao;
import entiy.Order;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import untils.DataSourceUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DataSourceUtil.getDataSource());

    @Override
    public int addOrder(Order order) {
        Object[] params = new Object[]{
                order.getUserId(),
                order.getAddressDetails(),
        };

        String sql = "insert into t_order(order_id,user_id,address_details) values(?,?,?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                int i = 1;
                // 自增主键为null
                ps.setObject(i, null);
                for (Object p : params) {
                    i++;
                    // 用Object可以添加null参数
                    ps.setObject(i, p);
                }
                return ps;
            }
        }, keyHolder);

        // 返回主键id
        return keyHolder.getKey().intValue();
    }

    @Override
    public List<Order> OrderAll(Order order, int nowPage, int pageSize) {
        //获取关联表
        String sql = "select u.user_name,o.* from t_order o join t_user u on o.user_id=u.user_id where 1=1";
        List<String> str = new ArrayList<String>();
        //参数条件
        if (order.getUserId() != null) {
            sql += " and o.user_id = ?";
            str.add(order.getUserId() + "");
        }
        if (order.getAddTime() != null && !"".equals(order.getAddTime())) {
            sql += " and o.add_time >= ?";
            str.add(order.getAddTime());
        }
        if (order.getAddTimeEnd() != null && !"".equals(order.getAddTimeEnd())) {
            sql += " and o.add_time <= ?";
            str.add(order.getAddTimeEnd());
        }
        if (order.getOrderType() != null && order.getOrderType() != 0) {
            sql += " and o.order_type = ?";
            str.add(order.getOrderType() + "");
        }
        if (order.getOrderId() != null && order.getOrderId() != 0) {
            sql += " and o.order_id = ?";
            str.add(order.getOrderId() + "");
        }

        sql += " order by o.order_id desc";

        if (nowPage != 0) {
            sql += " limit " + (nowPage - 1) * pageSize + "," + pageSize;
        }
        System.out.println(pageSize);
        try {
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class), str.toArray());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

//    测试
//    public static void main(String[] args) {
//        OrderDaoImpl dao = new OrderDaoImpl();
//        Order order = new Order();
//        order.setOrderType(1);
//        List<Order> orders = dao.OrderAll(order, 1, 10);
//        for (Order or:orders){
//            System.out.println(or);
//        }
//    }
}