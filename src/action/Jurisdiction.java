package action;

import data.user;
import org.DatabaseConn;
import org.apache.struts2.ServletActionContext;
import org.omg.PortableInterceptor.SUCCESSFUL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;

/**
 * Created by dell on 2016/11/12.
 */
public class Jurisdiction {
    private List<user> branch;
    private String tips4 = "";
    private int newpower = 0;
    private String changep;
    private String high;

    public String getHigh() {
        return high;
    }

    public void setHigh(String high) {
        this.high = high;
    }

    public int getNewpower() {
        return newpower;
    }

    public String getChangep() {
        return changep;
    }

    public String getTips4() {
        return tips4;
    }

    public void setChangep(String changep) {
        this.changep = changep;
    }

    public void setNewpower(int newpower) {
        this.newpower = newpower;
    }

    public void setTips4(String tips4) {
        this.tips4 = tips4;
    }

    public List<user> getBranch() {
        return branch;
    }

    public void setBranch(List<user> branch) {
        this.branch = branch;
    }

    public String showbranch() {
        Connection conn;
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            int id = (int)session.getAttribute("newid");
            if (id == 1){
                tips4 = "你的权限无法进行此操作。";
                return INPUT;
            }
            branch = new ArrayList<>();
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user");
            while (rs.next()){
                if (rs.getInt(4) < id){
                    user temp = new user();
                    temp.setUsername(rs.getString(1));
                    temp.setPassword(rs.getString(2));
                    temp.setName(rs.getString(3));
                    temp.setId(rs.getInt(4));
                    temp.setQuestion(rs.getString(5));
                    temp.setAnswer(rs.getString(6));
                    branch.add(temp);
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String changeid(){
        Connection conn;
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int id = (int)session.getAttribute("newid");
        String password = (String)session.getAttribute("newpassword");
        if(!high.equals(password)){
            tips4 = "密码不正确";
            return INPUT;
        }
        if (newpower >= id || newpower <= 0) {
            tips4 = "新的权限等级不可以小于0也不可以大于你自身的等级";
            return INPUT;
        }
        try {
            branch = new ArrayList<>();
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE user SET id ='" + newpower + "'where username = '" + changep + "'";
            st.executeUpdate(sql);
            Statement st2 = conn.createStatement();
            ResultSet rs = st2.executeQuery("SELECT * FROM user");
            while (rs.next()){
                if (rs.getInt(4) < id){
                    user temp = new user();
                    temp.setUsername(rs.getString(1));
                    temp.setPassword(rs.getString(2));
                    temp.setName(rs.getString(3));
                    temp.setId(rs.getInt(4));
                    temp.setQuestion(rs.getString(5));
                    temp.setAnswer(rs.getString(6));
                    branch.add(temp);
                }
            }
            return SUCCESS;
        }
        catch(Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String gotochangeid(){
        return SUCCESS;
    }

}
