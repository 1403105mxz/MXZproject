package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import org.SearchDao;
import org.UpdateDao;

/**
 * Created by 祥根_2 on 2016/11/12.
 */
public class EditInvoice extends ActionSupport {
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
    private Invoice invoice;
    private String firstTime = "";

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

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public String getFirstTime() {
        return firstTime;
    }

    public void setFirstTime(String firstTime) {
        this.firstTime = firstTime;
    }

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

    @Override
    public String execute() throws Exception {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        invoice = SearchDao.searchInvoice(code, id, account);
        if (firstTime.equals("firstTime")) {
            firstTime = "";
            return INPUT;
        }
        Double total = number * price;
        UpdateDao.updateInvoice(code, id, date, payer,
                items, number, price, remark, total, payee, drawer);
        return SUCCESS;
    }
}
