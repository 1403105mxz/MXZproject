package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import org.SearchDao;

/**
 * Created by 祥根_2 on 2016/11/10.
 */
public class DeleteInvoice extends ActionSupport{
    private String codeId;
    private String account;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getCodeId() {
        return codeId;
    }

    public void setCodeId(String codeId) {
        this.codeId = codeId;
    }

    public String execute() {
        String code;
        String id;
        account = (String) ActionContext.getContext().getSession().get("newusername");
        int len = codeId.length();
        if (len == 20) {
            code = codeId.substring(0, 11);
            id = codeId.substring(12, 20);
        } else {
            code = codeId.substring(0, 9);
            id = codeId.substring(10, 17);
        }
        Invoice invoice = SearchDao.searchInvoice(code, id, account);
        //// TODO: 2016/11/11 DeleteDao
        return SUCCESS;
    }
}
