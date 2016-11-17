package service;

import java.sql.ResultSet;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;

import data.User;
import org.UserDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by dell on 2016/11/16.
 */
public class SignService {

    public static boolean checkLength(String password) {
        if (password == null || (password.length() > 20 || password.length() < 6)){
            return false;
        }
        return true;
    }

    public static boolean passwordCompare(String originPassword, String newPawword) {
        if (originPassword != null && originPassword.equals(newPawword)) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean checkNameLength(String name){
        if (name == null || (name.length() > 20 || name.length() < 2)){
            return false;
        }
        return true;
    }

    public static boolean duplicateDetection(String username){
        ResultSet rs = UserDao.selectUser();
        try {
            while (rs.next()) {
                if (username.equals(rs.getString(1))) {
                    return false;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static User signCheck(String username, String password) {
        try {
            ResultSet rs = UserDao.selectUser();
            User user = new User();
            while (rs.next()) {
                if (username.equals(rs.getString(1))) {
                    if (password.equals((rs.getString(2)))) {
                        user.setUsername(rs.getString(1));
                        user.setPassword(rs.getString(2));
                        user.setName(rs.getString(3));
                        user.setId(rs.getInt(4));
                        user.setQuestion(rs.getString(5));
                        user.setAnswer(rs.getString(6));
                        HttpServletRequest request = ServletActionContext.getRequest();
                        request.getSession().setAttribute("newusername", username);     //用Session保存用户名
                        request.getSession().setAttribute("newpassword", password);
                        request.getSession().setAttribute("newname", user.getName());
                        request.getSession().setAttribute("newid", user.getId());
                        request.getSession().setAttribute("newquestion", user.getQuestion());
                        request.getSession().setAttribute("newanswer", user.getAnswer());
                        return user;
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }


}

