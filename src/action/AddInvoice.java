package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Dealer;
import data.Goods;
import data.Invoice;
import org.InvoiceDao;

import java.math.BigDecimal;

/**
 * Created by 祥根_2 on 2016/10/25.
 */
public class AddInvoice extends ActionSupport{
    private String code;
    private String id;
    private String date;
    private String payerName;
    private String payerId;
    private String payerAddress;
    private String payerPhoneNumber;
    private String payerBank;
    private String payerBankId;
    private String itemsName;
    private String itemsModel;
    private String itemsUnit;
    private int itemsAmount;
    private double itemsPrice;
    private double itemsTaxRate;
    private String payeeName;
    private String payeeId;
    private String payeeAddress;
    private String payeePhoneNumber;
    private String payeeBank;
    private String payeeBankId;
    private String remark;
    private String drawer;
    private String tip = "";

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPayerName() {
        return payerName;
    }

    public void setPayerName(String payerName) {
        this.payerName = payerName;
    }

    public String getPayerId() {
        return payerId;
    }

    public void setPayerId(String payerId) {
        this.payerId = payerId;
    }

    public String getPayerAddress() {
        return payerAddress;
    }

    public void setPayerAddress(String payerAddress) {
        this.payerAddress = payerAddress;
    }

    public String getPayerPhoneNumber() {
        return payerPhoneNumber;
    }

    public void setPayerPhoneNumber(String payerPhoneNumber) {
        this.payerPhoneNumber = payerPhoneNumber;
    }

    public String getPayerBank() {
        return payerBank;
    }

    public void setPayerBank(String payerBank) {
        this.payerBank = payerBank;
    }

    public String getPayerBankId() {
        return payerBankId;
    }

    public void setPayerBankId(String payerBankId) {
        this.payerBankId = payerBankId;
    }

    public String getItemsName() {
        return itemsName;
    }

    public void setItemsName(String itemsName) {
        this.itemsName = itemsName;
    }

    public String getItemsModel() {
        return itemsModel;
    }

    public void setItemsModel(String itemsModel) {
        this.itemsModel = itemsModel;
    }

    public String getItemsUnit() {
        return itemsUnit;
    }

    public void setItemsUnit(String itemsUnit) {
        this.itemsUnit = itemsUnit;
    }

    public int getItemsAmount() {
        return itemsAmount;
    }

    public void setItemsAmount(int itemsAmount) {
        this.itemsAmount = itemsAmount;
    }

    public double getItemsPrice() {
        return itemsPrice;
    }

    public void setItemsPrice(double itemsPrice) {
        this.itemsPrice = itemsPrice;
    }

    public double getItemsTaxRate() {
        return itemsTaxRate;
    }

    public void setItemsTaxRate(double itemsTaxRate) {
        this.itemsTaxRate = itemsTaxRate;
    }

    public String getPayeeName() {
        return payeeName;
    }

    public void setPayeeName(String payeeName) {
        this.payeeName = payeeName;
    }

    public String getPayeeId() {
        return payeeId;
    }

    public void setPayeeId(String payeeId) {
        this.payeeId = payeeId;
    }

    public String getPayeeAddress() {
        return payeeAddress;
    }

    public void setPayeeAddress(String payeeAddress) {
        this.payeeAddress = payeeAddress;
    }

    public String getPayeePhoneNumber() {
        return payeePhoneNumber;
    }

    public void setPayeePhoneNumber(String payeePhoneNumber) {
        this.payeePhoneNumber = payeePhoneNumber;
    }

    public String getPayeeBank() {
        return payeeBank;
    }

    public void setPayeeBank(String payeeBank) {
        this.payeeBank = payeeBank;
    }

    public String getPayeeBankId() {
        return payeeBankId;
    }

    public void setPayeeBankId(String payeeBankId) {
        this.payeeBankId = payeeBankId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getDrawer() {
        return drawer;
    }

    public void setDrawer(String drawer) {
        this.drawer = drawer;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String addInvoice() {
        if (code == null) {
            return INPUT;
        }
        if (code.length() != 10 && code.length() != 12
                || id.length() != 8 || date.length() > 10
                || payerName.length() > 45 || itemsName.length() > 45
                || remark.length() > 45 || payeeName.length() > 45
                || drawer.length() > 45 || itemsAmount <= 0 || itemsPrice < 0.0) {
            return INPUT;
        }
        BigDecimal tmp = new BigDecimal(itemsPrice);
        itemsPrice = tmp.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        String account = (String)ActionContext.getContext().getSession().get("newusername");
        Invoice invoice = InvoiceDao.searchInvoice(code, id);
        if (invoice == null) {
            Dealer payer = Dealer.makeDealer(payerName, payerId, payerAddress,
                    payerPhoneNumber, payerBank, payerBankId);
            Dealer payee = Dealer.makeDealer(payeeName, payeeId, payeeAddress,
                    payeePhoneNumber, payeeBank, payeeBankId);
            Goods items = Goods.makeGoods(itemsName, itemsModel, itemsUnit,
                    itemsAmount, itemsPrice, itemsTaxRate);
            InvoiceDao.addInvoice(code, id, date, payer, items, payee,
                    remark, drawer, account);
            tip = "success";
            return SUCCESS;
        }
        tip = "repeat";
        return INPUT;
    }
}
