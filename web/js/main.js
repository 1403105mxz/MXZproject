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