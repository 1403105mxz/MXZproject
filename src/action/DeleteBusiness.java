package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Business;
import service.BusinessService;

/**
 * Created by 54333 on 2016/12/12.
 */
public class DeleteBusiness extends ActionSupport{
    private int id;
    private String pageNumber;
    private String date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(String pageNumber) {
        this.pageNumber = pageNumber;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String deleteBusiness() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        if(BusinessService.deleteBusiness(id, account)) {
            return SUCCESS;
        }
        return ERROR;
    }
}
