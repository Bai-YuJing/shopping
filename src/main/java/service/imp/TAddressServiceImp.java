package service.imp;

import dao.TAddressDao;
import dao.imp.TAddressDaoImp;
import entiy.TAddress;
import entiy.TUser;
import service.TAddressService;

import java.util.List;


public class TAddressServiceImp implements TAddressService {
    TAddressDao td= new TAddressDaoImp();

    @Override
    public List<TAddress> queryAddress(TUser user,int nowPage, int pageSize) {

        return td.queryAddress(user,nowPage,pageSize);
    }

    @Override
    public int add(String addressProvince, String addressCity, String addressDistrict, String addressDescribe, int id) {
        return td.add(addressProvince,addressCity,addressDistrict,addressDescribe,id);
    }

    @Override
    public int del(String id) {
        return td.del(id);
    }

    @Override
    public int update(String addressProvince, String addressCity, String addressDistrict, String addressDescribe, String id) {
        return td.update(addressProvince,addressCity,addressDistrict,addressDescribe,id);
    }
}
