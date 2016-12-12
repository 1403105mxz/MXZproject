package service;

import data.Business;
import org.BusinessDao;
import org.PageDao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by meng on 2016/12/10.
 */
public class BusinessService {
    /**.
     * 判断金额是否合法
     * @param money 金额
     * @return 单价大于等于0为合法，返回false；单价非法返回true
     */
    private static boolean illegalPrice(double money) {
        return money < 0.0;
    }

    /**.
     * 判断字符串长度是否大于45
     * @param str 字符串
     * @return 字符串长度小于等于45则合法，返回false；字符串长度大于45则非法，返回true
     */
    private static boolean longerThan45(String str) {
        return str.length() > 45;
    }

    private static boolean wrongBusiness(Business business) {
        return illegalPrice(business.getMoney()) ||
                longerThan45(business.getRemark()) || longerThan45(business.getDate());
    }

    private static Double twoPricePrecision(Double price) {
        BigDecimal bigDecimal = new BigDecimal(price);
        return bigDecimal.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    public static boolean addInBusiness(Business business) {
        if (wrongBusiness(business)) {
            return false;
        }
        business.setIncome(true);
        business.setMoney(twoPricePrecision(business.getMoney()));
        int changed = BusinessDao.addBusiness(business);
        return changed != 0;
    }

    public static boolean addOutBusiness(Business business) {
        if (wrongBusiness(business)) {
            return false;
        }
        business.setIncome(false);
        business.setMoney(twoPricePrecision(business.getMoney()));
        int changed = BusinessDao.addBusiness(business);
        return changed != 0;
    }

    public static boolean deleteBusiness(int id, String account) {
        int changed = BusinessDao.deleteBusiness(id, account);
        return changed != 0;
    }

    public static boolean updateBusiness(Business business) {
        if (wrongBusiness(business)) {
            return false;
        }
        business.setMoney(twoPricePrecision(business.getMoney()));
        int changed = BusinessDao.updateBusiness(business);
        return changed != 0;
    }

    public static List<Business> oneDayInBusiness(int pageNumber, int pageSize,
                                               String date, String account) {
        return PageDao.allBusiness(pageNumber, pageSize, date, true, account);
    }

    public static List<Business> oneDayOutBusiness(int pageNumber, int pageSize,
                                                String date, String account) {
        return PageDao.allBusiness(pageNumber, pageSize, date, false, account);
    }

    public static List<String> allDateIn(int pageNumber, int pageSize, String account) {
        List<String> dateList = PageDao.allBusinessDate(true, account);
        List<String> temp = new ArrayList<String>();
        List<String> result = new ArrayList<String>();
        for (String date : dateList) {
            if (!temp.contains(date)) {
                temp.add(date);
            }
        }
        int start = (pageNumber - 1) * pageSize;
        int number = 0;
        while (number < pageSize && start + number < temp.size()) {
            result.add(temp.get(start + number));
            number++;
        }
        return result;
    }

    public static List<String> allDateOut(int pageNumber, int pageSize, String account) {
        List<String> dateList = PageDao.allBusinessDate(false, account);
        List<String> temp = new ArrayList<String>();
        List<String> result = new ArrayList<String>();
        for (String date : dateList) {
            if (!temp.contains(date)) {
                temp.add(date);
            }
        }
        int start = (pageNumber - 1) * pageSize;
        int number = 0;
        while (number < pageSize && start + number < temp.size()) {
            result.add(temp.get(start + number));
            number++;
        }
        return result;
    }

    public static boolean deleteInDate(String date, String account) {
        int changed = BusinessDao.deleteBusiness(date, true, account);
        return changed != 0;
    }

    public static boolean deleteOutDate(String date, String account) {
        int changed = BusinessDao.deleteBusiness(date, false, account);
        return changed != 0;
    }

    public static int totalInBusinessPage(int pageSize, String date, String account) {
        int businessNumber = PageDao.getBusinessAmount(date, true, account);
        return businessNumber % pageSize == 0 ? (businessNumber / pageSize) :
                (businessNumber / pageSize + 1);
    }

    public static int totalOutBusinessPage(int pageSize, String date, String account) {
        int businessNumber = PageDao.getBusinessAmount(date, false, account);
        return businessNumber % pageSize == 0 ? (businessNumber / pageSize) :
                (businessNumber / pageSize + 1);
    }

    public static int totalInDatePage(int pageSize, String account) {
        int dateNumber = PageDao.getDateAmount(true, account);
        return dateNumber % pageSize == 0 ? (dateNumber / pageSize) :
                (dateNumber / pageSize + 1);
    }

    public static int totalOutDatePage(int pageSize, String account) {
        int dateNumber = PageDao.getDateAmount(false, account);
        return dateNumber % pageSize == 0 ? (dateNumber / pageSize) :
                (dateNumber / pageSize + 1);
    }

    public static void main(String[] args) {
        Business in = new Business();
        in.setDate("2016-12-15");
        in.setMoney(100.0);
        in.setRemark("键盘");
        in.setAccount("manager");
        for (int i = 0; i < 8; i++){
            addInBusiness(in);
        }
    }
}
