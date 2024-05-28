<template>
    <div class="basic_wrap">
        <div class="login_bg">
            <div class="back_left" @click="$router.back()"></div>
            <div class="big_tit">账号登陆</div>
        </div>
        <form class="form">
            <div class="cut_login">
                <router-link class="cur" to="/login"
                    >登陆
                    <div class="line"></div>
                </router-link>
                <router-link to="/register"
                    >注册
                    <div class="line"></div>
                </router-link>
            </div>
            <div class="item mt">
                <span class="icon">
                    <img src="../images/login/tel.png" alt="" />
                </span>
                <input
                    type="text"
                    class="inp"
                    v-model.trim="data.username"
                    placeholder="请输入手机号码"
                />
            </div>
            <div class="item">
                <span class="icon"
                    ><img src="../images/login/lock.png" alt=""
                /></span>
                <input
                    :type="password"
                    class="inp"
                    v-model.trim="data.password"
                    placeholder="请输入登录密码"
                />
                <div
                    class="eye_bi"
                    @click="showPwd"
                    :class="password == 'text' ? 'eye' : ''"
                ></div>
            </div>
            <div class="item_reset_pwd">
				<van-checkbox v-model="checked" icon-size="14px">记住密码</van-checkbox>
                <router-link class="reset_pwd" to="/forgetpwd">忘记密码</router-link
                >
            </div>
        </form>
        <div
            type="submit"
            class="basic_btn sbtn"
            :class="
                data.username == '' || data.password == '' ? 'no_touch' : ''
            "
            @click="submit"
        >
            立即登录
        </div>
        <div
            v-if="msg_show"
            class="kefu"
            :class="show_kefu ? '' : 'kefu_hide'"
            @click="kefu_to"
        >
            <img class="kefu_img" src="../images/index/kefu.png" />
        </div>
    </div>
</template>

<script>
import Vue from 'vue'
import Fetch from "../../utils/fetch"
import {CountDown, Checkbox} from 'vant'
Vue.use(Checkbox)

export default {
    name: "login",
    data() {
        return {
            password: "password",
            show_kefu: false,
            msg_show: true,
			checked: false,
            data: {
                username: "",
                password: "",
            },
        };
    },
    created() {
		this.data.username = localStorage.getItem('login_username');
		this.data.password = localStorage.getItem('login_password');
        this.$parent.footer("user", false);
    },
    mounted() {
        var that = this;
        document.body.addEventListener(
            "scroll",
            function() {
                if (!that.show_kefu) {
                    return;
                }
                that.show_kefu = false;
            },
            false
        );
        document.addEventListener(
            "click",
            function(ev) {
                if (ev.target.className != "kefu_img") {
                    that.show_kefu = false;
                }
            },
            false
        );
    },
    methods: {
        kefu_to() {
            if (this.show_kefu) {
                this.$router.push("/kefu");
            }
            this.show_kefu = !this.show_kefu;
        },
        showPwd() {
            if (this.password == "password") {
                this.password = "text";
            } else {
                this.password = "password";
            }
        },
        submit() {
            if (!this.data.username) {
                this.$toast("请输入手机号码");
                return;
            }

            if (!this.data.password) {
                this.$toast("请输入登录密码");
                return;
            }

            var regex = /^[A-Za-z0-9]{1,20}$/;
            if (!regex.test(this.data.username)) {
                this.$toast("用户名只能为数字或字母");
                return;
            }
			
			if(this.checked){
				localStorage.setItem('login_username', this.data.username);
				localStorage.setItem('login_password', this.data.password);
			}
			
			if(!this.checked){
				localStorage.removeItem('login_username');
				localStorage.removeItem('login_password');
			}

            Fetch("/index/login", {
                username: this.data.username,
                password: this.data.password
            })
                .then((res) => {
					if(res.data.token){
					    localStorage.setItem('token', res.data.token);
					}
                    this.$toast({
                        background: "#07c160",
                        message: "登录成功",
                    });
                })
                .then(() => {
                    this.$router.replace({
                        path:
                            this.$router.history.current.query.redirect || "/",
                    });
                });
        },
    },
};
</script>

<style lang="less" scoped>
.login_bg {
    width: 100%;
    height: 178px;
    overflow: hidden;
    background: url(../images/login/login_bg.png) no-repeat center center;
    background-size: 100% 100%;
}

.basic_wrap .form {
    margin: -115px auto 0 auto;
    width: 335px;
    height: 332px;
    background: rgba(255, 255, 255, 1);
    box-shadow: 0px 4px 9px 2px rgba(160, 160, 160, 0.15);
    border-radius: 13px;
    padding: 31px 24px 0 24px;
}

.cut_login {
    width: 207px;
    line-height: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    text-align: center;
    margin: 0 auto;

    a {
        width: 50%;
        padding-bottom: 10px;
        color: #ceced0;
        position: relative;

        .line {
            width: 100%;
            height: 1px;
            position: absolute;
            left: 0;
            bottom: 0;
            background-color: #f2f2f2;
        }
    }

    a.cur {
        color: #f12211;

        .line {
            height: 2px;
            background-image: linear-gradient(to right, #f12211, #f18a11);
        }
    }
}

.mt {
    margin-top: 20px;
}

.item {
    height: 68px;
    border-bottom: 1px solid #f0f1f3;
    font-size: 14px;
    display: flex;
    justify-content: flex-start;
    align-items: flex-end;
    padding-bottom: 4px;

    .icon {
        width: 32px;
        height: 27px;

        img {
            width: 100%;
            height: 100%;
        }
    }

    input {
        height: 20px;
        margin-left: 7px;
        flex: 1;
        margin-bottom: 3px;
    }
}

.item_reset_pwd {
    font-size: 14px;
    color: #3d96ff;
    text-align: right;
    margin-top: 10px;
    line-height: 20px;
}
.van-checkbox{
	margin-top: 20px;
}
.reset_pwd{
	color: #3d96ff;
	margin-top: -20px;
	display: block;
}

.basic_btn {
    margin: 39px auto 0 auto;
}
</style>
