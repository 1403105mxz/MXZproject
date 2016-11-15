package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import data.Invoice;
import org.InvoiceDao;

/**
 * Created by 祥根_2 on 2016/11/12.
 */
public class EditInvoice extends ActionSupport {
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
    private Invoice invoice;

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

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

    @Override
    public String execute() throws Exception {
        String account = (String) ActionContext.getContext().getSession().get("newusername");
        invoice = InvoiceDao.searchInvoice(code, id, account);
        InvoiceDao.updateInvoice(invoice.getCode(), invoice.getId(),
                invoice.getDate(), invoice.getPayer(), invoice.getItems(),
                invoice.getPayee(), invoice.getRemark(), invoice.getDrawer(), account);
        return SUCCESS;
    }

    public String goEditInvoice() {
        return SUCCESS;
    }
}
