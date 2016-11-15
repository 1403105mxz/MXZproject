package org;

import data.Invoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by meng on 2016/11/14.
 */
public class PageDao {
    public static List<Invoice> allInvoice(int pageNumber, int pageSize, String account) {
        Connection conn = DatabaseConn.getConn();
        List<Invoice> invoiceList = new ArrayList<Invoice>();
        String sql = "select * from invoice WHERE account = ? AND limit ?, ?";
        PreparedStatement pst;
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, account);
            pst.setInt(2, (pageNumber - 1) * pageSize);
            pst.setInt(3, pageSize);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                String codeId = resultSet.getString(1);
                String code = Invoice.separateCodeId(codeId)[0];
                String id = Invoice.separateCodeId(codeId)[1];
                Invoice invoice = Invoice.makeInvoice(code, id, resultSet.getString(2),
                        resultSet.getString(3), resultSet.getString(4),
                        resultSet.getInt(5), resultSet.getDouble(6),
                        resultSet.getString(7), resultSet.getDouble(8),
                        resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11));
                invoiceList.add(invoice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoiceList;
    }

    public static int getInvoiceAmount() {
        int i = 0;
        Connection conn = DatabaseConn.getConn();
        String sql = "select * from invoice";
        PreparedStatement pst;
        try {
            pst = conn.prepareStatement(sql);
            ResultSet resultSet = pst.executeQuery();
            if(resultSet.next()) {
                i += 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
