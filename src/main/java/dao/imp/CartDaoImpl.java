package dao.imp;

import dao.CartDao;
import entiy.Cart;
import entiy.CartProduct;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import untils.DataSourceUtil;

import java.util.List;



public class CartDaoImpl implements CartDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DataSourceUtil.getDataSource());

    @Override
    public int addCart(Cart cart) {
        try {
            return jdbcTemplate.update("insert into t_cart(product_id,product_num,user_id) values(?,?,?)", cart.getProductId(), cart.getProductNum(), cart.getUserId());
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int updateCart(Cart cart) {
        try {
            return jdbcTemplate.update("update t_cart set product_num=? where cart_id=? ", cart.getProductNum(), cart.getCartId());
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public Cart getCartById(Cart cart) {
        try {
            return jdbcTemplate.queryForObject("select * from t_cart where product_id = ? and user_id = ?", new BeanPropertyRowMapper<Cart>(Cart.class), cart.getProductId(), cart.getUserId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<CartProduct> getCart(CartProduct cartProduct) {
        String sql = "select c.*,p.product_name,p.product_pic,p.product_price from t_cart c join t_product p on c.product_id = p.product_id where c.user_id = ?";
        try {
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<CartProduct>(CartProduct.class), cartProduct.getUserId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int addAndred(String num, String cid) {
        try {
            if ("0".equals(num)) {
                return jdbcTemplate.update("delete from t_cart where cart_id=?", cid);
            } else {
                return jdbcTemplate.update("update t_cart set product_num=? where cart_id=? ", num, cid);
            }

        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int cartDel(String uid) {
        try {
            return jdbcTemplate.update("delete from t_cart where user_id=?",uid);
        }catch (Exception e){
            return 0;
        }
    }
}
