package action;

import data.User;
import data.Wage;
import org.WageDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import static java.util.jar.Pack200.Packer.ERROR;
import static org.WageDao.selectWages;

/**
 * Created by dell on 2016/12/11.
 */
public class WageOperation {
    private Wage wage = new Wage();
    private List<Wage> wagelist ;
    private String tip;
    private String eusername;  //这个变量用于修改工资时传递用户名
    public Wage getWage() {
        return wage;
    }

    public void setWage(Wage wage) {
        this.wage = wage;
    }

    public List<Wage> getWagelist() {
        return wagelist;
    }

    public void setWagelist(List<Wage> wagelist) {
        this.wagelist = wagelist;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getEusername() {
        return eusername;
    }

    public void setEusername(String eusername) {
        this.eusername = eusername;
    }

    public String showWage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int id = (int)session.getAttribute("newid");
        String username = (String) session.getAttribute("newusername");
        if (id >= 5){
            wagelist = WageDao.showWages(id);
            return SUCCESS;
        }
        else if(id == 4){
            wage = selectWages(username);
            wagelist = WageDao.showWages(id);
            if (wage == null){
                return ERROR;
            }
            return SUCCESS;
        }
        else{
            wage = selectWages(username);
            if (wage == null){
                return ERROR;
            }
            return SUCCESS;
        }

    }

    public String goeditWage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int id = (int)session.getAttribute("newid");
        wage = selectWages(eusername);
        if(id > wage.getId()){
            return SUCCESS;
        }
        tip = "你无法进行此操作";
        return ERROR;
    }

    public String editWage(){
        int judge = WageDao.editWage(wage);
        if (judge < 0){
            tip = "你无法进行此操作";
            return ERROR;
        }
        else{
            return SUCCESS;
        }
    }
}
