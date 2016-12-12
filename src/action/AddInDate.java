package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Business;
import service.BusinessService;

/**
 * Created by 54333 on 2016/12/11.
 */
public class AddInDate extends ActionSupport{
    private int pageNumber;
    private Business business = new Business();
    private String tip = "";

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String addInDate() {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        business.setAccount(account);
        if (BusinessService.addInBusiness(business)) {
            tip = "success";
            return SUCCESS;
        }
        tip = "businessError";
        return INPUT;
    }
}
