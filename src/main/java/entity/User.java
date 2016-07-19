package entity;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    private Integer pk_enrollment;
    private String user_type;
    private String email;
    private String hash;
    private String name;
    private String address;
    private String phone;

    public User() {
    }

    public User(Integer pk_enrollment, String user_type, String email, String hash, String name, String address, String phone) {
        this.pk_enrollment = pk_enrollment;
        this.user_type = user_type;
        this.email = email;
        this.hash = hash;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public Integer getPk_enrollment() {
        return pk_enrollment;
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

    public String getHash() {
        return hash;
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
