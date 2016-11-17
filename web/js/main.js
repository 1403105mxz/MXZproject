/**
 * Created by 54333 on 2016/11/17.
 */
function invoiceCheck() {
    if("${tip}" != "") {
        document.getElementById("codeIdRepeat").style.visibility = "visible";
    }
    var d = new Date();
    if("${invoice.date}" == "") {
        document.getElementById("date").value = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
    }
}

function fmoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}

function delInvoice(code, id) {
    var r = confirm("确认作废该发票吗？");
    if(r == true) {
        location.href = "deleteInvoice?code=" + code + "&id=" + id;
    }
}