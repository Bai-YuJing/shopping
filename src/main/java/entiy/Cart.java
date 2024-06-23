package entiy;



public class Cart {

  private long cartId;
  private long productId;
  private long productNum;
  private long userId;

  public Cart() {
  }

  public Cart(long cartId, long productId, long productNum, long userId) {
    this.cartId = cartId;
    this.productId = productId;
    this.productNum = productNum;
    this.userId = userId;
  }

  public long getCartId() {
    return cartId;
  }

  public void setCartId(long cartId) {
    this.cartId = cartId;
  }


  public long getProductId() {
    return productId;
  }

  public void setProductId(long productId) {
    this.productId = productId;
  }


  public long getProductNum() {
    return productNum;
  }

  public void setProductNum(long productNum) {
    this.productNum = productNum;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }

  @Override
  public String toString() {
    return "Cart{" +
            "cartId=" + cartId +
            ", productId=" + productId +
            ", productNum=" + productNum +
            ", userId=" + userId +
            '}';
  }
}
