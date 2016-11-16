package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import service.InvoiceService;

/**
 * Created by 祥根_2 on 2016/11/12.
 */
public class EditInvoice extends ActionSupport {
    private Invoice oldInvoice = new Invoice();
    private Invoice newInvoice = new Invoice();

    public Invoice getOldInvoice() {
        return oldInvoice;
    }

    public void setOldInvoice(Invoice oldInvoice) {
        this.oldInvoice = oldInvoice;
    }

    public Invoice getNewInvoice() {
        return newInvoice;
    }

    public void setNewInvoice(Invoice newInvoice) {
        this.newInvoice = newInvoice;
    }

    @Override
    public String execute() throws Exception {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        setOldInvoice(InvoiceService.searchInvoice(oldInvoice.getCode(), oldInvoice.getId(), account));
        newInvoice.setAccount(account);
        InvoiceService.updateInvoice(newInvoice);
        return SUCCESS;
    }

}
