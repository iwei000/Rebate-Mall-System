<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.back()"></div>
            <div class="big_tit">订单详情</div>
        </div>
        <div class="order_tit" v-html="data.invest.status == 0?'进行中':'已返佣'"></div>
        <div class="item_wrap">
            <div class="top_detail">
                <div class="item_img">
                    <img :src="data.invest.img" alt="">
                </div>
                <div class="detail_box">
                    <p class="item_name van-multi-ellipsis--l2">{{data.invest.title}}</p>
                    <p class="price">¥{{data.invest.min}}</span></p>
                    <span class="buy_num">* {{data.invest.money/data.invest.min}}</span>
                </div>
            </div>
            <div class="buy_details">
                <div class="del_type">总金额</div>
                <div class="del_money">￥{{data.invest.money}}</div>
            </div>
            <div class="buy_details" v-if="data.invest.discount > 0">
                <div class="del_tit">商品券</div>
                <div class="del_type">共使用 1 张商品券</div>
                <div class="del_money">- ￥{{(data.invest.discount-data.invest.special_price).toFixed(2)}}</div>
            </div>
            <div class="buy_details" v-if="data.invest.special_price > 0">
                <div class="del_tit" style="color: #f12211;" v-if="data.invest.is_special == 1">{{data.member.name}}尊享{{data.member.discount}}折</div>
                <div class="del_money">- ￥{{data.invest.special_price}}</div>
            </div>
            <div class="buy_details" v-if="data.invest.coupon > 0">
                <div class="del_tit">代金券</div>
                <div class="del_type">共使用 1 张代金券</div>
                <div class="del_money">- ￥{{data.invest.coupon}}</div>
            </div>

            <div class="actual_delivery">实付金额：￥{{(data.invest.money-data.invest.discount-data.invest.coupon).toFixed(2)}}</div>

            <div class="hairline"></div>


            <div class="income_msg">
                <div class="tit">核算本金</div>
                <div class="info">￥{{(data.invest.money-data.invest.discount).toFixed(2)}}</div>
            </div>
            <div class="income_msg">
                <div class="tit">订单利率</div>
                <div class="info">商品 {{data.invest.goods_rate}}% {{data.member.rate > 0?'+ 会员 '+data.member.rate+'%' :''}}</div>
            </div>
            <div class="income_msg">
                <div class="tit">订单时长</div>
                <div class="info">{{data.invest.day}}天</div>
            </div>
            <div class="income_msg">
                <div class="tit">订单金额</div>
                <div class="info">￥{{data.invest.money}}</div>
            </div>
            <div class="income_msg">
                <div class="tit">订单收益</div>
                <div class="info red">总收益￥{{(data.invest.money*data.invest.rate/100*data.invest.day).toFixed(2)}}</div>
            </div>
        </div>
        <div class="wrap_box">
            <p class="order_time">订单支付时间：{{data.invest.time}}</p>
            <p class="order_time">订单完成时间：{{data.invest.status == 0?'尚未完成':data.invest.time2}}</p>
        </div>

        <div class="income_history" v-if="backList.length != 0">
            <div class="income_tit">收益记录</div>
            <van-list v-model="loading" :finished="finished" @load="onLoad">
                <div class="item" v-for="(item,idx) in backList" :key="idx" :title="idx">
                    <div class="time">{{item.time1}}</div>
                    <div class="type" v-html="backList.length -1 == idx?'发放本佣':'发放佣金'"></div>
                    <div class="money" v-if="backList.length -1 == idx">￥{{parseFloat(item.pay1)-parseFloat(discount)}}</div>
					<div class="money" v-else>￥{{item.pay1}}</div>
                    <div class="money">{{ item.status=='0'?'待发放':'已发放' }}</div>
                </div>
            </van-list>
        </div>

    </div>
</template>

<script>
    import Fetch from '../../utils/fetch';
    import Vue from 'vue';
    import {
        List
    } from 'vant';

    Vue.use(List);

    export default {
        name: "orderinfo",
        data() {
            return {
                data: {
					invest: [],
					member: []
				},
                loading: false,
                finished: false,
                backList: [],
                page_curren: 1,
                page_num: 1000000,
                discount: 0,
            };
        },
        components: {

        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            this.start();
            this.details();
        },
        methods: {
            onLoad() {
                this.page_curren++;
                this.details();

                // 加载状态结束
                this.loading = false;

                // 数据全部加载完成
                if (this.backList.length < this.page_num) {
                    this.finished = true;
                }
            },
            start() {
                Fetch('/user/order_detail', {
                    id: this.$router.history.current.params.id,
                }).then((r) => {
                    this.data = r.data;
                });
            },
            details() {
                Fetch('/user/aprlist', {
                    cid: this.$router.history.current.params.id,
                    page_curren: this.page_curren,
                    page_num: this.page_num
                }).then(r => {
                    this.discount = r.data.discount;					
                    r.data.list.forEach(item => {
                        this.backList.push(item)
                    })

                })
            }
        }
    };
