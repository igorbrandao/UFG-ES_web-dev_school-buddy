package dao;

import entity.User;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import java.util.List;
import java.util.Vector;

public class UserDAO {

    private static SessionFactory factory = new Configuration().configure().buildSessionFactory();

    public Integer newUser(Integer enrollment, String user_type, String email, String password, String name, String address, String phone){

        Transaction transact = null;
        Integer userID = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            User user = new User(enrollment, user_type, email, password, name, address, phone);
            userID = (Integer) session.save(user);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null) {
                transact.rollback();
            }
            e.printStackTrace();
        }
        return userID;
    }

    public List<User> listUsers(){

        List<User> users = new Vector<>();
        Transaction transact = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            for (Object aUser : session.createQuery("FROM users").list()) {
                users.add((User)aUser);
            }
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
        return users;
    }

    public void updateUser(Integer enrollment, User newUser){

        Transaction transact = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            User user = session.get(User.class, enrollment);
            user.setEmail(newUser.getEmail());
            user.setName(newUser.getName());
            user.setAddress(newUser.getAddress());
            user.setPhone(newUser.getPhone());
            session.update(user);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteEmployee(Integer enrollment){

        Transaction transact = null;
        try (Session session = factory.openSession()) {
            transact = session.beginTransaction();
            User user = session.get(User.class, enrollment);
            session.delete(user);
            transact.commit();
        } catch (HibernateException e) {
            if (transact != null){
                transact.rollback();
            }
            e.printStackTrace();
        }
    }

}
