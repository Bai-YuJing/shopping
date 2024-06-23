package dao.imp;

import dao.TAddressDao;
import entiy.TAddress;
import entiy.TUser;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import untils.DataSourceUtil;

import java.util.ArrayList;
import java.util.List;


public class TAddressDaoImp implements TAddressDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DataSourceUtil.getDataSource());

    @Override
    public List<TAddress> queryAddress(TUser user, int nowPage, int pageSize) {
        try {
            String sql = "select * from t_address where 1=1 ";
            ArrayList<String> str = new ArrayList<>();
            if (user.getUserId() != 0 && !"".equals(user.getUserId())) {
                sql += "and user_id=?";
                str.add(String.valueOf(user.getUserId()));
            }
            if (nowPage != 0) {
                sql += "limit " + (nowPage - 1) * pageSize + "," + pageSize;
            }
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<TAddress>(TAddress.class), str.toArray());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int add(String addressProvince, String addressCity, String addressDistrict, String addressDescribe, int id) {
        try {
            return jdbcTemplate.update("insert into t_address(address_province,address_city,address_district,address_describe,user_id) values (?,?,?,?,?)", addressProvince, addressCity, addressDistrict, addressDescribe, id);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int del(String id) {
        try {
            return jdbcTemplate.update("delete from t_address where address_id=?", id);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int update(String addressProvince, String addressCity, String addressDistrict, String addressDescribe, String id) {
        try {
            return jdbcTemplate.update("update t_address set address_province=?,address_city=?,address_district=?,address_describe=? where address_id=?", addressProvince, addressCity, addressDistrict, addressDescribe, id);
        } catch (Exception e) {
            return 0;
        }

    }

    //地址实现分页

//    @Override
//    public List<TAddress> sAll(TAddress tAddress, int nowPage, int pageSize) {
//        try {
//            String sql = "select * from t_address where user_id=? ";
//
//            //分页
//            if(nowPage != 0){
//                sql += "limit "+(nowPage-1)*pageSize+","+pageSize;
//            }
//            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<TAddress>(TAddress.class),tAddress.getUserId());
//        } catch (Exception e) {
//            return null;
//        }
//    }
}
