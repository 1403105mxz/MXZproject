package action;

import com.opensymphony.xwork2.ActionSupport;
import org.SearchDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 祥根_2 on 2016/11/1.
 */
public class InvoiceOperation extends ActionSupport {
    private String account;
    List<String> codeidList = new ArrayList<String>();

    public List<String> getCodeidList() {
        return codeidList;
    }

    public void setCodeidList(List<String> codeidList) {
        this.codeidList = codeidList;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        account = (String)session.getAttribute("newusername");
        codeidList = SearchDao.searchAllInvoice(account);
        return SUCCESS;
    }
}
