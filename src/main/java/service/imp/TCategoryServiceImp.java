package service.imp;

import dao.TCategoryDao;
import dao.imp.TCategoryDaoImp;
import entiy.TCategory;
import service.TCategoryService;

import java.util.List;

public class TCategoryServiceImp implements TCategoryService {
    TCategoryDao tcd = new TCategoryDaoImp();

    @Override
    public List<TCategory> queryAddress(TCategory tcategory, int nowPage, int pageSize) {
        return tcd.queryAddress(tcategory,nowPage,pageSize);
    }

    @Override
    public int add(String name, String id) {
        return tcd.add(name,id);
    }

    @Override
    public int del(String id) {
        return tcd.del(id);
    }

    @Override
    public int update(String name, String id) {
        return tcd.update(name,id);
    }
}
