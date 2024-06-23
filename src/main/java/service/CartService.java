package service;

import entiy.Cart;
import entiy.CartProduct;

import java.util.List;


public interface CartService {
    /**
     * 增加
     */

    int addCart(Cart cart);


    /**
     * 获取当前用户购物车的所有信息
     * @param cartProduct
     * @return
     */
    List<CartProduct> getCart(CartProduct cartProduct);

    /**
     *购物车的数量加或者减
     */

    int addAndred(String num ,String cid);

    /**
     * 清空购物车
     */
    int cartDel(String uid);
}
