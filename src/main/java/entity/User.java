package entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

    private final Integer enrollment;
    private final String user_type;
    private String email;
    private final String password;
    private String name;
    private String address;
    private String phone;

    public User(Integer enrollment, String user_type, String email, String password, String name, String address, String phone) {
        this.enrollment = enrollment;
        this.user_type = user_type;
        this.email = email;
        this.password = password;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public int getEnrollment() {
        return enrollment;
    }

    public String getUser_type() {
        return user_type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
