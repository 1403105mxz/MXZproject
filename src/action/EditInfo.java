package action;
import org.DatabaseConn;
import org.UserDao;
import org.apache.struts2.ServletActionContext;
import service.SignService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.Statement;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
/**
 * Created by 59783 on 2016/11/14.
 */
public class EditInfo {
    private String Editname;
    private String Editpassword;
    private String Editpassword2;
    private String Oldpassword;
    private String tip;

    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEditpassword2() {
        return Editpassword2;
    }

    public void setEditpassword2(String editpassword2) {
        Editpassword2 = editpassword2;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getEditname() {
        return Editname;
    }

    public String getEditpassword() {
        return Editpassword;
    }


    public String getOldpassword() {
        return Oldpassword;
    }

    public void setEditname(String editname) {
        Editname = editname;
    }

    public void setEditpassword(String editpassword) {
        Editpassword = editpassword;
    }


    public void setOldpassword(String oldpassword) {
        Oldpassword = oldpassword;
    }

    public String editPassword() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        username = (String) session.getAttribute("newusername");
        String temp = (String) session.getAttribute("newpassword");
        if (!SignService.passwordCompare(temp, Oldpassword)) {
            tip = "1";
            return INPUT;
        }
        if (!SignService.checkLength(Editpassword)) {
            tip = "密码的长度为6-20个字符";
            return INPUT;
        }
        if (!SignService.passwordCompare(Editpassword2, Editpassword)) {
            tip = "2";
            return INPUT;
        }
        UserDao.changePassword(Editpassword, username);
        return SUCCESS;
    }

    public String editName() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        username = (String) session.getAttribute("newusername");
        if (!SignService.checkNameLength(Editname)) {
            tip = "姓名的长度为2-20个字符";
            return INPUT;
        }
        UserDao.changeName(Editname, username);
       return SUCCESS;
    }
}






