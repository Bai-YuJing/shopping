package dao.imp;

import dao.TUserDao;
import entiy.TUser;
import entiy.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import untils.DataSourceUtil;

import java.util.ArrayList;
import java.util.List;

public class TUserDaoImp implements TUserDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DataSourceUtil.getDataSource());
    @Override
    public List<TUser> selectAll() {
        try {
            return jdbcTemplate.query("select * from t_user",new BeanPropertyRowMapper<TUser>(TUser.class));
        }catch (Exception e){
            return null;
    }
    }

    @Override
    public TUser login(TUser user) {
        try {
            return jdbcTemplate.queryForObject("select * from t_user where user_tel=?", new BeanPropertyRowMapper<TUser>(TUser.class),user.getUserTel());
        }catch (Exception e){
            return null;
        }
       }

    @Override
    public int register(TUser user) {
        try {
            return jdbcTemplate.update("insert into t_user(user_tel,user_pwd,user_name,user_sex) values(?,?,?,?)", user.getUserTel(), user.getUserPwd(), user.getUserName(), user.getUserSex());
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int updateUserNameandSex(TUser user) {
        try {
            return jdbcTemplate.update("update t_user set user_name=?,user_sex=? where user_id=?", user.getUserName(), user.getUserSex(), user.getUserId());
        } catch (Exception e) {
            return 0;
        }
    }


    @Override
    public int updateUserPassword(TUser user) {
        try {
            return jdbcTemplate.update("update t_user set user_pwd=? where user_id=?", user.getUserPwd(), user.getUserId());
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public List<User> All(User user, int nowPage, int pageSize) {
        try {
            String sql = "select * from t_user where 1=1 ";

            //查询参数集合
            ArrayList<String> str = new ArrayList<>();
            //查询条件
            if(user.getUserTel() != null && !"".equals(user.getUserTel())){
                sql +="and user_tel = ? ";
                str.add(user.getUserTel());
            }

            if(user.getUserName() != null && !"".equals(user.getUserName())){
                sql +="and user_name like ? ";
                str.add("%"+user.getUserName()+"%");
            }

            if(user.getAddTime() != null && !"".equals(user.getAddTime())){
                sql +="and add_time >= ? ";
                str.add(user.getAddTime());
            }
            if(user.getAddTimeEnd() != null && !"".equals(user.getAddTimeEnd())){
                sql +="and add_time <= ? ";
                str.add(user.getAddTimeEnd());
            }

            //分页
            if(nowPage != 0){
                sql += "limit "+(nowPage-1)*pageSize+","+pageSize;
            }
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class),str.toArray());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int updateUserStatus(String type,String id) {
        try {
            return jdbcTemplate.update("update t_user set user_status=? where user_id=?",type, id);
        } catch (Exception e) {
            return 0;
        }
    }
}
