<template>
    <div class="basic_wrap">
        <bsHeader title="商品秒杀"></bsHeader>
        <div class="top_timer">
            <div class="list" :class="[cut == idx? 'cut':'',idx == 0 ? 'now':'']" v-for="item,idx in data" @click="cutCount(item.id,idx)">
                <p v-html="idx == 0?'当前场':dateHour(item.stime)"></p>
                <div class="status" v-html="idx == 0 && data[0].status == 2?'抢购中':'即将开始'" :class="idx == 0?'begin':''"></div>
            </div>
        </div>
        <div class="kill_wrap" v-if="cut == 0 && showCount">
            <p class="count_tip" v-if="stimeCountTime>0"><span class="advance"></span>距离本场开始</p>
            <p class="count_tip" v-else><span class="advance"></span>距离本场结束</p>
            <div class="count_time">
                <div class="count con1">{{timer.hr}}</div>
                <span>:</span>
                <div class="count con2">{{timer.min}}</div>
                <span>:</span>
                <div class="count con3">{{timer.sec}}</div>
            </div>
        </div>
        <div class="shop_list" :class="cut == 0 && status == 2 ? '' : 'not_start'">
            <van-list v-model="loading" :finished="finished" @load="onLoad" v-if="vanShow">
                <div class="item" v-for="(i,idx) in backList" :class="i.sale_status == 'N'?'notouch':''" :key="i.id" :title="i.id">
                    <img :src="i.thumb" @click="$router.push('/details/'+i.item_id)" alt="">
                    <div class="detail">
                        <p class="shop_name van-multi-ellipsis--l2" @click="$router.push('/details/'+i.item_id)">{{i.title}}</p>
                        <div class="ms_icon"></div>
                        <div class="price numberFont" v-html="'<span>¥</span>'+$parent.bigNumeber(i.price)"></div>
                        <div class="old_price">¥{{i.original_price}}</div>
                        <div class="buy_btn" @click="$router.push('/details/'+i.item_id)" v-if="i.sale_status == 'N'">已售罄</div>
                        <div class="buy_btn" @click="$router.push('/details/'+i.item_id)" v-else>去抢购</div>
                        <div class="sold">已售{{ i.sale_num == 0 ? '0' : parseFloat(i.sale_num / i.num * 100).toFixed(2)}}%</div>
                        <div class="progress">
                            <div class="switch" :style="{width: i.sale_num == 0 ? '0%' : parseFloat(i.sale_num / i.num * 100).toFixed(2)+'%'}"></div>
                        </div>
                    </div>
                </div>
            </van-list>
        </div>
    </div>
</template>

<script>
    import Vue from "vue";
    import { List } from "vant";
    import Fetch from '../../utils/fetch';
    import bsHeader from '../../components/bsHeader.vue'

    export default {
        name: "item",
        data() {
            return {
                data: {},
                vanShow: false,
                status: 0,
                cut: 0,
                shop_list: {},
                showCount: true,
                countTime: 0,
                stimeCountTime: 0,
                timer: {
                    hr: '',
                    min: '',
                    sec: ''
                },
                id: "",
                loading: false,
                finished: false,
                page_curren: 1,
                backList: [],
                countLength: 0,
            }
        },
        components: {
            bsHeader
        },
        created() {
            this.$parent.footer('index', false);
        },
        mounted() {
            Fetch('/index/index/seckill', {}, {
                method: 'get'
            }).then(r => {
                this.data = r.data;
                this.status = r.data[0].status;
                this.id = r.data[0].id;
                this.lookShop(r.data[0].id);
                this.countTime = r.data[0].rest_second;
                this.stimeCountTime = r.data[0].stime_second;
                this.countdown();
                this.vanShow = true;
                Vue.use(List);
            })

        },
        methods: {
            onLoad() {
                this.page_curren++;
                this.lookShop(this.id);

                // 加载状态结束
                this.loading = false;

                // 数据全部加载完成
                if (this.backList.length >= this.countLength.totalCount) {
                    this.finished = true;
                }
            },
            countdown: function() {
                var msec;
                if (this.stimeCountTime) {
                    msec = this.stimeCountTime
                } else {
                    msec = this.countTime;
                }
                if (msec >= 0 && msec <= 360000) {
                    let hr = parseInt(msec / 60 / 60)
                    let min = parseInt(msec / 60 % 60)
                    let sec = parseInt(msec % 60)
                    this.timer.hr = hr > 9 ? hr : '0' + hr
                    this.timer.min = min > 9 ? min : '0' + min
                    this.timer.sec = sec > 9 ? sec : '0' + sec

                    if (this.stimeCountTime) {
                        this.stimeCountTime -= 1;
                    } else {
                        this.countTime -= 1;
                    }
                    const that = this
                    var timer = setTimeout(function() {
                        that.countdown()
                    }, 1000)
                } else if (msec > 360000) {
                    this.showCount = false;
                } else {
                    this.$router.go(0);
                    return;
                }

            },
            lookShop(id) {
                Fetch('/index/index/seckillItemList', {
                    id: id,
                    page: this.page_curren,
                }, {
                    method: 'get'
                }).then(r => {
                    this.countLength = r.data;
                    r.data.list.forEach((item) => {
                        this.backList.push(item);
                    });
                })
            },
            dateHour(str) {
                return str.slice(11, 16)
            },
            cutCount(id, type) {
                this.finished = false;
                this.backList = [];
                this.id = id;
                this.page_curren = 1;
                this.cut = type;
                this.lookShop(id);
            }
        },
    }
