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
 * Created by dell on 2016/10/25.
 */
public class FindPassword {
    private user fpUser = new user();
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

    public void setFpUser(user fpUser) {
        this.fpUser = fpUser;
    }

    public String getFpUsername() {
        return fpUsername;
    }

    public void setFpUsername(String fpUsername) {
        this.fpUsername = fpUsername;
    }

    public user getFpUser() {
        return fpUser;
    }
    public String FindPassword(){
        Connection conn;
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
                return SUCCESS;
            }
        }
        catch(Exception e){
            e.printStackTrace();
            return ERROR;
        }
        tips3 = "用户名不存在。";
        return INPUT;
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
        if (fpUser.getPassword().length() > 20 || fpUser.getPassword().length() < 6) {
            tips3 = "密码的长度为6-20个字符";
            return INPUT;
        }
        if(fpUsername.equals(fpUser.getPassword())) {
            Connection conn;
            try {
                conn = DatabaseConn.getConnection();
                Statement st = conn.createStatement();
                String sql = "UPDATE user SET password ='" + fpUser.getPassword() + "'where username = '" + fpUser.getUsername() + "'";
                st.executeUpdate(sql);
                successTips = "成功找回密码";
                return SUCCESS;
            } catch (Exception e) {
                e.printStackTrace();
                return ERROR;
            }
        }
        else{
            tips3 = "两次输入的密码不一致";
            return INPUT;
        }
    }

}
