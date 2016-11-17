package action;
import data.User;
import org.DatabaseConn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
import service.SignService;
import org.UserDao;
/**
 * Created by dell on 2016/10/25.
 */
public class Register {
    private User signinUser = new User();
    private String signinPassword;
    private String tips2 = "";
    private String successTips = "";

    public String getSuccessTips() {
        return successTips;
    }

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

    public void setSigninUser(User signinUser) {
        this.signinUser = signinUser;
    }

    public User getSigninUser() {
        return signinUser;
    }
    public String register(){
        int num = 1 ;
        if (!SignService.checkLength(signinUser.getUsername())) {
            tips2 = "用户名的长度为6-20个字符";
            return INPUT;
        }
        if (!SignService.checkLength(signinUser.getPassword())) {
            tips2 = "密码的长度为6-20个字符";
            return INPUT;
        }
        if (!SignService.passwordCompare(signinUser.getPassword(), signinPassword)) {
            tips2 = "两次输入的密码不一致";
            return INPUT;
        }
        if (!SignService.checkNameLength(signinUser.getName())) {
            tips2 = "姓名的长度为2-20个字符";
            return INPUT;
        }
        if(!SignService.duplicateDetection(signinUser.getUsername())){
            tips2 = "用户名已存在";
            return INPUT;
        }
        UserDao.Register(signinUser, num);
        successTips = "注册成功";
        return SUCCESS;
    }
}
