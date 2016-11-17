package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import service.InvoiceService;

/**
 * Created by 祥根_2 on 2016/11/12.
 */
public class EditInvoice extends ActionSupport {
    private Invoice newInvoice = new Invoice();

    public Invoice getNewInvoice() {
        return newInvoice;
    }

    public void setNewInvoice(Invoice newInvoice) {
        this.newInvoice = newInvoice;
    }

    @Override
    public String execute() throws Exception {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        newInvoice.setAccount(account);
        InvoiceService.updateInvoice(newInvoice);
        return SUCCESS;
    }

}
