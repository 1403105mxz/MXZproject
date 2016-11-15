package data;
/**
 * Created by 祥根_2 on 2016/10/25.
 */

/**.
 * 发票类
 */
public class Invoice {
    /**.
     * 类别代码
     */
    private String code;
    /**.
     * 发票号码
     */
    private String id;
    /**.
     * 开票日期
     */
    private String date;
    /**.
     *付款方
     */
    private Dealer payer = new Dealer();
    /**.
     * 付款项
     */
    private Goods items = new Goods();
    /**.
     * 收款方
     */
    private Dealer payee = new Dealer();
    /**.
     * 备注
     */
    private String remark;
    /**.
     * 开票人
     */
    private String drawer;
    /**.
     * 所属账号
     */
    private String account;

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

    public Dealer getPayer() {
        return payer;
    }

    public void setPayer(Dealer payer) {
        this.payer = payer;
    }

    public Goods getItems() {
        return items;
    }

    public void setItems(Goods items) {
        this.items = items;
    }

    public Dealer getPayee() {
        return payee;
    }

    public void setPayee(Dealer payee) {
        this.payee = payee;
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

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public static Invoice makeInvoice(String code, String id,
                                      String date, Dealer payer,
                                      Goods items, Dealer payee,
                                      String remark, String drawer,
                                      String account) {
        Invoice invoice = new Invoice();
        invoice.setCode(code);
        invoice.setId(id);
        invoice.setDate(date);
        invoice.setPayer(payer);
        invoice.setItems(items);
        invoice.setRemark(remark);
        invoice.setPayee(payee);
        invoice.setDrawer(drawer);
        invoice.setAccount(account);
        return invoice;
    }

    public static String[] separateCodeId(String codeId) {
        String[] result = new String[2];
        int len = codeId.length();
        if (len == 20) {
            result[0] = codeId.substring(0, 12);
            result[1] = codeId.substring(12, 20);
        } else {
            result[0] = codeId.substring(0, 10);
            result[1] = codeId.substring(10, 18);
        }
        return result;
    }
}
