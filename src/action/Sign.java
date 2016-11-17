package action;
import data.User;
import org.DatabaseConn;
import org.apache.struts2.ServletActionContext;
import service.SignService;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
import static service.SignService.signCheck;

/**
 * Created by dell on 2016/10/24.
 */
public class Sign {
    private String username;
    private String password;
    private User user;
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

    public void setUser(User user) {
        user = user;
    }

    public User getUser() {
        return user;
    }

    public String signIn(){
        user = signCheck(username, password);
        if(user == null){
            tips = "用户名或密码错误";
            return INPUT;
        }
        else{
            return SUCCESS;
        }
    }

    public String signOut(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.invalidate();
        return SUCCESS;
    }
}
