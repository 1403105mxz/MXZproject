package org;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 * Created by 祥根_2 on 2016/10/25.
 */
public class AddDao {
    public static int addInvoice(String code, String id, String date,
                          String payer, String items, int number,
                          double price, String remark, double total,
                          String payee, String drawer, String account) {
        String sql = "insert into invoice  values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst;
        Connection conn;
        int suc = 0;
        try {
            conn = DatabaseConn.getConnection();
            pst = conn.prepareStatement(sql);
            String codeId = code + id;
            pst.setString(1, codeId);
            pst.setString(2, date);
            pst.setString(3, payer);
            pst.setString(4, items);
            pst.setInt(5, number);
            pst.setDouble(6, price);
            pst.setString(7, remark);
            pst.setDouble(8, total);
            pst.setString(9, payee);
            pst.setString(10, drawer);
            pst.setString(11, account);
            suc = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return suc;
    }
}
