package service.imp;

import dao.CartDao;
import dao.imp.CartDaoImpl;
import entiy.Cart;
import entiy.CartProduct;
import service.CartService;

import java.util.List;


public class CartServiceImpl implements CartService {
    CartDao cd = new CartDaoImpl();

    @Override
    public int addCart(Cart cart) {
        Cart c = cd.getCartById(cart);
        if (c != null) {
            c.setProductNum(c.getProductNum() + cart.getProductNum());
            return cd.updateCart(c);
        } else {
            return cd.addCart(cart);
        }


    }

    @Override
    public List<CartProduct> getCart(CartProduct cartProduct) {
        return cd.getCart(cartProduct);
    }

    @Override
    public int addAndred(String num ,String cid) {
        return cd.addAndred(num,cid);
    }

    @Override
    public int cartDel(String uid) {
        return cd.cartDel(uid);
    }
}
