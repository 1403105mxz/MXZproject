package org;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by 祥根_2 on 2016/11/12.
 */
public class DeleteDao {
    public static int deleteInvoice(String code, String id, String account) {
        int suc = 0;
        String codeId = code + id;
        String sql = "delete from invoice where codeid = ? AND account = ?";
        PreparedStatement pst;
        Connection conn;
        try {
            conn = DatabaseConn.getConn();
            pst = conn.prepareStatement(sql);
            pst.setString(1, codeId);
            pst.setString(2, account);
            suc = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return suc;
    }
}