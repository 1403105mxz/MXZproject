package data;

/**
 * Created by meng on 2016/12/10.
 */
public class Business {
    private int id;
    private double money;
    private String remark;
    private String date;
    private boolean isIncome;
    private String account;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public boolean isIncome() {
        return isIncome;
    }

    public void setIncome(boolean income) {
        isIncome = income;
    }

    public static int isIncomeToInt(boolean isIncome) {
        if (isIncome) {
            return 1;
        }
        return 0;
    }

    public static boolean isIncomeToBool(int isIncome) {
        return isIncome == 1;
    }

    public static Business makeBusiness(int id, String date, double money,
                                        String remark, boolean isIncome,
                                        String account) {
        Business business = new Business();
        business.setId(id);
        business.setMoney(money);
        business.setIncome(isIncome);
        business.setRemark(remark);
        business.setDate(date);
        business.setAccount(account);
        return business;
    }
}
