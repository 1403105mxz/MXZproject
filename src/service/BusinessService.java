package service;

import data.Business;
import org.BusinessDao;
import org.PageDao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    public static boolean addInBusiness(Business business) {
        if (wrongBusiness(business)) {
            return false;
        }
        business.setIncome(true);
        int changed = BusinessDao.addBusiness(business);
        return changed != 0;
    }

    public static boolean addOutBusiness(Business business) {
        if (wrongBusiness(business)) {
            return false;
        }
        business.setIncome(false);
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
        List<String> dateList = PageDao.allBusinessDate(pageNumber, pageSize,
                true, account);
        List<String> result = new ArrayList<String>();
        for (String date : dateList) {
            if (!result.contains(date)) {
                result.add(date);
            }
        }
        return result;
    }

    public static List<String> allDateOut(int pageNumber, int pageSize, String account) {
        List<String> dateList = PageDao.allBusinessDate(pageNumber, pageSize,
                false, account);
        List<String> result = new ArrayList<String>();
        for (String date : dateList) {
            if (!result.contains(date)) {
                result.add(date);
            }
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

    public static int totalDatePage(int pageSize, String account) {
        int dateNumber = PageDao.getDateAmount(account);
        return dateNumber % pageSize == 0 ? (dateNumber / pageSize) :
                (dateNumber / pageSize + 1);
    }

    public static void main(String[] args) {
        Business inTest = new Business();
        Business outTest = new Business();

        inTest.setDate("2016-5-9");
        inTest.setMoney(100.1);
        inTest.setRemark("卖肾");
        inTest.setIncome(true);
        inTest.setAccount("123456");

        outTest.setDate("2015-11-11");
        outTest.setMoney(55.5);
        outTest.setRemark("剁手节花销");
        outTest.setIncome(false);
        outTest.setAccount("123456");

        addInBusiness(inTest);
        addOutBusiness(outTest);

        List<String> dateInList = allDateIn(1, 5, "123456");
        List<String> dateOutList = allDateOut(1, 5, "123456");
        for (int i = 0; i < dateInList.size(); i++) {
            System.out.println(dateInList.get(i));
        }
        System.out.println("--------------------");
        for (int i = 0; i < dateOutList.size(); i++) {
            System.out.println(dateOutList.get(i));
        }
        System.out.println("----------------------");
        List<Business> businessInList = oneDayInBusiness(1, 5, dateInList.get(0), "123456");
        List<Business> businessOutList = oneDayOutBusiness(1, 5, dateOutList.get(0), "123456");
        for (int i = 0; i < businessInList.size(); i++) {
            System.out.println(businessInList.get(i).getRemark());
        }
        System.out.println("--------------------");
        for (int i = 0; i < businessOutList.size(); i++) {
            System.out.println(businessOutList.get(i).getRemark());
        }
        System.out.println("--------------------");
        inTest = businessInList.get(0);
        outTest = businessOutList.get(0);
        deleteBusiness(inTest.getId(), "123456");
        outTest.setMoney(100000000.1);
        deleteOutDate(outTest.getDate(), "123456");
    }
}
