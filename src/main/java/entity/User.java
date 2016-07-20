package entity;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="user_enrollment")
    @SequenceGenerator(name="user_enrollment", initialValue=2, sequenceName="USERS_ID_SEQUENCE", allocationSize=1)
    private Integer pk_enrollment;
    private String user_type;
    private String email;
    private String hash;
    private String name;
    private String address;
    private String phone;

    public User(String user_type, String email, String hash, String name, String address, String phone) {
        this.user_type = user_type;
        this.email = email;
        this.hash = hash;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public User() {
    }

    public Integer getPk_enrollment() {
        return pk_enrollment;
    }

    public void setPk_enrollment(Integer pk_enrollment) {
        this.pk_enrollment = pk_enrollment;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
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

    public void setHash(String hash) {
        this.hash = hash;
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