</script>

<style lang="less" scoped>
    .red_top_bg {
        position: fixed;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        z-index: 10;
    }

    .wrap_box {
        padding: 1px 0 10px 0;
    }

    .order_tit {
        width: 375px;
        height: 42px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 0px 0px 6px 6px;
        padding: 0 20px;
        font-size: 14px;
        color: #f12211;
        font-weight: bold;
        margin-top: 44px;
        line-height: 42px;
    }

    .item_wrap {
        width: 375px;
        padding: 16px 16px 20px 16px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        margin-bottom: 12px;
        margin-top: 12px;

        .top_detail {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-bottom: 22px;

            .item_img {
                margin-top: 6px;
                width: 80px;
                height: 80px;

                img {
                    width: 100%;
                    height: 100%;
                }
            }

            .detail_box {
                flex: 1;
                margin-left: 18px;
                display: flex;
                flex-direction: column;
                position: relative;

                .buy_num {
                    position: absolute;
                    font-size: 12px;
                    color: rgba(0,0,0,.8);
                    line-height: 14px;
                    right: 0;
                    bottom: 4px;
                }

                .item_name {
                    height: 40px;
                    font-size: 14px;
                    font-weight: 500;
                    color: rgba(0,0,0,.8);
                    line-height: 20px;
                    margin-top: -6px;
                }

                .price {
                    height: 21px;
                    font-size: 15px;
                    font-weight: 600;
                    color: #f12211;
                    line-height: 21px;
                    margin-top: 16px;

                    span {
                        font-size: 12px;
                        line-height: 14px;
                        color: #B3B3B3;
                        font-weight: normal;
                        margin-left: 3px;
                        text-decoration: line-through;
                    }
                }
            }
        }

        .cut_num {
            flex: 1;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-right: 5px;

            input {
                width: 39px;
                height: 21px;
                background: rgba(242, 242, 242, 1);
                font-size: 12px;
                color: rgba(0, 0, 0, 0.8);
                text-align: center;
                margin: 0 7px;
            }

            .cut {
                width: 11px;
                height: 21px;
                line-height: 21px;
                font-size: 20px;
                color: #757880;
                text-align: center;
            }
        }

        .buy_details {
            width: 100%;
            height: 14px;
            line-height: 14px;
            font-size: 12px;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-bottom: 20px;

            .del_tit {
                flex: 1;
                font-weight: bold;
            }

            .del_type {
                width: 177px;
            }

            .del_money {
                width: 79px;
                text-align: right;
                color: #f12211;
                margin-left: auto;
            }

            .look_more_tick {
                width: 14px;
                height: 14px;
                background: url(../images/item/more.png) no-repeat center center;
                background-size: 100% 100%;
                margin-left: 4px;
            }
        }

        .income_msg {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 14px;
            line-height: 14px;
            margin-top: 16px;
            font-size: 12px;
            font-weight: bold;

            .red {
                color: #f12211;
            }
        }
    }

    .hairline {
        border-bottom: 1px solid #ECECEC;
    }

    .actual_delivery {
        height: 14px;
        font-size: 12px;
        font-weight: 600;
        color: rgba(0,0,0,.8);
        text-align: right;
        line-height: 17px;
        margin-bottom: 17px;
    }

    .income_history {
        width: 375px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        padding: 0 16px 18px 16px;
        margin-top: 12px;

        .income_tit {
            height: 50px;
            line-height: 50px;
            border-bottom: 1px solid #ECECEC;
            font-size: 14px;
            font-weight: bold;
            color: #000000;
        }

        .item {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            font-size: 12px;
            color: rgba(0,0,0,.8);
            font-weight: 500;
            height: 14px;
            line-height: 14px;
            margin-top: 18px;

            .time {
                width: 135px;
            }

            .money {
                margin-left: auto;
            }
        }
    }

    .order_time {
        font-size: 12px;
        color: rgba(0,0,0,.6);
        padding: 0 16px;
        margin-top: 14px;
    }
</style>
