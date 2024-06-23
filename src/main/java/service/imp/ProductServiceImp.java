package service.imp;

import dao.ProductDao;
import dao.imp.ProductDaoImp;
import entiy.Product;
import service.ProductService;

import java.util.List;

public class ProductServiceImp implements ProductService {
    ProductDao pd= new ProductDaoImp();
    @Override
    public List<Product> selectProduct() {
        return pd.selectProduct();
    }

    @Override
    public int save(Product product) {
        return pd.save(product);
    }

    @Override
    public List<Product> All(Product product, int nowPage, int pageSize) {
        return pd.All(product,nowPage,pageSize);
    }

    @Override
    public int del(String id) {
        return pd.del(id);
    }

    @Override
    public int updateproductStatus(String type, String id) {
        return pd.updateproductStatus(type,id);
    }
}
