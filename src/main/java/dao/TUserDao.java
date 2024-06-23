package dao;

import entiy.TUser;
import entiy.User;

import java.util.List;


public interface TUserDao {
    /**
     *
     * 查询TUser的数据
     */
    List<TUser> selectAll();


    /**
     * 用户登录
     */
    TUser login(TUser user);



    /**
     * 用户注册
     * @return
     */
    int register(TUser tUser);


    /**
     * 修改姓名/性别
     */
    int updateUserNameandSex(TUser user);


    /**
     *修改密码
     */
    int updateUserPassword(TUser user);


    /**
     * 根据条件查询实现分页
     */
    List<User> All(User user, int nowPage, int pageSize);

    /**
     * 修改状态
     */
    int updateUserStatus(String type,String id);
}
