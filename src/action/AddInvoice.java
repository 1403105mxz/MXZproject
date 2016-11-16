package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import service.InvoiceService;

/**
 * Created by 祥根_2 on 2016/10/25.
 */
public class AddInvoice extends ActionSupport{
    private Invoice invoice = new Invoice();
    private String tip = "";

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String addInvoice() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        invoice.setAccount(account);
        if (InvoiceService.addInvoice(invoice)) {
            tip = "success";
            return SUCCESS;
        }
        tip = "error";
        return INPUT;
    }

    public String goAddInvoice() {
        return SUCCESS;
    }
}
