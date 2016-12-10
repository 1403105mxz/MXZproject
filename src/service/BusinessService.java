package service;

import com.opensymphony.xwork2.ActionContext;
import data.Business;
import org.BusinessDao;

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

    public static boolean addInBusiness(Business business, String account) {
        if (wrongBusiness(business)) {
            return false;
        }
        business.setIncome(true);
        int changed = BusinessDao.addBusiness(business, account);
        return changed != 0;
    }

    public static boolean addOutBusiness(Business business, String account) {
        if (wrongBusiness(business)) {
            return false;
        }
        business.setIncome(false);
        int changed = BusinessDao.addBusiness(business, account);
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

    public static List<Business> allInBusiness(String account) {
        return BusinessDao.allBusiness(account, true);
    }

    public static List<Business> allOutBusiness(String account) {
        return BusinessDao.allBusiness(account, false);
    }

    public static void main(String[] args) {
        String account = "123456";
        Business test = new Business();
        test.setDate("2016-10-10");
        test.setMoney(100.0);
        test.setRemark("网费");
        addInBusiness(test, account);
        deleteBusiness(1, "123456");
        List<Business> businessInList = allInBusiness("123456");
        List<Business> businessOutList = allOutBusiness("123456");
        for (int i = 0; i < businessInList.size(); i++) {
            System.out.println(businessInList.get(i).getRemark());
        }
        System.out.println("---------------------------");
        for (int i = 0; i < businessOutList.size(); i++) {
            System.out.println(businessOutList.get(i).getRemark());
        }
    }
}
