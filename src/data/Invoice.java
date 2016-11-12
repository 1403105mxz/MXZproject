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
    private String payer;
    /**.
     * 付款项
     */
    private String items;
    /**.
     * 付款项数量
     */
    private int number;
    /**.
     * 付款项单价(人民币)
     */
    private double price;
    /**.
     * 备注
     */
    private String remark;
    /**.
     * 合计金额
     */
    private double total;
    /**.
     * 收款方
     */
    private String payee;
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

    public String getPayer() {
        return payer;
    }

    public void setPayer(String payer) {
        this.payer = payer;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPayee() {
        return payee;
    }

    public void setPayee(String payee) {
        this.payee = payee;
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

    /*
    public Invoice(String code, String id, String date,
                   String payer, String items, int number,
                   double price, String remark, double total,
                   String payee, String drawer, String account) {
        this.code = code;
        this.id = id;
        this.date = date;
        this.payer = payer;
        this.items = items;
        this.number = number;
        this.price = price;
        this.remark = remark;
        this.total = total;
        this.payee = payee;
        this.drawer = drawer;
        this.account = account;
    }
    */
}
