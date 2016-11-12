package org;

import com.sun.org.apache.regexp.internal.RE;
import data.Invoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 祥根_2 on 2016/10/25.
 */
public class SearchDao {
    private static Invoice makeInvoice(String code, String id,
                                    String date, String payer,
                                    String items, int number,
                                    double price, String remark,
                                    double total, String payee,
                                    String drawer, String account) {
        Invoice invoice = new Invoice();
        invoice.setCode(code);
        invoice.setId(id);
        invoice.setDate(date);
        invoice.setPayer(payer);
        invoice.setItems(items);
        invoice.setNumber(number);
        invoice.setPrice(price);
        invoice.setRemark(remark);
        invoice.setTotal(total);
        invoice.setPayee(payee);
        invoice.setDrawer(drawer);
        invoice.setAccount(account);
        return invoice;
    }

    public static Invoice searchInvoice(String code, String id, String account) {
        String codeId = code + id;
        String sql = "select * from invoice where codeid = ? AND account = ?";
        PreparedStatement pst;
        Invoice invoice = null;
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, codeId);
            pst.setString(2, account);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                invoice = makeInvoice(code, id, resultSet.getString(2),
                        resultSet.getString(3), resultSet.getString(4),
                        resultSet.getInt(5), resultSet.getDouble(6),
                        resultSet.getString(7), resultSet.getDouble(8),
                        resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return invoice;
    }

    public static Invoice searchInvoiceInAll(String code, String id) {
        String codeId = code + id;
        String sql = "select * from invoice where codeid = ?";
        PreparedStatement pst;
        Invoice invoice = null;
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, codeId);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                invoice = makeInvoice(code, id, resultSet.getString(2),
                        resultSet.getString(3), resultSet.getString(4),
                        resultSet.getInt(5), resultSet.getDouble(6),
                        resultSet.getString(7), resultSet.getDouble(8),
                        resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoice;
    }

    public static List<Invoice> searchAllInvoice(String account) {
        String sql = "select codeid from invoice where account = ?";
        PreparedStatement pst;
        List<Invoice> codeidList = new ArrayList<Invoice>();
        Connection conn;
        try {
            conn = DatabaseConn.getConn();
            pst = conn.prepareStatement(sql);
            pst.setString(1, account);
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                int len = resultSet.getString(1).length();
                String code;
                String id;
                if (len == 20) {
                    code = resultSet.getString(1).substring(0, 11);
                    id = resultSet.getString(1).substring(12, 20);
                } else {
                    code = resultSet.getString(1).substring(0, 9);
                    id = resultSet.getString(1).substring(10, 17);
                }
                Invoice invoice = makeInvoice(code, id, resultSet.getString(2),
                        resultSet.getString(3), resultSet.getString(4),
                        resultSet.getInt(5), resultSet.getDouble(6),
                        resultSet.getString(7), resultSet.getDouble(8),
                        resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11));
                codeidList.add(invoice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return codeidList;
    }
}
