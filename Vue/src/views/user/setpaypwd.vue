<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.replace('/user')"></div>
            <div class="big_tit">修改支付密码</div>
        </div>
        <div class="wrap">
            <div class="title">
                <p>设置新的支付密码</p>
                <div class="cut" v-if="!codeStatus" @click="cutType(1)">使用绑定手机验证</div>
                <div class="cut" v-if="codeStatus" @click="cutType(2)">使用登录密码验证</div>
            </div>
            <!--            <div class="title">
                <p>设置新的支付密码</p>
            </div> -->
            <p class="bd_tel" v-if="codeStatus">已绑定手机号：{{ycmobile}}</p>
            <div class="inp_box" v-if="codeStatus">
                <div class="inp">
                    <input type="number" v-model="code" placeholder="请输入短信验证码">
                </div>
                <!-- <div class="getcode reset_code">重新获取验证码</div> -->
                <van-count-down :time="time" class="btn getcode" @finish="timeCall">
                    <template v-slot="timeData">
                        <span @click="sendcode">{{timeData.seconds > 0 ? timeData.seconds : '发送验证码'}}</span>
                    </template>
                </van-count-down>
            </div>

            <div class="write_box" v-if="!codeStatus">
                <input :type="passwordInp" v-model="password" placeholder="请输入登录密码">
                <div class="eye_bi" @click="showPwd" :class="passwordInp=='text'?'eye':''"></div>
            </div>
            <div class="write_new_pwd">
                <div class="write_box">
                    <div class="wordBox" @click="showWord(1)">
                        <input :type="newpasswordInp" :disabled="true" v-model="npassword" placeholder="请输入6位纯数字">
                    </div>
                    <div class="eye_bi" @click="showNewsPwd" :class="newpasswordInp=='text'?'eye':''"></div>
                </div>
                <div class="write_box">
                    <div class="wordBox" @click="showWord(2)">
                        <input :type="newpasswordInp" :disabled="true" v-model="rpassword" placeholder="请确认新密码">
                    </div>
                    <div class="eye_bi" @click="showNewsPwd" :class="newpasswordInp=='text'?'eye':''"></div>
                </div>
            </div>
        </div>
        <div v-if="codeStatus" class="basic_btn" :class="rpassword!=''&&code!=''&&npassword!=''?'':'no_touch'" @click="dxRevise">确认修改</div>
        <div v-if="!codeStatus" class="basic_btn" :class="password!=''&&rpassword!=''&&npassword!=''? '':'no_touch'"
            @click="oldRevise">确认修改</div>
        <van-popup v-model="write_psd" closeable close-icon="close" round position="bottom">
        	<div class="psw_box">
        		<van-password-input :value="psd_val" :mask="true" :focused="showKeyboard" @focus="showKeyboard = true" />
        		<div class="keybord_box">
        			<div class="keybord">
        				<div class="key_item" @click="onInput(1)"><div class="key_inner">1</div></div>
        				<div class="key_item" @click="onInput(2)"><div class="key_inner">2</div></div>
        				<div class="key_item" @click="onInput(3)"><div class="key_inner">3</div></div>
        				<div class="key_item" @click="onInput(4)"><div class="key_inner">4</div></div>
        				<div class="key_item" @click="onInput(5)"><div class="key_inner">5</div></div>
        				<div class="key_item" @click="onInput(6)"><div class="key_inner">6</div></div>
        				<div class="key_item" @click="onInput(7)"><div class="key_inner">7</div></div>
        				<div class="key_item" @click="onInput(8)"><div class="key_inner">8</div></div>
        				<div class="key_item" @click="onInput(9)"><div class="key_inner">9</div></div>
        				<div class="key_item no_bg"><div class="key_inner"></div></div>
        				<div class="key_item" @click="onInput(0)"><div class="key_inner">0</div></div>
        				<div class="key_item no_bg x" @click="onDelete"><div class="key_inner">x</div></div>
        			</div>
        		</div>
        	</div>
        </van-popup>
    </div>
