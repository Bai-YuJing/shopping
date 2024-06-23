package entiy;


public class Product {

  private String productId;
  private String productName;
  private String productPic;
  private String productPrice;
  private String productDescribe;
  private String categoryId;
  private String productStatus;


    public Product(String productId, String productName, String productPic, String productPrice, String productDescribe, String categoryId, String productStatus) {
        this.productId = productId;
        this.productName = productName;
        this.productPic = productPic;
        this.productPrice = productPrice;
        this.productDescribe = productDescribe;
        this.categoryId = categoryId;
        this.productStatus = productStatus;
    }

    public Product() {
    }

    public String getProductId() {
    return productId;
  }

  public void setProductId(String productId) {
    this.productId = productId;
  }


  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }


  public String getProductPic() {
    return productPic;
  }

  public void setProductPic(String productPic) {
    this.productPic = productPic;
  }


  public String getProductPrice() {
    return productPrice;
  }

  public void setProductPrice(String productPrice) {
    this.productPrice = productPrice;
  }


  public String getProductDescribe() {
    return productDescribe;
  }

  public void setProductDescribe(String productDescribe) {
    this.productDescribe = productDescribe;
  }


  public String getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(String categoryId) {
    this.categoryId = categoryId;
  }


  public String getProductStatus() {
    return productStatus;
  }

  public void setProductStatus(String productStatus) {
    this.productStatus = productStatus;
  }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productPic='" + productPic + '\'' +
                ", productPrice=" + productPrice +
                ", productDescribe='" + productDescribe + '\'' +
                ", categoryId=" + categoryId +
                ", productStatus='" + productStatus + '\'' +
                '}';
    }
}
