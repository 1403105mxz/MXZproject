package action;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import service.BusinessService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 54333 on 2016/12/11.
 */
public class InOperation extends ActionSupport {
    private int pageNumber;
    private int totalPage;
    private List<String> dateList = new ArrayList<String>();

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

    public List<String> getDateList() {
        return dateList;
    }

    public void setDateList(List<String> dateList) {
        this.dateList = dateList;
    }

    public String inOperation() {
        int pageSize = 10;
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        totalPage = BusinessService.totalInDatePage(pageSize, account);
        if (pageNumber <= 1) {
            pageNumber = 1;
        }
        else if (pageNumber > totalPage) {
            pageNumber = totalPage;
        }
        dateList = BusinessService.allDateIn(pageNumber, pageSize, account);
        return SUCCESS;
    }

}
