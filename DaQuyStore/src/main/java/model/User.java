package model;

import java.sql.Date;

public class User {

    private String id;
    private String userName;
    private String password;
    private String fullName;
    private String gender;
    private String email;
    private String phone;
    private String avatar;
    private Date create_at;
    private Date update_at;
    private Date delete_at;
    private String status;
    private String role;
    private String address;
    private Date birthday;
    private String type_login;

    public User(String id, String userName, String password,String fullName,String gender, String email, String phone,
                String avatar, Date create_at, Date update_at, Date delete_at,String status, String role,
                String address, Date birthday, String type_login) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.avatar = avatar;
        this.create_at = create_at;
        this.update_at = update_at;
        this.delete_at = delete_at;
        this.status=status;
        this.role = role;
        this.address = address;
        this.birthday = birthday;
        this.type_login = type_login;
    }

    public User(String userName, String password, String role){
        this.userName = userName;
        this.password = password;
        this.role = role;
    }
    // register user
    public User( String userName, String password, String email, String customer) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.fullName = "";
        this.gender = "";
        this.email = email;
        this.phone = "";
        this.avatar = "";
        this.status="";
        this.role = customer;
        this.address = "";
        this.type_login = "";
    }

    public User(String userName, String password, String email,String gender, String fullname, String date, String phone, String address, String customer) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.fullName =fullname;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.avatar = "";
        this.status="";
        this.role = customer;
        this.address = address;
        this.type_login = "web";
    }

    public String getUserName() {
        return userName;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public java.sql.Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public java.sql.Date getUpdate_at() {
        return  update_at;
    }

    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }

    public Date getDelete_at() {
        return delete_at;
    }

    public void setDelete_at(Date delete_at) {
        this.delete_at = delete_at;
    }

    public String getType_login() {
        return type_login;
    }

    public void setType_login(String type_login) {
        this.type_login = type_login;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", avatar='" + avatar + '\'' +
                ", create_at=" + create_at +
                ", update_at=" + update_at +
                ", delete_at=" + delete_at +
                ", status='" + status + '\'' +
                ", role='" + role + '\'' +
                ", address='" + address + '\'' +
                ", birthday=" + birthday +
                ", type_login='" + type_login + '\'' +
                "} \n\n";
    }
}
 enum role {
    admin, user
}
 enum gender{
    nu,nam
}
enum typeLogin{
    google, web, facebook
}
