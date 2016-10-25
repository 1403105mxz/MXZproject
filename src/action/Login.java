package action;
import data.user;
import org.DatabaseConn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;

/**
 * Created by dell on 2016/10/24.
 */
public class Login {
    private String username;
    private String password;
    private user User = new user();
    private String tips ="";

    public void setTips(String tips) {
        this.tips = tips;
    }

    public String getTips() {
        return tips;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setUser(user user) {
        User = user;
    }

    public user getUser() {
        return User;
    }

    public String login(){
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user");
            while(rs.next()){
                if (username.equals(rs.getString(1))){
                    if(password.equals((rs.getString(2)))){
                        User.setUsername(rs.getString(1));
                        User.setPassword(rs.getString(2));
                        User.setName(rs.getString(3));
                        User.setId(rs.getInt(4));
                        User.setQuestion(rs.getString(5));
                        User.setAnswer( rs.getString(6));
                        return SUCCESS;
                    }
                    else
                    {
                        tips = "用户名或密码错误。";
                        return INPUT;
                    }
                }
            }
            tips = "用户名或密码错误。";
            return INPUT;
        }
        catch(Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }
}
