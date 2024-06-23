package dao;

import entiy.Cart;
import entiy.CartProduct;

import java.util.List;


public interface CartDao {
    /**
     * 增加
     */

    int addCart(Cart cart);

    /**
     * 修改购物车信息
     */
    int updateCart(Cart cart);


    /**
     * 根据商品编号和用户信息获取购物车信息
     */
    Cart getCartById(Cart cart);


    /**
     * 获取当前用户购物车的所有信息
     *
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


    /**
     *  左侧菜单分页
     */
//    List<TAddress> queryAddress(TUser user, int nowPage, int pageSize);

}
