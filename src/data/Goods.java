package data;

import java.math.BigDecimal;

/**
 * Created by meng on 2016/11/15.
 */
public class Goods {
    private String name;
    private String model;
    private String unit;
    private int amount;
    private double price;
    private double total;
    private double taxRate;
    private double tax;
    private double finalTotal1;
    private String finalTotal2;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(double taxRate) {
        this.taxRate = taxRate;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getFinalTotal1() {
        return finalTotal1;
    }

    public void setFinalTotal1(double finalTotal1) {
        this.finalTotal1 = finalTotal1;
    }

    public String getFinalTotal2() {
        return finalTotal2;
    }

    public void setFinalTotal2(String finalTotal2) {
        this.finalTotal2 = finalTotal2;
    }

    public static Goods makeGoods(String name, String model, String unit,
                                  int amount, double price, double taxRate) {
        Goods goods = new Goods();

        double total = price * amount;
        double tax = taxRate * total;
        BigDecimal tmp = new BigDecimal(tax);
        tax = tmp.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        double finalTotal1 = tax + total;
        tmp = new BigDecimal(finalTotal1);
        String finalTotal2 = Tool.number2CNMontrayUnit(tmp);

        goods.setName(name);
        goods.setModel(model);
        goods.setUnit(unit);
        goods.setAmount(amount);
        goods.setPrice(price);
        goods.setTotal(total);
        goods.setTaxRate(taxRate);
        goods.setTax(tax);
        goods.setFinalTotal1(finalTotal1);
        goods.setFinalTotal2(finalTotal2);
        return goods;
    }
}
