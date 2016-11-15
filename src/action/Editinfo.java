package action;
import data.user;
import org.DatabaseConn;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
/**
 * Created by 59783 on 2016/11/14.
 */
public class Editinfo {
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

    public String Editpassword() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        username = (String) session.getAttribute("newusername");
        String temp = (String) session.getAttribute("newpassword");
        if (!temp.equals(Oldpassword)) {
            tip = "原密码错误！";
            return INPUT;
        }
        if (Oldpassword.length() > 20 || Oldpassword.length() < 6) {
            tip = "密码的长度为6-20个字符";
            return INPUT;
        }
        if (!Editpassword.equals(Editpassword2)) {
            tip = "两次输入的密码不一致";
            return INPUT;
        }
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE user SET password ='" + Editpassword + "'where username = '" + username+"'";
            st.executeUpdate(sql);
            request.getSession().setAttribute("newpassword",Editpassword);
            tip = "修改成功";
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String Editname() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        username = (String) session.getAttribute("newusername");
        if (Editname.length() > 20 || Editname.length() < 2) {
            tip = "姓名的长度为2-20个字符";
            return INPUT;
        }
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE user SET name ='" + Editname + "'where username = '" + username+"'";
            st.executeUpdate(sql);
            request.getSession().setAttribute("newname",Editname);
            tip = "修改成功";
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }
}






