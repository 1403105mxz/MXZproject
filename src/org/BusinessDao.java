package org;


import data.Business;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by meng on 2016/12/10.
 */
public class BusinessDao extends SuperDao{
    public static int addBusiness(Business business, String account) {
        String sql = "insert into business value" +
                "(null, ?, ?, ?, ?, ?)";
        int changed = 0;
        int income;
        if (business.isIncome()) {
            income = 1;
        } else {
            income = 0;
        }
        PreparedStatement pst = setPreparedStatement(sql, business.getDate(),
                business.getMoney(), business.getRemark(), income, account);
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

    public static int updateBusiness(Business business) {
        int changed = 0;
        String sql = "update business set date = ?, money = ?, remark = ? where id = ?";
        PreparedStatement pst = setPreparedStatement(sql, business.getDate(),
                business.getMoney(), business.getRemark(), business.getId());
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }

    public static List<Business> allBusiness(String account, boolean isIncome) {
        List<Business> businessList = new ArrayList<Business>();
        int income;
        if (isIncome) {
            income = 1;
        } else {
            income = 0;
        }
        String sql = "select * from business where account = ? and isincome = ?";
        PreparedStatement pst = setPreparedStatement(sql, account, income);
        try {
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                Business business = Business.makeBusiness(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getDouble(3),
                        resultSet.getString(4),
                        resultSet.getBoolean(5),
                        resultSet.getString(6)
                );
                businessList.add(business);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return businessList;
    }
}
