package action;
import data.User;
import org.DatabaseConn;
import org.UserDao;
import service.SignService;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
/**
 * Created by dell on 2016/10/25.
 */
public class FindPassword {
    private User fpUser = new User();
    private String fpUsername;
    private String tips3;
    private String fpAnswer;
    private String successTips;

    public String getSuccessTips() {
        return successTips;
    }

    public void setFpAnswer(String fpAnswer) {
        this.fpAnswer = fpAnswer;
    }

    public String getFpAnswer() {
        return fpAnswer;
    }

    public void setTips3(String tips3) {
        this.tips3 = tips3;
    }

    public String getTips3() {
        return tips3;
    }

    public void setFpUser(User fpUser) {
        this.fpUser = fpUser;
    }

    public String getFpUsername() {
        return fpUsername;
    }

    public void setFpUsername(String fpUsername) {
        this.fpUsername = fpUsername;
    }

    public User getFpUser() {
        return fpUser;
    }
    public String FindPassword(){
        fpUser = UserDao.findPassword(fpUsername);
        if(fpUser == null) {
            tips3 = "用户名不存在。";
            return INPUT;
        }
        else {
            return SUCCESS;
        }
    }

    public String FindAnswer(){
        if(fpAnswer.equals(fpUser.getAnswer())){
            return SUCCESS;
        }
        else{
            tips3 = "回答错误";
            return INPUT;
        }
    }

    public String Editpassword() {
        if (!SignService.checkLength(fpUser.getPassword())) {
            tips3 = "密码的长度为6-20个字符";
            return INPUT;
        }
        if(SignService.passwordCompare(fpUsername, fpUser.getPassword())) {
            UserDao.findAndChangePassword(fpUser);
            successTips = "成功找回密码";
            return SUCCESS;

        }
        else{
            tips3 = "两次输入的密码不一致";
            return INPUT;
        }
    }

}
