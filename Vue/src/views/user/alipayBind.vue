<template>
    <div class="bank_wrap">
        <div class="back_orange">
            <router-link to="/user" class="back_to"></router-link>
            支付宝信息
        </div>
        <div class="warming">
            您绑定的支付宝必须与您认证的实名一致，否则将无法成功提现
        </div>
        <form class="form" @submit.prevent="submit">
            <div class="item">
                <span class="info">真实姓名</span>
                <input type="text" class="inp" v-model="bankinfo.username" readonly/>
            </div>
            <div class="item">
                <span class="info">支付宝账号</span>
                <input type="text" class="inp" v-model="bankinfo.card" v-bind:readonly="is_bind"
                       placeholder="请输入支付宝账号"/>
            </div>
            <button type="submit" class="btn sbtn">完善信息</button>
        </form>
    </div>
</template>

<script>

    import Fetch from '../../utils/fetch';

    export default {
        name: "login",
        data() {
            return {
                is_bind: false,
                bankinfo: {
                    username: '',
                    card: '',
		    type:'A'	  
                }
            };
        },
        created() {
            this.$parent.footer('user');
        },
        mounted() {
            this.start();
        },
        methods: {
            start() {
                Fetch('/user/bank/index?type=A').then((r) => {
                    this.bankinfo = r.data.bank;
                    this.is_bind = r.data.is_bind;
                });
            },
            submit() {

                if(this.is_bind){
                    this.$toast("如需修改支付宝信息，请联系客服修改");
                    return;
                }
		this.bankinfo.type = "A"
		this.bankinfo.name = "支付宝"
                if (!this.bankinfo.card) {
                    this.$toast("请输入支付宝账号");
                    return;
                }
                Fetch("/user/bank/apply", {
                    ...this.bankinfo
                }).then(() => {
                    this.$toast({
                        background: '#07c160',
                        message: '更新成功'
                    });
                }).then(() => {
                    this.$router.replace('/user');
                })
            },
        }
    };
</script>

<style lang="less" scoped>
    .bank_wrap {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        overflow-x: hidden;
        overflow-y: auto;
        background: #f5f5f5;
    }

    .bank_wrap .warming {
        font-size: 13px;
        color: #333;
        line-height: 1.7;
        padding: 8px 2%;
        text-align: center;
    }

    .bank_wrap .form {
        display: block;
        width: 100%;
        margin: 0 auto;
    }

    .bank_wrap .form .item {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        width: 100%;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        margin-bottom: 1px;
        background: #fff;
        height: 46px;
        padding: 10px;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
    }

    .bank_wrap .form .item .info {
        color: #333;
        display: inline;
        font-size: 13px;
    }

    .bank_wrap .form .item .inp {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        font-size: 13px;
        height: 46px;
        padding: 0 8px;
        text-align: right;
    }

    .bank_wrap .form .item .select {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        color: #333;
        text-align: right;
        font-size: 13px;
        padding-right: 20px;
        background-image: url(../images/withdraw/down.svg);
        background-size: 16px 16px;
        background-position: right center;
        background-repeat: no-repeat;
        direction: rtl;
    }

    .bank_wrap .form .sbtn {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        width: 90%;
        height: 42px;
        color: #fff;
        font-size: 14px;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
        border-radius: 5px;
        background: #fb661e;
        margin: 20px auto;
    }
</style>
