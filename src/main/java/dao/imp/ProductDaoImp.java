package dao.imp;

import dao.ProductDao;
import entiy.Product;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import untils.DataSourceUtil;

import java.util.ArrayList;
import java.util.List;

public class ProductDaoImp implements ProductDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DataSourceUtil.getDataSource());
    @Override
    public List<Product> selectProduct() {
        try {
            return jdbcTemplate.query("select * from t_product", new BeanPropertyRowMapper<Product>(Product.class));
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int save(Product product) {
        try {
            if(product.getProductId() != null){
                return jdbcTemplate.update("update t_product set product_name=?,product_pic=?,product_price=?,product_describe=?,category_id=? where product_id=?",product.getProductName(),product.getProductPic(),product.getProductPrice(),product.getProductDescribe(),product.getCategoryId(),product.getProductId());
            }else{
                return jdbcTemplate.update("insert into t_product(product_name,product_pic,product_price,product_describe,category_id) values(?,?,?,?,?)",product.getProductName(),product.getProductPic(),product.getProductPrice(),product.getProductDescribe(),product.getCategoryId());
            }

        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public List<Product> All(Product product, int nowPage, int pageSize) {
        try {
            String sql = "select * from t_product where 1=1 ";

            //查询参数集合
            ArrayList<String> str = new ArrayList<>();
            //查询条件
            if(product.getProductName() != null && !"".equals(product.getProductName())){
                sql +="and product_name like ? ";
                str.add("%"+product.getProductName()+"%");
            }
            if(product.getCategoryId() != null && !"".equals(product.getCategoryId())){
                sql +="and category_id= ? ";
                str.add(product.getCategoryId());
            }
            if (product.getProductStatus()!=null){
                sql +="and product_status= ? ";
                str.add(product.getProductStatus());
            }
            sql += " order by product_id desc";
            //分页
            if(nowPage != 0){
                sql += " limit "+(nowPage-1)*pageSize+","+pageSize;
            }
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class),str.toArray());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int del(String id) {
        try {
            return jdbcTemplate.update("delete from t_product where product_id=?",id);
        }catch (Exception e){
            return 0;
        }
    }

    @Override
    public int updateproductStatus(String type, String id) {
        try {
            return jdbcTemplate.update("update t_product set product_status=? where product_id=?",type, id);
        } catch (Exception e) {
            return 0;
        }
    }
}
