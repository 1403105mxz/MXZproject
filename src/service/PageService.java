package service;

import org.PageDao;

/**
 * Created by meng on 2016/12/4.
 */
public class PageService {
    public static int totalPage(int pageSize, String account) {
        int invoiceNumber = PageDao.getInvoiceAmount(account);
        return invoiceNumber % pageSize == 0 ? (invoiceNumber / pageSize) :
                (invoiceNumber / pageSize + 1);
    }
}
