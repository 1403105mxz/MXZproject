package org;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by 祥根_2 on 2016/11/12.
 */
public class UpdateDao {
    public static int updateInvoice(String code, String id, String date,
                          String payer, String items, int number,
                          double price, String remark, double total,
                          String payee, String drawer) {
        int suc = 0;
        String sql = "update invoice set date = ?, payer = ?," +
                "items = ?, number = ?, price = ?, remark = ?, total = ?," +
                "payee = ?, drawer = ? WHERE codeid = ?";
        PreparedStatement pst;
        Connection conn;
        try {
            String codeId = code + id;
            conn = DatabaseConn.getConn();
            pst = conn.prepareStatement(sql);
            pst.setString(10, codeId);
            pst.setString(1, date);
            pst.setString(2, payer);
            pst.setString(3, items);
            pst.setInt(4, number);
            pst.setDouble(5, price);
            pst.setString(6, remark);
            pst.setDouble(7, total);
            pst.setString(8, payee);
            pst.setString(9, drawer);
            suc = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return suc;
    }
}
