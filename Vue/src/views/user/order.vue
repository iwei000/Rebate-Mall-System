<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.replace('/user')"></div>
            <div class="big_tit">我的订单</div>
            <div class="money_box">
                <div class="item">
                    <p
                        class="money_num"
                        v-html="`<span>¥</span>${wan(data.on_money)}`"
                    ></p>
                    <p class="info">待收本金</p>
                </div>
                <div class="item">
                    <p
                        class="money_num"
                        v-html="`<span>¥</span>${wan(data.on_apr_money)}`"
                    ></p>
                    <p class="info">待收佣金</p>
                </div>
                <div class="item">
                    <p
                        class="money_num"
                        v-html="`<span>¥</span>${wan(data.ok_apr_money)}`"
                    ></p>
                    <p class="info">累计收益</p>
                </div>
            </div>
        </div>
        <h3 class="notes_tit">订单记录</h3>
        <van-empty description="暂无订单记录" v-if="empty" />
        <div class="scrollBox">
            <div class="notes_box" v-if="!empty" v-for="i in data.list">
                <p class="timer">
                    {{ i.time }} <i @click="lookHT(i.id)">我的合同</i>
                </p>
                <div class="items" @click="$router.push('/order/' + i.id)">
                    <p class="note_tit van-multi-ellipsis--l2">
                        {{ i.title }}
                    </p>
                    <div class="note_price">¥{{ (i.money - i.discount).toFixed(2) }}</div>
                    <div :class="i.time2 == '' ? 'limit' : 'gray_btn'">
                        {{ i.time2==''?'未完成':'已完成' }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Vue from "vue";
import { Empty } from "vant";

import Fetch from "../../utils/fetch";
Vue.use(Empty);

export default {
    name: "order",
    data() {
        return {
            data: {},
            empty: false,
        };
    },
    created() {
        this.$parent.footer("user", false);
    },
    mounted() {
        this.start();
    },
    methods: {
        start() {
            Fetch("/user/order").then((r) => {
                this.data = r.data;
                r.data.list.length == 0
                    ? (this.empty = true)
                    : (this.empty = false);
            });
        },
        wan(str) {
            var num = parseFloat(str);
            if (num > 99999) {
                return `${(num / 10000).toFixed(2)}万`;
            } else {
                return str || 0;
            }
        },
        lookHT(id) {
            this.$router.push("/contract/" + id);
        },
    },
};
</script>

<style lang="less" scoped>
.red_top_bg {
    height: 156px;
    background: url(../images/user/order.png) no-repeat center center;
    background-size: 100% 100%;
    position: fixed;
    z-index: 15;
}

.money_box {
    margin-top: 29px;
    display: flex;
    padding: 0 6px;
    justify-content: space-around;
    color: #ffffff;

    .item {
        width: 86px;
        text-align: center;
        font-weight: bold;

        .money_num {
            font-size: 18px;
            line-height: 25px;
            white-space: normal;
            word-break: normal;
            text-align: center;
        }

        .info {
            font-size: 14px;
            line-height: 20px;
            margin-top: 5px;
        }
    }
}

.notes_tit {
    width: 100%;
    line-height: 44px;
    height: 44px;
    font-size: 14px;
    color: #000000;
    padding: 0 14px;
    position: fixed;
    top: 156px;
    left: 50%;
    transform: translateX(-50%);
    background: #FAFAFA;
    z-index: 2;
}

.notes_box {
    width: 375px;
    padding-bottom: 2px;
    background: rgba(255, 255, 255, 1);
    box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
    border-radius: 6px;
    margin-bottom: 10px;

    .timer {
        padding: 0 14px;
        line-height: 38px;
        font-size: 12px;
        color: rgba(0,0,0,.6);
        border: 1px solid #ececec;
        margin-bottom: 16px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        i {
            line-height: 37px;
            font-style: normal;
            height: 37px;
        }
    }

    .items {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        margin-bottom: 20px;
        padding: 0 14px;

        .note_tit {
            font-size: 12px;
            color: rgba(0,0,0,.6);
            width: 200px;
            line-height: 17px;
        }

        .note_price {
            font-size: 14px;
            line-height: 18px;
            color: rgba(0,0,0,.8);
            margin-left: 17px;
        }

        .limit,
        .gray_btn {
            margin-left: auto;
        }
    }
}
.scrollBox{
    margin-top: 210px;
}
</style>
