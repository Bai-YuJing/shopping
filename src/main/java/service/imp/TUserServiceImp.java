package service.imp;

import dao.TUserDao;
import dao.imp.TUserDaoImp;
import entiy.TUser;
import entiy.User;
import service.TUserService;

import java.util.List;

public class TUserServiceImp implements TUserService {
    TUserDao td=new TUserDaoImp();

    @Override
    public List<TUser> selectAll() {
        return td.selectAll();
    }

    @Override
    public TUser login(TUser user) {
        return td.login(user);
    }

    @Override
    public int register(TUser user) {
        return td.register(user);
    }

    @Override
    public int updateUserNameandSex(TUser user) {
        return td.updateUserNameandSex(user);
    }

    @Override
    public int updateUserPassword(TUser user) {
        return td.updateUserPassword(user);
    }

    @Override
    public List<User> All(User user, int nowPage, int pageSize) {
        return td.All(user,nowPage,pageSize);
    }

    @Override
    public int updateUserStatus(String type,String id) {
        return td.updateUserStatus(type,id);
    }


}
