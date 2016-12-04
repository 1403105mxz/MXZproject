package action;

import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;

import com.opensymphony.xwork2.ActionContext;
import service.InvoiceService;

/**
 * Created by 祥根_2 on 2016/10/25.
 */
public class SearchInvoice extends ActionSupport {
    private String code;
    private String id;
    private Invoice invoice;
    private String branchAccount;

    public String getBranchAccount() {
        return branchAccount;
    }

    public void setBranchAccount(String branchAccount) {
        this.branchAccount = branchAccount;
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
        String account = (String)ActionContext.getContext().getSession().get("newusername");
        invoice = InvoiceService.searchInvoice(code, id, account);
        if (invoice == null) {
            return ERROR;
        }
        return SUCCESS;
    }

    public String detailInvoice() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        if (branchAccount == null) {
            invoice = InvoiceService.searchInvoice(code, id, account);
        }
        else {
            invoice = InvoiceService.searchInvoice(code, id, branchAccount);
        }
        if (invoice == null) {
            return ERROR;
        }
        return SUCCESS;
    }
}
