package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import org.SearchDao;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 祥根_2 on 2016/11/1.
 */
public class InvoiceOperation extends ActionSupport {
    private List<Invoice> codeidList = new ArrayList<Invoice>();

    public List<Invoice> getCodeidList() {
        return codeidList;
    }

    public void setCodeidList(List<Invoice> codeidList) {
        this.codeidList = codeidList;
    }

    @Override
    public String execute() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        codeidList = SearchDao.searchAllInvoice(account);
        return SUCCESS;
    }
}
