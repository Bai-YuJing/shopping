package entiy;



public class TCategory {

  private String categoryId;
  private String categoryName;


  public String getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(String categoryId) {
    this.categoryId = categoryId;
  }


  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

  @Override
  public String toString() {
    return "TCategory{" +
            "categoryId=" + categoryId +
            ", categoryName='" + categoryName + '\'' +
            '}';
  }
}
