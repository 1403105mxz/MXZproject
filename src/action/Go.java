package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import service.InvoiceService;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by 54333 on 2016/11/14.
 */
public class Go{
    private String changep;
    private Invoice oldInvoice;
    private String code;
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {

        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Invoice getOldInvoice() {
        return oldInvoice;
    }

    public void setOldInvoice(Invoice oldInvoice) {
        this.oldInvoice = oldInvoice;
    }

    public String getChangep() {
        return changep;
    }

    public void setChangep(String changep) {
        this.changep = changep;
    }

    public String goOperationIndex() {
        return SUCCESS;
    }

    public String goEditInvoice() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        oldInvoice = InvoiceService.searchInvoice(code, id, account);
        return SUCCESS;
    }

    public String goAddInvoice()  {
        return SUCCESS;
    }

    public String goChangeId() {
        return SUCCESS;
    }

    public String goTax() {
        return SUCCESS;
    }
}


