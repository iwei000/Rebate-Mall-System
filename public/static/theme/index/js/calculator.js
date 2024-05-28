/**
 * 
 */

$().ready(function(){
	$(".c_cpmbuttons").click(function() {
	    var account = $("#account").val();
	    var flag = true;
	    if (account == "") {
	        flag = false;
	        $("#calculErr").html("请输入投资金额");
	        $("#calculErr").show();
	        // 计算器校验问题 start
	    } else if (account > 5000000) {
	        flag = false;
	        $("#calculErr").html("投资金额最高为5000000元");
	        $("#calculErr").show();
	    }
	    var apr = $("#apr").val();
	    if (apr == "") {
	        flag = false;
	        $("#calculErr").html("请输入日利率");
	        $("#calculErr").show();
	    } else if (apr > 30) {
	        flag = false;
	        $("#calculErr").html("日利率最高30%");
	        $("#calculErr").show();
	    }
	    var statusStr = $(".select_showbox").eq(1).html();
	    if($(".select_box").eq(0).find(".selected").html()=="天标"){
	        status = 1;
	    }else if(statusStr=="一次性还"){
	        status = 2;
	    }else if(statusStr=="每月付息"){
	        status = 3;
	    }else if(statusStr=="等额本息"){
	        status = 4;
	    }
	    var periods = $("#periods").val();
	    if (periods == "") {
	        flag = false;
	        $("#calculErr").html("请输入投资期限");
	        $("#calculErr").show();
	    } else if (periods > 0) {
	        if (!/^[0-9]*[1-9][0-9]*$/.test(periods)) {
	            flag = false;
	            $("#calculErr").html("投资期限-请输入正整数");
	            $("#calculErr").show();
	        }
	        if($(".select_box").eq(0).find(".selected").html()=="天标"  && periods > 999){
	            flag = false;
	            $("#calculErr").html("投资期限-天标最大为999天");
	            $("#calculErr").show();
	        }else if($(".select_box").eq(0).find(".selected").html()!="天标" && periods > 999 ){
	            flag = false;
	            $("#calculErr").html("投资期限-天标最大为999天");
	            $("#calculErr").show();
	        }
	    } else if (periods <= 0) {
	        flag = false;
	        $("#calculErr").html("投资期限-请输入正数");
	        $("#calculErr").show();
	    }
	    // 计算器校验问题 end
	    if (flag) {
	        $("#calculErr").html("");
	        $("#calculErr").hide();
	        var html='';
	        html+='<li>';
	        html+='<dl class="c_dd_titlecpm">';
	        html+='<dd>收款日期</dd>';
	        html+='<dd>收款金额</dd>';
	        html+='<dd>收回本金</dd>';
	        html+='<dd>收回利息</dd>';
	        html+='<dd class="c_cpmlastdd" >剩余本金</dd>';
	        html+='</dl>';
	        html+='</li>';
	        var html2 = '';
	        if($(".select_showbox").val() == "1"){//到期还本还息
	            html+='<li>';
	            html+='<dl class="c_dd_titlecpm">';
	            html+='<dd>'+GetDateStr(parseInt(periods))+'</dd>';
	            html+='<dd>'+(parseFloat(periods*apr*account/100)+parseFloat(account))+'</dd>';
	            html+='<dd>'+(account)+'</dd>';
	            html+='<dd>'+(periods*apr*account/100)+'</dd>';
	            html+='<dd class="c_cpmlastdd" >0</dd>';
	            html+='</dl>';
	            html+='</li>';

	            html2+='<li>';
	            html2+='<dl>';
	            html2+='<dd>总结</dd>';
	            html2+='<dd>'+((parseFloat(periods*apr*account/100)+parseFloat(account)).toFixed(2))+'</dd>';
	            html2+='<dd>'+(account)+'</dd>';
	            html2+='<dd>'+((periods*apr*account/100).toFixed(2))+'</dd>';
	            html2+='<dd class="c_lastdd" ></dd>';
	            html2+='</dl>';
	            html2+='</li>';
	            html2+='<li class="c_libottomcpm libottomcpm">实际总收益：<span>￥'+((periods*apr*account/100).toFixed(2))+'元</span></li>';
	        }
	        else if($(".select_showbox").val() == "2"){//每日返息，到期还本
	            for(var i = 1;i<= periods;i++){
	                html+='<li>';
	                html+='<dl class="c_dd_titlecpm">';
	                html+='<dd>'+GetDateStr(parseInt(i))+'</dd>';
	                if(i==periods){
	                    html+='<dd>'+(parseFloat(apr*account/100)+parseFloat(account))+'</dd>';
	                    html+='<dd>'+(account)+'</dd>';
	                }
	                else{
	                    html+='<dd>'+(apr*account/100)+'</dd>';
	                    html+='<dd>0</dd>';
	                }
	                html+='<dd>'+(apr*account/100)+'</dd>';
	                if(i!=periods) {
	                    html += '<dd class="c_cpmlastdd" >'+(account)+'</dd>';
	                }
	                else{
	                    html += '<dd class="c_cpmlastdd" >0</dd>'
	                }
	                html+='</dl>';
	                html+='</li>';
	            }

	            html2+='<li>';
	            html2+='<dl>';
	            html2+='<dd>总结</dd>';
	            html2+='<dd>'+((parseFloat(periods*apr*account/100)+parseFloat(account)).toFixed(2))+'</dd>';
	            html2+='<dd>'+(account)+'</dd>';
	            html2+='<dd>'+((periods*apr*account/100).toFixed(2))+'</dd>';
	            html2+='<dd class="c_lastdd" ></dd>';
	            html2+='</dl>';
	            html2+='</li>';
	            html2+='<li class="c_libottomcpm libottomcpm">实际总收益：<span>￥'+((periods*apr*account/100).toFixed(2))+'元</span></li>';
	        }
	        else if($(".select_showbox").val() == "3"){//每周返息，到期还本
	            periods = parseInt(periods/7);
	            for(var i = 1;i<= periods;i++){
	                html+='<li>';
	                html+='<dl class="c_dd_titlecpm">';
	                html+='<dd>'+GetDateStr(parseInt(i*7))+'</dd>';
	                if(i==periods){
	                    html+='<dd>'+(parseFloat(apr*account/100*7)+parseFloat(account))+'</dd>';
	                    html+='<dd>'+(account)+'</dd>';
	                }
	                else{
	                    html+='<dd>'+(apr*account/100*7)+'</dd>';
	                    html+='<dd>0</dd>';
	                }
	                html+='<dd>'+(apr*account/100*7)+'</dd>';
	                if(i!=periods) {
	                    html += '<dd class="c_cpmlastdd" >'+(account)+'</dd>';
	                }
	                else{
	                    html += '<dd class="c_cpmlastdd" >0</dd>'
	                }
	                html+='</dl>';
	                html+='</li>';
	            }

	            html2+='<li>';
	            html2+='<dl>';
	            html2+='<dd>总结</dd>';
	            html2+='<dd>'+((parseFloat(periods*apr*account/100*7)+parseFloat(account)).toFixed(2))+'</dd>';
	            html2+='<dd>'+(account)+'</dd>';
	            html2+='<dd>'+((periods*apr*account/100*7).toFixed(2))+'</dd>';
	            html2+='<dd class="c_lastdd" ></dd>';
	            html2+='</dl>';
	            html2+='</li>';
	            html2+='<li class="c_libottomcpm libottomcpm">实际总收益：<span>￥'+((periods*apr*account/100*7).toFixed(2))+'元</span></li>';
	        }
	        else if($(".select_showbox").val() == "4") {//每月返息，到期还本
	            periods = parseInt(periods/30);
	            for(var i = 1;i<= periods;i++){
	                html+='<li>';
	                html+='<dl class="c_dd_titlecpm">';
	                html+='<dd>'+GetDateStr(parseInt(i*30))+'</dd>';
	                if(i==periods){
	                    html+='<dd>'+(parseFloat(apr*account/100*30)+parseFloat(account))+'</dd>';
	                    html+='<dd>'+(account)+'</dd>';
	                }
	                else{
	                    html+='<dd>'+(apr*account/100*30)+'</dd>';
	                    html+='<dd>0</dd>';
	                }
	                html+='<dd>'+(apr*account/100*30)+'</dd>';
	                if(i!=periods) {
	                    html += '<dd class="c_cpmlastdd" >'+(account)+'</dd>';
	                }
	                else{
	                    html += '<dd class="c_cpmlastdd" >0</dd>'
	                }
	                html+='</dl>';
	                html+='</li>';
	            }

	            html2+='<li>';
	            html2+='<dl>';
	            html2+='<dd>总结</dd>';
	            html2+='<dd>'+((parseFloat(periods*apr*account/100*30)+parseFloat(account)).toFixed(2))+'</dd>';
	            html2+='<dd>'+(account)+'</dd>';
	            html2+='<dd>'+((periods*apr*account/100*30).toFixed(2))+'</dd>';
	            html2+='<dd class="c_lastdd" ></dd>';
	            html2+='</dl>';
	            html2+='</li>';
	            html2+='<li class="c_libottomcpm libottomcpm">实际总收益：<span>￥'+((periods*apr*account/100*30).toFixed(2))+'元</span></li>';
	        }
	        else if($(".select_showbox").val() == "5") {//每日复利，保本保息
	            var account2 = account;
	            var lx = 0;
	            for(var i = 1;i<= periods;i++){
	                if(i!=1){
	                    account =(parseFloat(account)+parseFloat(apr*account/100)).toFixed(2);
	                }
	                lx += parseFloat(apr*account/100).toFixed(2);//计算利息
	                html+='<li>';
	                html+='<dl class="c_dd_titlecpm">';
	                html+='<dd>'+GetDateStr(parseInt(i))+'</dd>';
	                if(i==periods){
	                    html+='<dd>'+(parseFloat(account)+parseFloat(apr*account/100)).toFixed(2)+'</dd>';
	                    html+='<dd>'+(account)+'</dd>';
	                }
	                else{
	                    html+='<dd>'+(apr*account/100).toFixed(2)+'</dd>';
	                    html+='<dd>0</dd>';
	                }
	                html+='<dd>'+(apr*account/100).toFixed(2)+'</dd>';
	                if(i!=periods) {
	                    html += '<dd class="c_cpmlastdd" >'+(account)+'</dd>';
	                }
	                else{
	                    html += '<dd class="c_cpmlastdd" >0</dd>'
	                }
	                html+='</dl>';
	                html+='</li>';
	            }

	            html2+='<li>';
	            html2+='<dl>';
	            html2+='<dd>总结</dd>';
	            html2+='<dd>'+((parseFloat(account)+parseFloat(apr*account/100)).toFixed(2))+'</dd>';
	            html2+='<dd>'+(account2)+'</dd>';
	            html2+='<dd>'+((parseFloat(account)+parseFloat(apr*account/100)-parseFloat(account2)).toFixed(2))+'</dd>';
	            html2+='<dd class="c_lastdd"></dd>';
	            html2+='</dl>';
	            html2+='</li>';
	            html2+='<li class="c_libottomcpm libottomcpm">实际总收益：<span>￥'+((parseFloat(account)+parseFloat(apr*account/100)).toFixed(2))+'元</span></li>';
	        }
	        else if($(".select_showbox").val() == "6") {//交易日返息，到期还本
	            var weekDay = ["7", "1", "2", "3", "4", "5", "6"];
	            var jia = 0;
	            for(var i = 1;i<= periods;i++){
	                var dateStr = GetDateStr(parseInt(i));
	                var myDate = new Date(Date.parse(dateStr.replace(/-/g, "/")));
	                if(weekDay[myDate.getDay()] == "6"){
	                    jia += 2;
	                }
	                if(weekDay[myDate.getDay()] == "7"){
	                    jia += 1;
	                }

	                html+='<li>';
	                html+='<dl class="c_dd_titlecpm">';
	                html+='<dd>'+GetDateStr(parseInt(i+jia))+'</dd>';
	                if(i==periods){
	                    html+='<dd>'+(parseFloat(apr*account/100)+parseFloat(account))+'</dd>';
	                    html+='<dd>'+(account)+'</dd>';
	                }
	                else{
	                    html+='<dd>'+(apr*account/100)+'</dd>';
	                    html+='<dd>0</dd>';
	                }
	                html+='<dd>'+(apr*account/100)+'</dd>';
	                if(i!=periods) {
	                    html += '<dd class="c_cpmlastdd" >'+(account)+'</dd>';
	                }
	                else{
	                    html += '<dd class="c_cpmlastdd" >0</dd>'
	                }
	                html+='</dl>';
	                html+='</li>';
	            }

	            html2+='<li>';
	            html2+='<dl>';
	            html2+='<dd>总结</dd>';
	            html2+='<dd>'+((parseFloat(periods*apr*account/100)+parseFloat(account)).toFixed(2))+'</dd>';
	            html2+='<dd>'+(account)+'</dd>';
	            html2+='<dd>'+((periods*apr*account/100).toFixed(2))+'</dd>';
	            html2+='<dd class="c_lastdd" ></dd>';
	            html2+='</dl>';
	            html2+='</li>';
	            html2+='<li class="c_libottomcpm">实际总收益：<span>￥'+((periods*apr*account/100).toFixed(2))+'元</span></li>';
	        }
	        $('#calculatorList').html(html);
	        $(".c_bottomcpm").html(html2);
	        $(".c_calculatorCpmLeft").hide();
	        $(".c_calculatorCpmRight").show();
	    }
	});
	
});
    
$(function() {
    $(".c_show_left").click(function() {
        $(".c_calculatorCpmLeft").show();
        $(".c_calculatorCpmRight").hide();
    })
});
function GetDateStr(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    /*var y = dd.getFullYear();
    y = y.toString().substr(2,2); */
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    m = m < 10?"0" + m : m;
    d = d < 10?"0" + d : d;
    return m+"-"+d;
}
