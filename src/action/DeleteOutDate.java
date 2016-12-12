package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import service.BusinessService;

/**
 * Created by 54333 on 2016/12/12.
 */
public class DeleteOutDate extends ActionSupport {
    private String date;
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String deleteOutDate() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        BusinessService.deleteOutDate(date, account);
        return SUCCESS;
    }
}