</template>

<script>
    import Vue from 'vue';
    import {
        CountDown,
    } from 'vant';
    import Fetch from '../../utils/fetch'
    
    import {
    	Popup
    } from 'vant';
    import {
    	PasswordInput,
    	NumberKeyboard
    } from 'vant';
    
    Vue.use(PasswordInput);
    Vue.use(NumberKeyboard);
    Vue.use(Popup)

    Vue.use(CountDown);

    export default {
        name: "setpwd",
        data() {
            return {
                showKeyboard: true,
                choose_tick: false,
                write_psd: false,
                time: 0,
                password: '',
                rpassword: '',
                npassword: '',
                mobile: '',
                ycmobile: '',
                passwordInp: 'password',
                newpasswordInp: 'password',
                codeStatus: true,
                psd_val:'',
                codeOK: false,
                code: '',
                is_send: false,
                nowInput: 1,
            };
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            Fetch('/user/info').then(r => {
                this.mobile = r.data.mobile;
                this.ycmobile = r.data.mobile.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
            })
        },
        methods: {
            showWord(n){
                n == 1 ? this.nowInput = 1: this.nowInput = 2;
                this.psd_val = '';
                this.write_psd = true;
            },
            onInput(key) {
            	this.psd_val = (this.psd_val + key).slice(0, 6);
            	if (this.psd_val.length == 6) {
                    if(this.nowInput == 1){
                        this.npassword = this.psd_val;
                    }else{
                        this.rpassword = this.psd_val;
                    }
                    this.write_psd = false;
            	}
            },
            onDelete() {
            	this.psd_val = this.psd_val.slice(0, this.psd_val.length - 1);
            },
            cutType(n) {
                n == 1 ? this.codeStatus = true : this.codeStatus = false;
                this.rpassword = '';
                this.npassword = '';
            },
            timeCall() {
                this.is_send = false;
                this.time = 0;
            },
            sendcode() {

                if (this.is_send) {
                    return;
                }

                this.is_send = true;

                Fetch("/index/forgetpwd_code", {
					mobile: this.mobile
                }).then(() => {
                    this.time = 60 * 1000;
                    this.$toast({
                        background: '#07c160',
                        message: '发送成功'
                    });
                }).catch(() => {
                    this.is_send = false;
                });

            },
            showPwd() {
                this.passwordInp == 'password' ? this.passwordInp = 'text' : this.passwordInp = 'password'
            },
            showNewsPwd() {
                this.newpasswordInp == 'password' ? this.newpasswordInp = 'text' : this.newpasswordInp = 'password'
            },
            dxRevise() {

                if (!this.npassword) {
                    this.$toast('新支付密码不能为空');
                    return false;
                }

                if (this.npassword !== this.rpassword) {
                    this.$toast('确认密码和新支付密码不一致');
                    return false;
                }

                Fetch('/user/resetpaypwd_code', {
                    code: this.code,
                    mobile: this.mobile,
                    npassword: this.npassword,
                }).then(() => {

                    this.$toast({
                        background: '#07c160',
                        message: '修改成功'
                    });
                    
                    sessionStorage.setItem('pwd',this.npassword);
                    
                    if(this.$route.query.redirect){
                    	this.$router.replace(this.$route.query.redirect+'?change');
                    }else{
                    	this.$router.replace('/safe')
                    }
                });

            },
            oldRevise() {

                if (!this.password) {
                    this.$toast('登录密码不能为空');
                    return false;
                }

                if (!this.npassword) {
                    this.$toast('新支付密码不能为空');
                    return false;
                }

                if (this.npassword !== this.rpassword) {
                    this.$toast('确认密码和新支付密码不一致');
                    return false;
                }
                var reg = new RegExp("^[0-9]*$");
                if (!reg.test(this.npassword)) {
                    this.$toast('请输入纯数字');
                    return false;
                }
                if (!reg.test(this.rpassword)) {
                    this.$toast('请输入纯数字');
                    return false;
                }
                Fetch('/user/resetpaypwd', {
                    passwd: this.password,
                    npasswd: this.npassword,
                }).then(() => {

                    this.$toast({
                        background: '#07c160',
                        message: '修改成功'
                    });

                    this.$router.replace('/safe')
                });
            },
        }
    };
