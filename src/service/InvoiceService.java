package service;

import data.Invoice;
import org.InvoiceDao;
import org.PageDao;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by meng on 2016/11/16.
 */
public class InvoiceService {

    /**.
     * 判断code长度是否合法
     * @param code 类别代码
     * @return 长度为10或12则合法，返回false；长度非法返回true
     */
    private static boolean illegalCode(String code) {
        return (code.length() != 10 && code.length() != 12);
    }

    /**.
     * 判断id长度是否合法
     * @param id 发票编号
     * @return 长度为8则合法，返回false；长度非法返回true
     */
    private static boolean illegalId(String id) {
        return id.length() != 8;
    }

    /**.
     * 判断货物数量是否合法
     * @param amount 货物数量
     * @return 数量大于0则合法，返回false；数量非法返回true
     */
    private static boolean illegalAmount(int amount) {
        return amount <= 0;
    }

    /**.
     * 判断货物单价是否合法
     * @param price 货物单价
     * @return 单价大于等于0为合法，返回false；单价非法返回true
     */
    private static boolean illegalPrice(double price) {
        return price < 0.0;
    }

    /**.
     * 判断税率是否合法
     * @param taxRate 税率
     * @return 税率大于0小于100则合法，返回false；税率非法返回true
     */
    private static boolean illegalTaxRate(double taxRate) {
        return (taxRate >= 100 || taxRate <= 0);
    }

    /**.
     * 判断字符串长度是否大于45
     * @param str 字符串
     * @return 字符串长度小于等于45则合法，返回false；字符串长度大于45则非法，返回true
     */
    private static boolean longerThan45(String str) {
        return str.length() > 45;
    }

    /**.
     * 判断字符串长度是否大于100
     * @param str 字符串
     * @return 字符串长度小于等于100则合法，返回false；字符串长度大于100则非法，返回true
     */
    private static boolean longerThan100(String str) {
        return str.length() > 100;
    }

    /**.
     * 判断日期长度是否溢出
     * @param date 日期
     * @return 日期长度大于10则溢出，返回true；日期长度小于等于10则返回false
     */
    private static boolean overflowDate(String date) {
        return date.length() > 10;
    }

