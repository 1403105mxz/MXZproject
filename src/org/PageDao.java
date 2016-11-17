package org;

import data.Dealer;
import data.Goods;
import data.Invoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by meng on 2016/11/14.
 */
public class PageDao extends SuperDao {
    public static List<Invoice> allInvoice(int pageNumber, int pageSize, String account) {
        List<Invoice> invoiceList = new ArrayList<Invoice>();
        String sql = "select * from invoice WHERE account = ? AND limit ?, ?";
        PreparedStatement pst = setPreparedStatement(sql, account,
                (pageNumber - 1) * pageSize, pageSize);
        try {
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                String codeId = resultSet.getString(1);
                String code = Invoice.separateCodeId(codeId)[0];
                String id = Invoice.separateCodeId(codeId)[1];
                Dealer payer = Dealer.makeDealer(resultSet.getString(3), resultSet.getString(4),
                        resultSet.getString(5), resultSet.getString(6),
                        resultSet.getString(7), resultSet.getString(8));
                Dealer payee = Dealer.makeDealer(resultSet.getString(15), resultSet.getString(16),
                        resultSet.getString(17), resultSet.getString(18),
                        resultSet.getString(19), resultSet.getString(20));
                Goods items = Goods.makeGoods(resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11), resultSet.getInt(12),
                        resultSet.getDouble(13), resultSet.getDouble(14));
                Invoice invoice = Invoice.makeInvoice(code, id, resultSet.getString(2),
                        payer, items, payee, resultSet.getString(21),
                        resultSet.getString(22), resultSet.getString(23),
                        resultSet.getString(24));
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
