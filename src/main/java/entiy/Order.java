package entiy;


import java.util.List;


public class Order {

    private String userName;
    private Integer orderId;
    private String addTime;
    private String addTimeEnd;
    private String updateTime;
    private Integer userId;
    private String addressDetails;
    private Integer orderType;
    private Double sum;

    private List<OrderDetails> orderDetails;

    public Order() {

    }

    public List<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddTimeEnd() {
        return addTimeEnd;
    }

    public void setAddTimeEnd(String addTimeEnd) {
        this.addTimeEnd = addTimeEnd;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public void setOrderDetails(List<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public Order(Integer orderId, String addTime, String updateTime, Integer userId, String addressDetails, Integer orderType) {
        this.orderId = orderId;
        this.addTime = addTime;
        this.updateTime = updateTime;
        this.userId = userId;
        this.addressDetails = addressDetails;
        this.orderType = orderType;
    }

    @Override
    public String toString() {
        return "Order{" +
                "userName='" + userName + '\'' +
                ", orderId=" + orderId +
                ", addTime='" + addTime + '\'' +
                ", addTimeEnd='" + addTimeEnd + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", userId=" + userId +
                ", addressDetails='" + addressDetails + '\'' +
                ", orderType=" + orderType +
                ", sum=" + sum +
                ", orderDetails=" + orderDetails +
                '}';
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAddressDetails() {
        return addressDetails;
    }

    public void setAddressDetails(String addressDetails) {
        this.addressDetails = addressDetails;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    public Order(Integer userId, String addressDetails) {
        this.userId = userId;
        this.addressDetails = addressDetails;

    }
}
