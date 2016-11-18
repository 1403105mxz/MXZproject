/**
 * Created by 54333 on 2016/11/17.
 */
function checkDate(date) {
    var d = new Date();
    if(date == "") {
        document.getElementById("date").value = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
    }
}

function checkTip(tip) {
    if(tip == "invoiceError") {
        document.getElementById("codeIdRepeat").style.display = "block";
    }
}

function fmoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
    var t = "";
    for (var i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}

function delInvoice(code, id) {
    var r = confirm("确认作废该发票吗？");
    if(r == true) {
        location.href = "DeleteInvoice?code=" + code + "&id=" + id;
    }
}