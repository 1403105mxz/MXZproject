package org;


import data.Business;

import java.sql.PreparedStatement;

/**
 * Created by meng on 2016/12/10.
 */
public class BusinessDao extends SuperDao{
    public static int addBusiness(Business business) {
        String sql = "insert into business value" +
                "(null, ?, ?, ?, ?, ?)";
        int changed = 0;
        int income = Business.isIncomeToInt(business.isIncome());
        PreparedStatement pst = setPreparedStatement(sql, business.getDate(),
                business.getMoney(), business.getRemark(), income, business.getAccount());
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }

    public static int deleteBusiness(int id, String account) {
        int changed = 0;
        String sql = "delete from business where id = ? and account = ?";
        PreparedStatement pst = setPreparedStatement(sql, id, account);
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }

    public static int deleteBusiness(String date, boolean isIncome, String account) {
        int changed = 0;
        String sql = "delete from business where date = ? and isincome = ? and account = ?";
        PreparedStatement pst = setPreparedStatement(sql, date,
                Business.isIncomeToInt(isIncome), account);
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }

    public static int updateBusiness(Business business) {
        int changed = 0;
        String sql = "update business set money = ?, remark = ?" +
                " where id = ? and account = ?";
        PreparedStatement pst = setPreparedStatement(sql, business.getMoney(),
                business.getRemark(), business.getId(), business.getAccount());
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }
}
