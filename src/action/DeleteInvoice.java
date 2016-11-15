package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.InvoiceDao;

/**
 * Created by 祥根_2 on 2016/11/10.
 */
public class DeleteInvoice extends ActionSupport{
    private String code;
    private String id;

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

    public String execute() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        InvoiceDao.deleteInvoice(code, id, account);
        return SUCCESS;
    }
}
