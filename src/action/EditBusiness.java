package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Business;
import service.BusinessService;

/**
 * Created by 54333 on 2016/12/12.
 */
public class EditBusiness extends ActionSupport {
    private Business business = new Business();
    private String pageNumber;

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public String getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(String pageNumber) {
        this.pageNumber = pageNumber;
    }

    public String editBusiness() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        business.setAccount(account);
        if(BusinessService.updateBusiness(business)) {
            return SUCCESS;
        }
        return ERROR;
    }
}
