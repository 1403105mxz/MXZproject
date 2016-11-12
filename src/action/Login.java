package action;
import com.opensymphony.xwork2.ActionContext;
import data.user;
import org.DatabaseConn;
import org.apache.struts2.ServletActionContext;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;

/**
 * Created by dell on 2016/10/24.
 */
public class Login {
    private String username;
    private String password;
    private user User;
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
            User = new user();
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
                        HttpServletRequest request = ServletActionContext.getRequest();
                        request.getSession().setAttribute("newusername",username);     //用Session保存用户名
                        request.getSession().setAttribute("newpassword",password);
                        request.getSession().setAttribute("newname",User.getName());
                        request.getSession().setAttribute("newid",User.getId());
                        request.getSession().setAttribute("newquestion",User.getQuestion());
                        request.getSession().setAttribute("newanswer",User.getAnswer());
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

    public String logout(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.invalidate();
        return SUCCESS;
    }
}
