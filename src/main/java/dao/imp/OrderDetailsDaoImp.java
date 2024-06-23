package dao.imp;

import dao.OrderDetailsDao;
import entiy.OrderDetails;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import untils.DataSourceUtil;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrderDetailsDaoImp implements OrderDetailsDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DataSourceUtil.getDataSource());

    @Override
    public void addOrderDetails(List<OrderDetails> OrderDetails) {
        final List<OrderDetails> orderDetails = OrderDetails;
        String sql = "insert into t_order_details(product_name,product_num,product_money,order_id) values(?,?,?,?)";
        jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public int getBatchSize() {
                return orderDetails.size();
            }

            @Override
            public void setValues(PreparedStatement ps, int i)
                    throws SQLException {
                ps.setString(1, orderDetails.get(i).getProductName());
                ps.setInt(2, orderDetails.get(i).getProductNum());
                ps.setDouble(3, orderDetails.get(i).getProductMoney());
                ps.setInt(4, orderDetails.get(i).getOrderId());
            }
        });
    }

    @Override
    public List<OrderDetails> getByIds(String ids) {
        try {
            return jdbcTemplate.query("select * from t_order_details where order_id in"+ids, new BeanPropertyRowMapper<OrderDetails>(OrderDetails.class));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


}
