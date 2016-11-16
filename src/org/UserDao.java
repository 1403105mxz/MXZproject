package org;

import data.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;

/**
 * Created by dell on 2016/11/16.
 */
public class UserDao {
    public static ResultSet selectUser() {
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user");
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void Register(User signinUser, int num){
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "INSERT INTO user (username, password, name, id, question, answer) VALUES " +
                    "('"+signinUser.getUsername()+"','"+signinUser.getPassword()+"','"+signinUser.getName()+"','"+num
                    +"','"+signinUser.getQuestion()+"','"+signinUser.getAnswer()+"')";
            st.executeUpdate(sql);
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static List<User> getBranch(int id) {
        Connection conn;
        List<User> branch = new ArrayList<>();
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user");
            while (rs.next()) {
                if (rs.getInt(4) < id) {
                    User temp = new User();
                    temp.setUsername(rs.getString(1));
                    temp.setPassword(rs.getString(2));
                    temp.setName(rs.getString(3));
                    temp.setId(rs.getInt(4));
                    temp.setQuestion(rs.getString(5));
                    temp.setAnswer(rs.getString(6));
                    branch.add(temp);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return branch;
    }

    public static void changeID(int newpower, String changep){
        try{
            Connection conn;
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE user SET id ='" + newpower + "'where username = '" + changep + "'";
            st.executeUpdate(sql);
            }catch(Exception e){
                e.printStackTrace();
        }
    }

    public static void changePassword(String Editpassword, String username) {
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE user SET password ='" + Editpassword + "'where username = '" + username+"'";
            st.executeUpdate(sql);
            HttpServletRequest request = ServletActionContext.getRequest();
            request.getSession().setAttribute("newpassword",Editpassword);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void changeName(String Editname, String username) {
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE user SET name ='" + Editname + "'where username = '" + username+"'";
            st.executeUpdate(sql);
            HttpServletRequest request = ServletActionContext.getRequest();
            request.getSession().setAttribute("newname",Editname);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static User findPassword(String fpUsername){
        Connection conn;
        User fpUser = new User();
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user");
            while(rs.next()){
                if (!fpUsername.equals(rs.getString(1))) {
                    continue;
                }
                fpUser.setUsername(rs.getString(1));
                fpUser.setPassword(rs.getString(2));
                fpUser.setName(rs.getString(3));
                fpUser.setId(rs.getInt(4));
                fpUser.setQuestion(rs.getString(5));
                fpUser.setAnswer( rs.getString(6));
                return fpUser;
            }
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public static void findAndChangePassword(User fpUser){
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE user SET password ='" + fpUser.getPassword() + "'where username = '" + fpUser.getUsername() + "'";
            st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
