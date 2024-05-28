<template>
  <div class="recharge_wrap">
    <div class="red_top_bg">
      <div
        class="back_left"
        @click="$router.push('/user')"
      />
      <div class="big_tit">
        账户充值
      </div>
      <!-- <p class="top_right">充值提交记录</p> -->
    </div>
    <form class="form">
      <div class="recharge_box flex_center">
        <input
          v-model.trim="data.money"
          type="number"
          step="0.01"
          class="inp"
          placeholder="请输入充值金额"
        >
      </div>
      <div class="recharge_fs">
        <div class="tit">
          选择支付方式
        </div>
        <div
          v-for="(v, k) in config.config"
          v-if="v.is_show"
          :key="k"
          class="item"
        >
          <div
            class="check"
            :class="v.key == data.channel? 'checked' : ''"
            @click="choose_type(v.key)"
          />
          <div
            class="re_icon"
            :class="v.key"
          />
          <div class="re_name">
            {{ v.name }}
          </div>
        </div>
      </div>
    </form>
    <div
      class="basic_btn sbtn"
      @click="submit"
    >
      下一步
    </div>
  </div>
</template>

<script>

    import Vue from 'vue';
    import {CountDown, Checkbox, RadioGroup, Radio} from 'vant';
	import {jsBridge} from '../../utils/jsbridge-mini.js';
    import Fetch from '../../utils/fetch'

    Vue.use(RadioGroup);
    Vue.use(Radio);
    Vue.use(CountDown).use(Checkbox);

    export default {
        name: "Register",
        data() {
            return {
                time: 0,
                data: {
                    channel: '',
                    money: '',
                },
                config: {},
            };
        },
        created() {
            this.$parent.footer('user',false);
        },
        mounted() {
            this.start();
        },
        methods: {
            start() {
                Fetch('/user/recharge', {
                    ...this.data
                }).then((r) => {
                    this.config = r.data;
                    this.config.min_recharge = parseInt(this.config.min_recharge);
                });
            },
            checkLimit(){
                const key = 'invest_button'
                const ttl = 300
                let now = Date.parse(new Date())/1000
                let val = localStorage.getItem(key)
                if (!val) {
                    val = JSON.stringify({'ttl':now + ttl})
                    localStorage.setItem(key,val)
                    // alert('true')
                    return true
                }else{
                    val = JSON.parse(val)
                    if (val['ttl'] > now) {
                        // alert('false')
                        return false
                    }else{
                        val = JSON.stringify({'ttl':now + ttl})
                        localStorage.setItem(key,val)
                        // alert('true')
                        return true
                    }
                }
            },
			choose_type(type){
				this.data.channel = type;
			},
            submit() {
                if (!this.data.channel) {
                    this.$toast('请选择充值类型');
                    return false;
                }

                if (!this.data.money || this.data.money < this.config.min_recharge) {
                    this.$toast('充值金额不能为空或小于' + this.config.min_recharge);
                    return false;
                }

                // if (!this.checkLimit()) {
                //     this.$toast('充值频率过高');
                //     return false;
                // }
				
				if(this.data.channel=='bank'||this.data.channel=='gz_bank'||this.data.channel=='alipay_bank'||this.data.channel=='wx_bank'){
				    this.$router.replace({
				        path: '/invest/bank',
				        query: {
				            money: this.data.money,
							type : this.data.channel
				        }
				    });
				}else if(this.data.channel=='alipay_app'){
					var that = this;
					jsBridge.ready(function () {
						Fetch("/user/recharge_type",{type: that.data.channel,money:that.data.money}).then(res => {
							jsBridge.aliPay({
								orderString: res.data.alipay_app
							}, function (succ, text) {
								if (succ) {
									that.$toast('支付成功');
									that.$router.push('/moneybag');
								} else {
									that.$toast('支付失败');
									that.$router.push('/moneybag');
								}
							});
						})
					})
					return;
				}else{
					this.$router.replace({
						path: '/invest/' + this.data.channel,
						query: {
							money: this.data.money,
						}
					});
				}

                


                // Fetch('/user/invest/apply', {
                //     ...this.data
                // }).then(() => {
                //     this.$router.replace('/login');
                // });
            },
        }
    };
</script>

<style lang="less" scoped>
	.red_top_bg{
		position: relative;
	}
	.top_right{
		position: absolute;
		font-size: 13px;
		line-height: 18px;
		color: #FFFFFF;
		top: 36px;
		right: 14px;
	}
	.recharge_fs{
		margin-top: 10px;
        background:rgba(255,255,255,1);
        box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
        border-radius:6px;
        padding: 0 16px;
	}
	.recharge_box{
		width:100%;
		height:48px;
		background:rgba(255,255,255,1);
		box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
		border-radius:6px;
		margin-top: 12px;
		padding: 16px 11px;
		
		input{
			height: 18px;
            width: 100%;
			line-height: 18px;
			font-size: 14px;
		}
	}
	.form{
		width:100%;
		margin-top: 12px;
		
		.tit{
			height: 54px;
			border-bottom: 1px solid #ECECEC;
			font-size: 16px;
			color: rgba(0,0,0,.8);
            font-weight: bold;
			line-height: 54px;
		}
		.item{
			height: 57px;
			border-bottom: 1px solid #ECECEC;
			display: flex;
			justify-content: flex-start;
			align-items: center;
			&:last-child{
				border-bottom: none;
			}
			.check{
				width: 16px;
				height: 16px;
				margin-left: 4px;
				background: url(../images/user/c2.png) no-repeat center center;
				background-size: 100% 100%;
				&.checked{
					background: url(../images/user/c1.png) no-repeat center center;
					background-size: 100% 100%;
				}
			}
			.re_icon{
				width: 20px;
				height: 20px;
				margin-left: 11px;
				background: url(../images/user/recharge3.png) no-repeat center center;
				background-size: 100% 100%;
			}
			.re_name{
				font-size: 16px;
				line-height: 22px;
				color: rgba(0,0,0,.8);
				margin-left: 4px;
			}
			.wx{
				background: url(../images/user/recharge1.png) no-repeat center center;
				background-size: 100% 100%;
			}
			.alipay{
				background: url(../images/user/recharge2.png) no-repeat center center;
				background-size: 100% 100%;
			}
			.alipay_app{
				background: url(../images/user/recharge2.png) no-repeat center center;
				background-size: 100% 100%;
			}
			.bank{
				background: url(../images/user/recharge3.png) no-repeat center center;
				background-size: 100% 100%;
			}
		}
	}
	.sbtn{
		margin: 75px auto 0 auto;
	}
</style>