    /**.
     * 保留价格的两位精度
     * @param price 价格
     * @return 保留两位精度后的价格
     */
    private static Double twoPricePrecision(Double price) {
        BigDecimal bigDecimal = new BigDecimal(price);
        return bigDecimal.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**.
     * 验证错误发票的格式
     * @param invoice 发票实体
     * @return 发票信息格式错误返回true，格式正确返回false
     */
    private static boolean wrongInvoice(Invoice invoice) {
        return (illegalCode(invoice.getCode()) || illegalId(invoice.getId()) ||
                overflowDate(invoice.getDate()) || longerThan100(invoice.getPayer().getName()) ||
                longerThan45(invoice.getPayer().getId()) || longerThan100(invoice.getPayer().getAddress()) ||
                longerThan45(invoice.getPayer().getPhoneNumber()) || longerThan100(invoice.getPayer().getBank()) ||
                longerThan45(invoice.getPayer().getBankId()) || longerThan45(invoice.getItems().getName()) ||
                longerThan45(invoice.getItems().getModel()) || longerThan45(invoice.getItems().getUnit()) ||
                illegalAmount(invoice.getItems().getAmount()) || illegalPrice(invoice.getItems().getPrice()) ||
                illegalTaxRate(invoice.getItems().getTaxRate()) || longerThan100(invoice.getPayee().getName()) ||
                longerThan45(invoice.getPayee().getId()) || longerThan100(invoice.getPayee().getAddress()) ||
                longerThan45(invoice.getPayee().getPhoneNumber()) || longerThan100(invoice.getPayee().getBank()) ||
                longerThan45(invoice.getPayee().getBankId()) || longerThan45(invoice.getDrawer()) ||
                longerThan100(invoice.getRemark()) || longerThan45(invoice.getCheckCode()));
    }

    /**.
     * 添加发票并判断是否添加成功
     * @param invoice 用于存储添加信息的临时发票，必须包含所有字段的信息
     * @return 添加成功返回true，添加失败返回false
     */
    public static boolean addInvoice(Invoice invoice) {
        if (wrongInvoice(invoice)) {
            return false;
        }
        Invoice tempInvoice = InvoiceDao.searchInvoice(invoice.getCode(), invoice.getId());
        if (tempInvoice == null) {
            Double newPrice = twoPricePrecision(invoice.getItems().getPrice());
            invoice.getItems().setPrice(newPrice);
            int changed = InvoiceDao.addInvoice(invoice);
            return changed != 0;
        }
        return false;
    }

    /**.
     * 删除发票并判断是否删除成功
     * @param code 分类代码
     * @param id 发票编号
     * @return 删除成功返回true，删除失败返回false
     */
    public static boolean deleteInvoice(String code, String id, String account) {
        int changed = InvoiceDao.deleteInvoice(code, id, account);
        return changed != 0;
    }

    /**.
     * 更新发票并判断是否更新成功
     * @param newInvoice 用于存储更新后信息的临时发票
     * @return 更新成功返回true，更新失败返回false
     */
    public static boolean updateInvoice(Invoice newInvoice) {
        if (wrongInvoice(newInvoice)) {
            return false;
        }
        Double newPrice = twoPricePrecision(newInvoice.getItems().getPrice());
        newInvoice.getItems().setPrice(newPrice);
        int changed = InvoiceDao.updateInvoice(newInvoice);
        return changed != 0;
    }

    /**.
     * 搜索发票
     * @param code 类别代码
     * @param id 发票编号
     * @param account 用户名
     * @return 若搜索成功，返回搜索到的发票实体；若搜索失败，返回null
     */
    public static Invoice searchInvoice(String code, String id, String account) {
        return InvoiceDao.searchInvoice(code, id, account);
    }

    public static int totalPage(int pageSize, String account) {
        int invoiceNumber = PageDao.getInvoiceAmount(account);
        return invoiceNumber % pageSize == 0 ? (invoiceNumber / pageSize) :
                (invoiceNumber / pageSize + 1);
    }

    /**.
     * 分页显示所有发票
     * @param pageNumber 当前页号
     * @param pageSize 页尺寸
     * @param account 账号
     * @return 当前页发票
     */
    public static List<Invoice> allInvoice(int pageNumber, int pageSize, String account) {
            return PageDao.allInvoice(pageNumber, pageSize, account);
    }

    public static void main(String[] args) {
        Invoice test = new Invoice();
        int j = 10000000;
        test.setCode("1234567890");
        test.setId("" + j);
        test.setDate("20160114");
        test.getPayer().setName("aaa");
        test.getPayer().setId("aaa");
        test.getPayer().setAddress("aaa");
        test.getPayer().setPhoneNumber("aaa");
        test.getPayer().setBank("aaa");
        test.getPayer().setBankId("aaa");
        test.getItems().setName("aaa");
        test.getItems().setModel("aaa");
        test.getItems().setUnit("aaa");
        test.getItems().setAmount(1);
        test.getItems().setPrice(500);
        test.getItems().setTaxRate(0.17);
        test.getPayee().setName("testCom");
        test.getPayee().setId("456");
        test.getPayee().setAddress("baiNaoHui");
        test.getPayee().setPhoneNumber("555");
        test.getPayee().setBank("hbank");
        test.getPayee().setBankId("456");
        test.setRemark("testRemark");
        test.setDrawer("testDrawer");
        test.setAccount("zhtr888");
        test.setCheckCode("111");
        for (;j<=10000200; j++) {
            test.setId("" + j);
            addInvoice(test);
        }
        test = searchInvoice("1234567890", "12345678", "123456");
        if (test == null) {
            System.out.println("invoice doesn't exist");
        } else {
            System.out.println(test.getCode());
            System.out.println(test.getPayer().getName());
            System.out.println(test.getItems().getName());
            System.out.println(test.getPayee().getName());
            System.out.println(test.getItems().getTotal());
            System.out.println(test.getItems().getTax());
            System.out.println(test.getItems().getIncome());
            System.out.println(test.getItems().getTotal2());
            System.out.println("----------------------------------------");
        }
        test = searchInvoice("1234567890", "87654321", "123456");
        if (test == null) {
            System.out.println("invoice doesn't exist");
        } else {
            System.out.println(test.getCode());
            System.out.println(test.getPayer().getName());
            System.out.println(test.getItems().getName());
            System.out.println(test.getPayee().getName());
            System.out.println(test.getItems().getTotal());
            System.out.println(test.getItems().getTax());
            System.out.println(test.getItems().getIncome());
            System.out.println(test.getItems().getTotal2());
            System.out.println("-----------------------------------------------");
        }
        deleteInvoice("1234567890", "87654321", "654321");
        test = searchInvoice("1234567890", "12345678", "123456");
        System.out.println(test.getRemark());
        System.out.println("---------------------------------------------");
        test.setRemark("after format");
        updateInvoice(test);
        System.out.println("----------------------------------------");
        test = searchInvoice(test.getCode(), test.getId(), "123456");
        System.out.println(test.getRemark());
        test.setRemark("before format");
        updateInvoice(test);

        List<Invoice> list = allInvoice(1, 2, "123456");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getItems().getName());
        }
        System.out.println("-------------------------");
        list = allInvoice(2, 2, "123456");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getItems().getName());
        }
    }
}
