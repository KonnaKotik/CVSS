function calculate(event) {
    var av = document.forms[0];
    var av_value = "";
    for (i = 0; i < av.length; i++) {
        if (av[i].checked) {
            av_value = av[i].value;
        }
    }

    var ac = document.forms[1];
    var ac_value = "";
    for (i = 0; i < ac.length; i++) {
        if (ac[i].checked) {
            ac_value = ac[i].value;
        }
    }

    var pr = document.forms[2];
    var pr_value = "";
    for (i = 0; i < pr.length; i++) {
        if (pr[i].checked) {
            pr_value = pr[i].value;
        }
    }

    var ui = document.forms[3];
    var ui_value = "";
    for (i = 0; i < ui.length; i++){
        if (ui[i].checked) {
            ui_value = ui[i].value;
        }
    }

    var s = document.forms[4];
    var s_value = "";
    for (i = 0; i < s.length; i++){
        if (s[i].checked) {
            s_value = s[i].value;
        }
    }

    var c = document.forms[5];
    var c_value = "";
    for (i = 0; i < c.length; i++) {
        if (c[i].checked) {
            c_value = c[i].value;
        }
    }

    var i = document.forms[6];
    var i_value = "";
    for (b = 0; b < i.length; b++) {
        if (i[b].checked) {
            i_value = i[b].value;
        }
    }

    var a = document.forms[7];
    var a_value = "";
    for (i = 0; i < a.length; i++) {
        if (a[i].checked) {
            a_value = a[i].value;
        }
    }

    console.log(av_value + ac_value + pr_value + c_value + i_value + a_value);

    $.ajax({
        url: "/ajax/calculateBase",
        type: "post",
        data: {
            "AV": av_value,
            "AC": ac_value,
            "PR": pr_value,
            "UI": ui_value,
            "S": s_value,
            "C": c_value,
            "I": i_value,
            "A": a_value
        },
        success: function (data) {
            console.log(data);
            var result = document.getElementById("base_result");
            result.innerText = data;
        }
    })
}

function calculateTime(event) {
    var e = document.forms[8];
    var e_value = "";
    for (i = 0; i < e.length; i++) {
        if (e[i].checked) {
            e_value = e[i].value;
        }
    }

    var rl = document.forms[9];
    var rl_value = "";
    for (i = 0; i < rl.length; i++) {
        if (rl[i].checked) {
            rl_value = rl[i].value;
        }
    }

    var rc = document.forms[10];
    var rc_value = "";
    for (i = 0; i < rc.length; i++) {
        if (rc[i].checked) {
            rc_value = rc[i].value;
        }
    }

    console.log(e_value + rl_value + rc_value);

    $.ajax({
        url: "/ajax/calculateTime",
        type: "post",
        data: {
            "E": e_value,
            "RL": rl_value,
            "RC": rc_value,
        },
        success: function (data) {
            console.log(data);
            var result = document.getElementById("time_result");
            result.innerText = data;
        }
    })
}

function calculateContext(event) {
    var mav = document.forms[11];
    var mav_value = "";
    for (i = 0; i < mav.length; i++) {
        if (mav[i].checked) {
            mav_value = mav[i].value;
        }
    }

    var mac = document.forms[12];
    var mac_value = "";
    for (i = 0; i < mac.length; i++) {
        if (mac[i].checked) {
            mac_value = mac[i].value;
        }
    }

    var mpr = document.forms[13];
    var mpr_value = "";
    for (i = 0; i < mpr.length; i++) {
        if (mpr[i].checked) {
            mpr_value = mpr[i].value;
        }
    }

    var mui = document.forms[14];
    var mui_value = "";
    for (i = 0; i < mui.length; i++) {
        if (mui[i].checked) {
            mui_value = mui[i].value;
        }
    }

    var ms = document.forms[15];
    var ms_value = "";
    for (i = 0; i < ms.length; i++) {
        if (ms[i].checked) {
            ms_value = ms[i].value;
        }
    }
    var mc = document.forms[16];
    var mc_value = "";
    for (i = 0; i < mc.length; i++) {
        if (mc[i].checked) {
            mc_value = mc[i].value;
        }
    }

    var mi = document.forms[17];
    var mi_value = "";
    for (i = 0; i < mi.length; i++) {
        if (mi[i].checked) {
            mi_value = mi[i].value;
        }
    }

    var ma = document.forms[18];
    var ma_value = "";
    for (i = 0; i < ma.length; i++) {
        if (ma[i].checked) {
            ma_value = ma[i].value;
        }
    }

    var cr = document.forms[19];
    var cr_value = "";
    for (i = 0; i < cr.length; i++) {
        if (cr[i].checked) {
            cr_value = cr[i].value;
        }
    }

    var ir = document.forms[20];
    var ir_value = "";
    for (i = 0; i < ir.length; i++) {
        if (ir[i].checked) {
            ir_value = ir[i].value;
        }
    }

    var ar = document.forms[21];
    var ar_value = "";
    for (i = 0; i < ar.length; i++) {
        if (ar[i].checked) {
            ar_value = ar[i].value;
        }
    }

    console.log(mav_value + mac_value + mpr_value + mui_value + ms_value + mc_value + mi_value + ma_value);

    $.ajax({
        url: "/ajax/calculateContext",
        type: "post",
        data: {
            "MAV": mav_value,
            "MAC": mac_value,
            "MPR": mpr_value,
            "MUI": mui_value,
            "MS": ms_value,
            "MC": mc_value,
            "MI": mi_value,
            "MA": ma_value,
            "CR": cr_value,
            "IR": ir_value,
            "AR": ar_value
        },
        success: function (data) {
            console.log(data);
            var result = document.getElementById("context_result");
            result.innerText = data;
        }
    });
}
