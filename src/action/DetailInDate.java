package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Business;
import service.BusinessService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 54333 on 2016/12/11.
 */
public class DetailInDate extends ActionSupport {
    private int pageNumber;
    private int totalPage;
    private String date;
    private List<Business> businessList = new ArrayList<Business>();

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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<Business> getBusinessList() {
        return businessList;
    }

    public void setBusinessList(List<Business> businessList) {
        this.businessList = businessList;
    }

    public String inOperation() {
        int pageSize = 10;
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        totalPage = BusinessService.totalBusinessPage(pageSize, account, date);
        if (pageNumber <= 1) {
            pageNumber = 1;
        }
        else if (pageNumber > totalPage) {
            pageNumber = totalPage;
        }
        businessList = BusinessService.oneDayInBusiness(pageNumber, pageSize, date, account);
        return SUCCESS;
    }
}
