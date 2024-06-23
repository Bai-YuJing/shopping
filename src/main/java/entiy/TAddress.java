package entiy;



public class TAddress {

  private long addressId;
  private String addressProvince;
  private String addressCity;
  private String addressDistrict;
  private String addressDescribe;
  private long userId;


  public long getAddressId() {
    return addressId;
  }

  public void setAddressId(long addressId) {
    this.addressId = addressId;
  }


  public String getAddressProvince() {
    return addressProvince;
  }

  public void setAddressProvince(String addressProvince) {
    this.addressProvince = addressProvince;
  }


  public String getAddressCity() {
    return addressCity;
  }

  public void setAddressCity(String addressCity) {
    this.addressCity = addressCity;
  }


  public String getAddressDistrict() {
    return addressDistrict;
  }

  public void setAddressDistrict(String addressDistrict) {
    this.addressDistrict = addressDistrict;
  }


  public String getAddressDescribe() {
    return addressDescribe;
  }

  public void setAddressDescribe(String addressDescribe) {
    this.addressDescribe = addressDescribe;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }

  @Override
  public String toString() {
    return "TAddress{" +
            "addressId=" + addressId +
            ", addressProvince='" + addressProvince + '\'' +
            ", addressCity='" + addressCity + '\'' +
            ", addressDistrict='" + addressDistrict + '\'' +
            ", addressDescribe='" + addressDescribe + '\'' +
            ", userId=" + userId +
            '}';
  }
}