</script>

<style lang="less" scoped>
    .red_top_bg{
        position: fixed;
        top: 0;
        z-index: 15;
    }
    .notouch{
        pointer-events: none;
        .buy_btn{
            background-color: #E8E8E8 !important;
            color: #9D9D9D !important;
        }
    }
    .kill_wrap {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        margin-top: 10px;
        padding: 0 11px;
    }

    .active_time {
        height: 21px;
        line-height: 21px;
        padding: 0 5px;
        color: #FF1300;
        font-size: 12px;
        font-weight: 400;
        border-radius: 11px;
        border: 1px solid rgba(241, 34, 17, 1);
        background-color: #FEEEEC;
        margin-left: 5px;
    }

    .count_tip {
        height: 18px;
        font-size: 12px;
        color: rgba(86, 85, 91, 1);
        line-height: 18px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }

    .count_time {
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        text-align: center;
        margin-left: 8px;

        .count {
            width: 20px;
            height: 18px;
            line-height: 18px;
            background: rgba(65, 64, 70, 1);
            border-radius: 3px;
            color: #FFFFFF;
        }

        span {
            width: 6px;
            height: 18px;
            line-height: 18px;
            color: #414046;
        }
    }

    .top_timer .list.begin .status {
        background: linear-gradient(90deg, rgba(252, 9, 78, 1) 0%, rgba(249, 74, 6, 1) 100%);
        border-radius: 9px;
        color: #fff;
    }

    .top_timer {
        width: 375px;
        height: 53px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 0px 0px 6px 6px;
        display: flex;
        padding-top: 4px;
        margin-top: 44px;
        justify-content: space-around;

        .list.cut {
            .status {
                background: linear-gradient(90deg, rgba(252, 9, 78, 1) 0%, rgba(249, 74, 6, 1) 100%);
                color: #FFFFFF;
                border-radius: 9px;
            }
        }

        .list.cut.now .status {
            color: #FFFFFF;
        }

        .list.now {

            p {
                color: #f12211;
            }

            .status {
                height: 18px;
                color: #f12211;
                width: 100%;
                margin-left: 0;
            }
        }

        .list {
            width: 50px;
            text-align: center;
            white-space: nowrap;

            p {
                width: 100%;
                font-size: 16px;
                line-height: 19px;
                font-weight: bold;
            }

            .status {
                width: 120%;
                margin-left: -10%;
                font-size: 12px;
                line-height: 18px;
                color: rgba(0,0,0,.6);
                margin-top: 4px;
            }
        }
    }
    .not_start .item{
        pointer-events: none;
    }
    .shop_list.not_start {
        .item {
            .detail {
                .buy_btn {
                    background-color: #E8E8E8;
                    color: #9D9D9D;
                    pointer-events: none;
                }

                .progress {
                    background: rgba(120, 120, 120, 0.1);
                    border: 1px solid rgba(184, 184, 184, 0.38);

                    .switch {
                        width: 0;
                    }
                }
            }
        }
    }

    .shop_list {
        margin-top: 8px;
        padding: 0 10px;

        .item {
            width: 100%;
            height: 129px;
            background: rgba(255, 255, 255, 1);
            box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
            border-radius: 9px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: flex-start;

            img {
                width: 95px;
                height: 91px;
                margin-left: 13px;
            }

            .detail {
                flex: 1;
                height: 100%;
                margin-left: 8px;
                position: relative;

                .shop_name {
                    height: 40px;
                    font-size: 14px;
                    font-weight: 400;
                    color: #000000;
                    line-height: 20px;
                    position: absolute;
                    top: 5px;
                    left: 6px;
                }

                .price {
                    position: absolute;
                    height: 24px;
                    font-size: 13px;
                    line-height: 24px;
                    top: 87px;
                    left: 0;
                    color: #F03041;
                    font-weight: bold;

                    span {
                        font-size: 17px;
                    }
                }

                .old_price {
                    height: 14px;
                    font-size: 12px;
                    color: rgba(179, 179, 179, 1);
                    line-height: 17px;
                    position: absolute;
                    top: 108px;
                    left: 0;
                }

                .buy_btn {
                    width: 77px;
                    height: 28px;
                    background: rgba(240, 43, 46, 1);
                    border-radius: 3px;
                    font-size: 14px;
                    color: #FFFFFF;
                    position: absolute;
                    top: 79px;
                    right: 9px;
                    text-align: center;
                    line-height: 28px;
                }

                .sold {
                    height: 14px;
                    font-size: 12px;
                    color: rgba(0, 0, 0, 0.4);
                    line-height: 14px;
                    transform: scale(0.85);
                    position: absolute;
                    top: 108px;
                    left: 78px;
                }

                .progress {
                    width: 77px;
                    height: 6px;
                    border: 1px solid rgba(240, 48, 65, 0.38);
                    background-color: rgba(240, 48, 65, 0.1);
                    position: absolute;
                    border-radius: 3px;
                    top: 112px;
                    right: 9px;

                    .switch {
                        width: 0%;
                        max-width: 100%;
                        background: #F88B8D;
                        border-radius: 3px 0 0 3px;
                        position: absolute;
                        top: 0px;
                        left: 0px;
                        height: 4px;
                    }
                }
            }
        }
    }

    .ms_icon {
        width: 31px;
        height: 16px;
        background: url(../images/index/ms.png) no-repeat center center;
        background-size: 100% 100%;
        margin-right: 2px;
        position: absolute;
        top: 70px;
        left: 0;
    }
</style>
