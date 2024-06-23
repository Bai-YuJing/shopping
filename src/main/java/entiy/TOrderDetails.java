package entiy;


public class TOrderDetails {

  private long orderDetailsId;
  private String productName;
  private long productNum;
  private double productMoney;
  private long orderId;


  public long getOrderDetailsId() {
    return orderDetailsId;
  }

  public void setOrderDetailsId(long orderDetailsId) {
    this.orderDetailsId = orderDetailsId;
  }


  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }


  public long getProductNum() {
    return productNum;
  }

  public void setProductNum(long productNum) {
    this.productNum = productNum;
  }


  public double getProductMoney() {
    return productMoney;
  }

  public void setProductMoney(double productMoney) {
    this.productMoney = productMoney;
  }


  public long getOrderId() {
    return orderId;
  }

  public void setOrderId(long orderId) {
    this.orderId = orderId;
  }

}
