package action;

import com.opensymphony.xwork2.ActionSupport;
import org.PageDao;

/**
 * Created by meng on 2016/11/14.
 */
public class Paging extends ActionSupport {
    private int pageNumber;
    private int totalPage;

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

    @Override
    public String execute() throws Exception {
        int pageSize = 10;
        int invoiceNumber = PageDao.getInvoiceAmount();
        totalPage = invoiceNumber % pageSize;
        if (pageNumber < 0) {
            pageNumber = 1;
        }
        if (pageNumber > totalPage) {
            pageNumber = totalPage;
        }
        return SUCCESS;
    }
}
