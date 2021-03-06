package action;

import com.opensymphony.xwork2.ActionSupport;
import org.InvoiceDao;
import com.opensymphony.xwork2.ActionContext;
import data.Invoice;
import service.InvoiceService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 祥根_2 on 2016/11/1.
 */
public class InvoiceOperation extends ActionSupport {
    private int pageNumber;
    private int totalPage;
    private List<Invoice> invoiceList = new ArrayList<Invoice>();

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<Invoice> getInvoiceList() {
        return invoiceList;
    }

    public void setInvoiceList(List<Invoice> invoiceList) {
        this.invoiceList = invoiceList;
    }

    @Override
    public String execute() {
        int pageSize = 10;
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        totalPage = InvoiceService.totalPage(pageSize, account);
        //invoiceList = InvoiceDao.allInvoice(account);
        if (pageNumber <= 1) {
            pageNumber = 1;
        }
        else if (pageNumber > totalPage) {
            pageNumber = totalPage;
        }
        invoiceList = InvoiceService.allInvoice(pageNumber, pageSize, account);
        return SUCCESS;
    }

}
