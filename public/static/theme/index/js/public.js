/**
 * 
 */

$().ready(function(){
	$("#go_top").css("display","none");
	$(window).scroll(function () {
        if ($(window).scrollTop() > 100) {
            $("#go_top").fadeIn(500);
            // console.log($(window).scrollTop())
            // console.log(window.innerHeight)
        }else {
            $("#go_top").fadeOut(500);
        }
    });
    //当点击跳转链接后，回到页面顶部位置
    $("#go_top").click(function () {
        $('body,html').animate({scrollTop: 0}, 300);
        return false;
    });
});

function timer(time) {
    var btn = $("#getcode");
    btn.addClass("on");
    btn.attr("disabled", true);  //按钮禁止点击
    btn.text(time <= 0 ? "发送" : ("" + (time--) + "s"));
    var hander = setInterval(function() {
        if (time <= 0) {
            clearInterval(hander); //清除倒计时
            btn.text("发送");
            btn.removeClass("on");
            btn.attr("disabled", false);
            return false;
        }else {
            btn.text("" + (time--) + "s");
        }
    }, 1000);
}
//密码可见与不可见切换
function checkPwd(txt,btn){
    var pwd = document.getElementById(txt);
    var btn = document.getElementById(btn);
    var flag = true;
    btn.onclick = function(){
        if(flag){
            pwd.type="text";
            flag = false;
            btn.src = "/Public/mobile/img/see_not.png"
        }else{
            pwd.type="password";
            flag = true;
            btn.src = "/Public/mobile/img/see.png";
        }
    }
}
//每日签到
function qiandao() {
    var url = "/index/user/sign";
    $.ajax({
        type: "POST",
        url: url,
        data: {phone: 1},
        dataType: "json",
        success: function (result) {
            if (result['code'] == "1") {
                msg("提示",result['info'],1);
            } else {
                if(result['code'] == "2"){
                    msg("错误",result['info'],2,'/index/user/certification.html');
                }
                else{
                    msg("错误",result['info'],1);
                }
            }
        },
        error: function () {
            msg("错误","网络繁忙，签到失败！",1);
        }
    });
}
//百分数小数
function toPoint(percent){
    var str=percent.replace("%","");
    str= str/100;
    return str;
}

//小数转百分数
function toPercent(point){
    var str=Number(point*100).toFixed(1);
    str+="%";
    return str;
}