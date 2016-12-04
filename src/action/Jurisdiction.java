package action;

import data.Invoice;
import data.User;
import org.DatabaseConn;
import org.UserDao;
import org.apache.struts2.ServletActionContext;
import service.SignService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
import static org.InvoiceDao.allInvoice;

/**
 * Created by dell on 2016/11/12.
 */
public class Jurisdiction {
    private List<User> branch;
    private List<Invoice> branchinvoice;
    private String tips4 = "";
    private int newpower = 0;
    private String changep;
    private String high;
    private String changeName;

    public String getChangeName() {
        return changeName;
    }

    public void setChangeName(String changeName) {
        this.changeName = changeName;
    }

    public List<Invoice> getBranchinvoice() {
        return branchinvoice;
    }

    public void setBranchinvoice(List<Invoice> branchinvoice) {
        this.branchinvoice = branchinvoice;
    }

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

    public List<User> getBranch() {
        return branch;
    }

    public void setBranch(List<User> branch) {
        this.branch = branch;
    }

    public String showBranch() {
        Connection conn;
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int id = (int)session.getAttribute("newid");
        if (id == 1){
            tips4 = "你的权限无法进行此操作。";
            return INPUT;
        }
        branch = UserDao.getBranch(id);
        return SUCCESS;
    }

    public String changeId(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int id = (int)session.getAttribute("newid");
        String password = (String)session.getAttribute("newpassword");
        if (!SignService.passwordCompare(high, password)) {
            tips4 = "密码错误";
            return INPUT;
        }
        if (newpower >= id || newpower <= 0) {
            tips4 = "新的权限等级不可以小于0也不可以大于你自身的等级";
            return INPUT;
        }
        int judge = UserDao.changeID(newpower, changep);
        if (judge > 0) {
            branch = UserDao.getBranch(id);
            return SUCCESS;
        }
        else if(judge == -2){
            tips4 = "瞎改什么，你权限够么";
            return ERROR;
        }
        else{
            tips4 = "未知错误";
            return INPUT;
        }
    }


    public String showBranchInvoice(){
        Connection conn;
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        branchinvoice = allInvoice(changep);
        if (branchinvoice == null){
            return ERROR;
        }
        else{
            return SUCCESS;
        }
    }
}
