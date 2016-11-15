package org;

import data.Dealer;
import data.Goods;
import data.Invoice;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by meng on 2016/11/15.
 */

public class InvoiceDao extends SuperDao {
    public static int addInvoice(String code, String id, String date,
                                 Dealer payer, Goods items, Dealer payee,
                                 String remark, String drawer, String account) {
        String sql = "insert into invoice  values" +
                "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?," +
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int changed = 0;
        String codeId = code + id;
        PreparedStatement pst = setPreparedStatement(sql, codeId,
                date, payer.getName(), payer.getId(), payer.getAddress(),
                payer.getPhoneNumber(), payer.getBank(), payer.getBankId(),
                items.getName(), items.getModel(), items.getUnit(),
                items.getAmount(), items.getPrice(), items.getTaxRate(),
                payee.getName(), payee.getId(), payee.getAddress(),
                payee.getPhoneNumber(), payee.getBank(), payee.getBankId(),
                remark, drawer, account);
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }

    public static int deleteInvoice(String code, String id, String account) {
        int changed = 0;
        String sql = "delete from invoice where codeid = ? AND account = ?";
        String codeId = code + id;
        PreparedStatement pst = setPreparedStatement(sql, codeId, account);
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }

    public static int updateInvoice(String code, String id, String date,
                                    Dealer payer, Goods items, Dealer payee,
                                    String remark, String drawer, String account) {
        int changed = 0;
        String sql = "update invoice set date = ?, payer_name = ?," +
                "payer_id = ?, payer_address = ?, payer_phonenumber = ?," +
                "payer_bank = ?, payer_bankid = ?, items_name = ?," +
                "items_model = ?, items_unit = ?, items_amount = ?," +
                "items_price = ?, items_taxrate = ?, payee_name," +
                "payee_id = ?, payee_address = ?, payee_phonenumber = ?," +
                "payee_bank = ?, payee_bankid = ?, remark = ?, drawer = ?," +
                "account = ? WHERE codeid = ?";
        String codeId= code + id;
        PreparedStatement pst = setPreparedStatement(sql, date,
                payer.getName(), payer.getId(), payer.getAddress(),
                payer.getPhoneNumber(), payer.getBank(), payer.getBankId(),
                items.getName(), items.getModel(), items.getUnit(),
                items.getAmount(), items.getPrice(), items.getTaxRate(),
                payee.getName(), payee.getId(), payee.getAddress(),
                payee.getPhoneNumber(), payee.getBank(), payee.getBankId(),
                remark, drawer, account, codeId);
        try {
            changed = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return changed;
    }

    public static Invoice searchInvoice(String code, String id, String account) {
        String codeId = code + id;
        String sql = "select * from invoice where codeid = ? AND account = ?";
        Invoice invoice = null;
        PreparedStatement pst = setPreparedStatement(sql, codeId, account);
        try {
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                Dealer payer = Dealer.makeDealer(resultSet.getString(3), resultSet.getString(4),
                        resultSet.getString(5), resultSet.getString(6),
                        resultSet.getString(7), resultSet.getString(8));
                Dealer payee = Dealer.makeDealer(resultSet.getString(15), resultSet.getString(16),
                        resultSet.getString(17), resultSet.getString(18),
                        resultSet.getString(19), resultSet.getString(20));
                Goods items = Goods.makeGoods(resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11), resultSet.getInt(12),
                        resultSet.getDouble(13), resultSet.getDouble(14));
                invoice = Invoice.makeInvoice(code, id, resultSet.getString(2),
                        payer, items, payee, resultSet.getString(21),
                        resultSet.getString(22), resultSet.getString(23));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoice;
    }

    public static Invoice searchInvoice(String code, String id) {
        String codeId = code + id;
        String sql = "select * from invoice where codeid = ?";
        Invoice invoice = null;
        PreparedStatement pst = setPreparedStatement(sql, codeId);
        try {
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                Dealer payer = Dealer.makeDealer(resultSet.getString(3), resultSet.getString(4),
                        resultSet.getString(5), resultSet.getString(6),
                        resultSet.getString(7), resultSet.getString(8));
                Dealer payee = Dealer.makeDealer(resultSet.getString(15), resultSet.getString(16),
                        resultSet.getString(17), resultSet.getString(18),
                        resultSet.getString(19), resultSet.getString(20));
                Goods items = Goods.makeGoods(resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11), resultSet.getInt(12),
                        resultSet.getDouble(13), resultSet.getDouble(14));
                invoice = Invoice.makeInvoice(code, id, resultSet.getString(2),
                        payer, items, payee, resultSet.getString(21),
                        resultSet.getString(22), resultSet.getString(23));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoice;
    }

    public static List<Invoice> allInvoice(String account) {
        String sql = "select * from invoice where account = ?";
        List<Invoice> invoiceList = new ArrayList<Invoice>();
        PreparedStatement pst = setPreparedStatement(sql, account);
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
                        resultSet.getString(22), resultSet.getString(23));
                invoiceList.add(invoice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoiceList;
    }
}
