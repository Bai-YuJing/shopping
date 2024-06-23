package dao.imp;

import dao.TCategoryDao;
import entiy.TCategory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import untils.DataSourceUtil;

import java.util.ArrayList;
import java.util.List;

public class TCategoryDaoImp implements TCategoryDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DataSourceUtil.getDataSource());

    @Override
    public List<TCategory> queryAddress(TCategory tcategory, int nowPage, int pageSize) {
        try {
            String sql = "select * from t_category where 1=1 ";
            ArrayList<String> str = new ArrayList<>();
            if (tcategory.getCategoryId() != null && !"".equals(tcategory.getCategoryId())) {
                sql += "and category_id=?";
                str.add(String.valueOf(tcategory.getCategoryId()));
            }
            if (nowPage != 0) {
                sql += "limit " + (nowPage - 1) * pageSize + "," + pageSize;
            }
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<TCategory>(TCategory.class), str.toArray());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int add(String name, String id) {
        try {
            return jdbcTemplate.update("insert into t_category(category_name,category_id) values (?,?)", name, id);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int del(String id) {
        try {
            return jdbcTemplate.update("delete from t_category where category_id=?", id);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int update(String name, String id) {
        try {
            return jdbcTemplate.update("update t_category set category_name=?where category_id=?", name, id);
        } catch (Exception e) {
            return 0;
        }
    }
}
