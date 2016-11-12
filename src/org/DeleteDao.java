package org;

import java.sql.PreparedStatement;

/**
 * Created by 祥根_2 on 2016/11/12.
 */
public class DeleteDao {
    public static int deleteInvoice(String code, String id) {
        int suc = 0;
        String codeId = code + id;
        String sql = "delete from invoice where codeid = ?";
        PreparedStatement pst;
        //// TODO: 2016/11/12  
        return suc;
    }
}