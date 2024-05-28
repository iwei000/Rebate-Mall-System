<template>
    <div class="bankrecharge_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.push('/user')"></div>
            <div class="big_tit">账户充值</div>
        </div>
        <div class="bank_detail">
            <div class="item">
                <p class="info">户名：{{ data.bank_user }}</p>
                <div
                    class="copy_btn"
                    v-clipboard="() => data.bank_user"
                    v-clipboard:success="copy"
                >
                    复制
                </div>
            </div>
            <div class="item">
                <p class="info">银行卡号：{{ data.bank_card }}</p>
                <div
                    class="copy_btn"
                    v-clipboard="() => data.bank_card"
                    v-clipboard:success="copy"
                >
                    复制
                </div>
            </div>
            <div class="item">
                <p class="info">银行：{{ data.bank_name }}</p>
                <div
                    class="copy_btn"
                    v-clipboard="() => data.bank_name"
                    v-clipboard:success="copy"
                >
                    复制
                </div>
            </div>
			<div class="item">
				<p class="info">付款人：<input type="text" v-model.trim="pay_user" placeholder="请输入付款人"></p>
			</div>
			<div class="item">
				<p class="info">附言：<input type="text" v-model.trim="pay_remark" placeholder="请输入充值附言"></p>
			</div>
        </div>
        <div class="warming" >
            <p class="tit">充值说明：</p>
            <div class="content">{{ data.bank_remark }}</div>
        </div>
        <div class="basic_btn" @click="submitBtn">完成</div>
    </div>
</template>

<script>
import Vue from "vue";
import { Button } from "vant";
import Fetch from "../../utils/fetch";
import Clipboard from "v-clipboard";

Vue.use(Button).use(Clipboard);

export default {
    name: "bankpay",
    data() {
        return {
            data: {},
			pay_user: '',
			pay_remark: '',
            money: 0,
        };
    },
    created() {
        this.$parent.footer("user", false);
    },
    mounted() {
        this.money = this.$route.query.money ? this.$route.query.money : "";
        this.start();
    },
    methods: {
        copy() {
            this.$toast({
                background: "#07c160",
                message: "复制成功",
            });
        },
        start() {
            Fetch("/user/recharge_type", {
                money: this.$route.query.money ? this.$route.query.money : "",
                type: this.$route.query.type,
            }).then((r) => {
                this.data = r.data;
            });
        },
        submitBtn() {
            Fetch("/user/bank_apply", {
				money: this.$route.query.money ? this.$route.query.money : "",
				remark: this.pay_remark,
				name: this.pay_user,
				rid: this.data.rid
            }).then((r) => {
                if (r.code == 1) {
                    this.$toast({
                        background: "#07c160",
                        message: "充值申请提交成功",
                    });
                    this.$router.replace("/moneybag");
                }
            });
        },
    },
};
</script>

<style lang="less" scoped>
.bank_detail {
    width: 375px;
    // height: 154px;
    background: rgba(255, 255, 255, 1);
    box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
    border-radius: 6px;
    margin-top: 12px;
    padding: 0 16px;
    font-size: 14px;
    .item {
        height: 52px;
        border-bottom: 1px solid #ececec;
        line-height: 52px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        .info {
            font-weight: bold;
            color: #000;
        }
        .copy_btn {
            color: #3d96ff;
            font-size: 12px;
        }
    }
}
.warming {
    margin-top: 17px;
    padding: 0 14px;

    .tit {
        font-size: 14px;
        color: rgba(0,0,0,.8);
        line-height: 20px;
        font-weight: bold;
    }

    .content {
        font-size: 12px;
        color: rgba(0,0,0,.6);
        line-height: 17px;
        margin-top: 9px;
    }
}

.basic_btn {
    margin: 30px auto 0 auto;
}
</style>
