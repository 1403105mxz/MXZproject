package action;

import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import org.AddDao;
import org.SearchDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 祥根_2 on 2016/10/25.
 */
public class AddInvoice extends ActionSupport{
    private String code;
    private String id;
    private String date;
    private String payer;
    private String items;
    private int number;
    private double price;
    private String remark;
    private String payee;
    private String drawer;
    private String account;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPayer() {
        return payer;
    }

    public void setPayer(String payer) {
        this.payer = payer;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPayee() {
        return payee;
    }

    public void setPayee(String payee) {
        this.payee = payee;
    }

    public String getDrawer() {
        return drawer;
    }

    public void setDrawer(String drawer) {
        this.drawer = drawer;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String addInvoice() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        account = (String)session.getAttribute("newusername");
        if (code.isEmpty() || id.isEmpty()
                || date.isEmpty() || payer.isEmpty()
                || items.isEmpty() || payee.isEmpty()
                || drawer.isEmpty()) {
            return "null";
        }
        if (code.length() != 10 && code.length() != 12
                || id.length() != 8 || date.length() > 10
                || payer.length() > 45 || items.length() > 45
                || remark.length() > 45 || payee.length() > 45
                || drawer.length() > 45) {
            return INPUT;
        }
        //// TODO: 2016/10/26 前端需要保证输入的price是double，number是int，其余数据的长度在限制内
        Invoice invoice = SearchDao.searchInvoiceInAll(code, id);
        if (invoice == null) {
            double total = price * number;
            AddDao.addInvoice(code, id, date, payer,
                    items, number, price, remark,
                    total, payee, drawer, account);
            return SUCCESS;
        }
        return ERROR;
    }
}
