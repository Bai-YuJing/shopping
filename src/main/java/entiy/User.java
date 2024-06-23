package entiy;

public class User {
    private Integer userId;
    private String userTel;
    private String userPwd;
    private String userName;
    private String userSex;
    private String addTime;
    private String addTimeEnd;
    private String userStatus;
    private String userRole;

    public User() {
    }

    public User(Integer userId, String userTel, String userPwd, String userName, String userSex, String addTime, String userStatus, String userRole) {
        this.userId = userId;
        this.userTel = userTel;
        this.userPwd = userPwd;
        this.userName = userName;
        this.userSex = userSex;
        this.addTime = addTime;
        this.userStatus = userStatus;
        this.userRole = userRole;
    }

    public User(Integer userId, String userTel, String userPwd, String userName, String userSex, String addTime, String addTimeEnd, String userStatus, String userRole) {
        this.userId = userId;
        this.userTel = userTel;
        this.userPwd = userPwd;
        this.userName = userName;
        this.userSex = userSex;
        this.addTime = addTime;
        this.addTimeEnd = addTimeEnd;
        this.userStatus = userStatus;
        this.userRole = userRole;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getAddTimeEnd() {
        return addTimeEnd;
    }

    public void setAddTimeEnd(String addTimeEnd) {
        this.addTimeEnd = addTimeEnd;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userTel='" + userTel + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userName='" + userName + '\'' +
                ", userSex='" + userSex + '\'' +
                ", addTime='" + addTime + '\'' +
                ", addTimeEnd='" + addTimeEnd + '\'' +
                ", userStatus='" + userStatus + '\'' +
                ", userRole='" + userRole + '\'' +
                '}';
    }
}