</script>

<style lang="less" scoped>
    .wrap {
        padding: 35px 20px 0 20px;
    }
    .no_touch{
        pointer-events: none;
    }

    .title {
        width: 100%;
        height: 25px;
        line-height: 25px;
        display: flex;
        justify-content: space-between;
        align-items: center;

        p {
            font-size: 18px;
            color: #000;
            font-weight: 400;
        }

        .cut {
            font-size: 12px;
            color: #3D96FF;
        }
    }

    .bd_tel {
        margin-top: 23px;
        color: #000;
        font-size: 14px;
        font-weight: 400;
    }

    .inp_box {
        display: flex;
        justify-content: space-between;
        height: 45px;
        margin-top: 9px;

        .inp {
            width: 195px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 10px;
            border-radius: 2px;
            background-color: #FFFFFF;

            input {
                width: 100%;
                height: 22px;
                line-height: 22px;
                font-size: 16px;
            }
        }

        .getcode {
            flex: 1;
            margin-left: 10px;
            font-size: 16px;
            text-align: center;
            line-height: 45px;
            color: #FFFFFF;
            height: 45px;
            background: linear-gradient(90deg, rgba(228, 57, 46, 1) 0%, rgba(255, 77, 22, 1) 100%);
            border-radius: 8px;
        }

        .reset_code {
            background: rgba(228, 228, 228, 1);
            color: rgba(0, 0, 0, 0.3);
        }
    }

    .write_box {
        width: 335px;
        height: 45px;
        margin-top: 32px;
        background: rgba(255, 255, 255, 1);
        border-radius: 2px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0 10px;
        border-radius: 2px;
        background-color: #FFFFFF;

        input,.wordBox {
            width: 100%;
            height: 22px;
            line-height: 22px;
            font-size: 16px;
        }
    }

    .eye_bi {
        width: 21px;
        height: 25px;
        background: url(../images/user/eye2.png) no-repeat center center;
        background-size: 100% auto;

        &.eye {
            background: url(../images/user/eye1.png) no-repeat center center;
            background-size: 100% auto;
        }
    }

    .basic_btn {
        margin: 43px auto 0 auto;
    }

    .write_new_pwd {
        margin-top: 32px;

        .write_box:first-child {
            margin-bottom: 18px;
            margin-top: 0px;
        }

        .write_box:last-child {
            margin-top: 0px;
        }
    }
    
    /deep/ .van-password-input {
    	margin: 50px 28px 0 28px;
    }
    
    /deep/ .van-hairline--left::after {
    	border: 1px solid #ECECEC;
    }
    
    .van-password-input .van-password-input__security::after {
    	border-radius: 0;
    }
    
    .keybord_box {
    	height: 250px;
    	background-color: #F0F0F0;
    	margin-top: 35px;
    	padding: 24px 12px 0 12px;
    	.keybord{
    		width: 361px;
    		margin: 24px auto 0 atuo;
    		display: flex;
    		justify-content: space-between;
    		flex-wrap: wrap;
    		text-align: center;
    		.key_item{
    			width: 115px;
    			height: 44px;
    			line-height: 44px;
    			font-size: 18px;
    			font-weight: bold;
    			margin-bottom: 6px;
    			background:rgba(255,255,255,1);
    			border-radius:3px;
    			&.no_bg{
    				background: none;
    			}
    			&.x{
    				color: #757880;
    				font-weight: bold;
    			}
    		}
    	}
    }
</style>
