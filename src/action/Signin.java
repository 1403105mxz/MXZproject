package action;
import data.user;
import org.DatabaseConn;
import action.Login;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
/**
 * Created by dell on 2016/10/25.
 */
public class Signin {
    private user signinUser = new user();
    private String signinPassword;
    private String tips2 = "";

    public void setTips2(String tips2) {
        this.tips2 = tips2;
    }

    public String getTips2() {
        return tips2;
    }

    public void setSigninPassword(String signinPassword) {
        this.signinPassword = signinPassword;
    }

    public String getSigninPassword() {
        return signinPassword;
    }

    public void setSigninUser(user signinUser) {
        this.signinUser = signinUser;
    }

    public user getSigninUser() {
        return signinUser;
    }
    public String sign(){
        Connection conn;

        int num = 1 ;
        try {
            if (signinUser.getUsername().length() > 20 || signinUser.getUsername().length() < 6) {
                tips2 = "用户名的长度为6-20个字符";
                return INPUT;
            }
            if (signinUser.getPassword().length() > 20 || signinUser.getPassword().length() < 6) {
                tips2 = "密码的长度为6-20个字符";
                return INPUT;
            }
            if (!signinUser.getPassword().equals(signinPassword)) {
                tips2 = "两次输入的密码不一致";
                return INPUT;
            }
            if (signinUser.getName().length() > 20 || signinUser.getName().length() < 2) {
                tips2 = "姓名的长度为2-20个字符";
                return INPUT;
            }
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            Statement st2 = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user");
            while(rs.next()){
                if (signinUser.getUsername().equals(rs.getString(1))){
                    tips2 = "用户名已存在。";
                    return INPUT;
                }
            }
            String sql = "INSERT INTO user (username, password, name, id, question, answer) VALUES " +
                    "('"+signinUser.getUsername()+"','"+signinUser.getPassword()+"','"+signinUser.getName()+"','"+num
                    +"','"+signinUser.getQuestion()+"','"+signinUser.getAnswer()+"')";
            st2.executeUpdate(sql);
            return SUCCESS;
        }
        catch(Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }
}
