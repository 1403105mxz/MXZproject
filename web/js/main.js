/**
 * Created by 54333 on 2016/11/17.
 */
function checkDate(date) {
    var d = new Date();
    if (date == "" || date == null) {
        document.getElementById("date").value = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
    }
}

function checkTip(tip) {
    if (tip == "invoiceError") {
        document.getElementById("codeIdRepeat").style.display = "block";
    }
}

function checkDetailInvoice(branchAccount) {
    if (branchAccount != "") {
        document.getElementById("delete").style.display = "none";
        document.getElementById("edit").style.display = "none";
        document.getElementById("back").style.display = "none";
    }
}

function fmoney(s, n) {
    n = n >= 0 && n <= 20 ? n : 20;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
    var t = "";
    for (var i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    if (n > 0) {
        return t.split("").reverse().join("") + "." + r;
    }
    else if (n == 0) {
        return t.split("").reverse().join("");
    }
}

function delInvoice(code, id) {
    var r = confirm("确认作废该发票吗？");
    if (r == true) {
        location.href = "DeleteInvoice?code=" + code + "&id=" + id;
    }
}

function checkWage(id) {
    if(id == 5) {
        document.getElementById("myWage").style.display = "none";
    }
    else if(id <= 3) {
        document.getElementById("wageList").style.display = "none";
    }
}

function tax() {
    var salaryBeforeTax = document.getElementById("before").value;
    var taxbase=salaryBeforeTax-3500;
    var Taxrate=0;//这里税率没有除以百分比；
    var Quickdeduction=0;
    var salaryAfterTax;
    if(taxbase <=0)//低于个税起征点
    {
        salaryAfterTax = salaryBeforeTax;
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
    document.getElementById("after").value = salaryAfterTax;
}