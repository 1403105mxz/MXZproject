package action;

import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import org.SearchDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 祥根_2 on 2016/10/25.
 */
public class SearchInvoice extends ActionSupport {
    private String code;
    private String id;
    private String account;
    private Invoice invoice;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
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

    public String searchInvoice() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        account = (String)session.getAttribute("newusername");
        if (code == null && id == null) {
            return "jump";
        }
        invoice = SearchDao.searchInvoice(code, id, account);
        if (invoice == null)
            return ERROR;
        return SUCCESS;
    }
}
