package action;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by dell on 2016/12/11.
 */
public class Taxrate {
    private int salaryAfterTax;
    private int salaryBeforeTax;

    public int getSalaryAfterTax() {
        return salaryAfterTax;
    }

    public void setSalaryAfterTax(int salaryAfterTax) {
        this.salaryAfterTax = salaryAfterTax;
    }

    public int getSalaryBeforeTax() {
        return salaryBeforeTax;
    }

    public void setSalaryBeforeTax(int salaryBeforeTax) {
        this.salaryBeforeTax = salaryBeforeTax;
    }

    public String salaryAfterTax()
    {
//      （3W-3.5K）*25%-1005
//      扣税公式是：
//      （扣除社保医保公积金后薪水-个税起征点）*税率-速算扣除数
        int taxbase=salaryBeforeTax-3500;
        int Taxrate=0;//这里税率没有除以百分比；
        int Quickdeduction=0;
        if(taxbase <=0)//低于个税起征点
        {
            salaryAfterTax = salaryBeforeTax;
            return SUCCESS;
        }else if(taxbase <=1500)
        {
            Taxrate=3;
            Quickdeduction=0;
        }else if(taxbase <=4500)
        {
            Taxrate=10;
            Quickdeduction=105;
        }else if(taxbase <=9000)
        {
            Taxrate=20;
            Quickdeduction=555;
        }else if(taxbase <=35000)
        {
            Taxrate=25;
            Quickdeduction=1005;
        }else if(taxbase <=55000)
        {
            Taxrate=30;
            Quickdeduction=2755;
        }else if(taxbase <=80000)
        {
            Taxrate=35;
            Quickdeduction=5505;
        }else
        {
            Taxrate=45;
            Quickdeduction=13505;
        }
        salaryAfterTax = salaryBeforeTax-((salaryBeforeTax-3500)*Taxrate/100-Quickdeduction);
        return SUCCESS;
    }

}


