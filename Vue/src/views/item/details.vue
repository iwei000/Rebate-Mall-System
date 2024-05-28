<template>
    <div class="basic_wrap">
        <div class="detail_img">
            <div class="back_left" @click="$router.back()"></div>
            <!-- <div class="video_box" v-show='false'>
                <div class="video_icon"></div>
                <img src="../images/index/test2.png" alt="">
			</div> -->
            <div class="loop_box">
                <img :src="data.img" alt="">
            </div>
            <!-- <div class="cut_box">
                <div class="video_btn cur"></div>
                <div class="pic_btn"></div>
			</div> -->
            <!-- <div class="loop_num">1/5</div> -->
        </div>
        <div class="vip_price" v-if="data.is_special == 1">
            <div class="vip_num">¥{{data.special_price-data.discount}}</div>
            <div class="vip_discount">{{data.vip_name}}级别下单已享{{data.user_vip_rebate}}折</div>
        </div>
        <!-- <div class="kill_slae" v-if="data.price_type == 1">
            <div class="now_price">¥<span>{{data.special_price}}</span></div>
            <div class="old_price">¥{{data.min}}</div>
        </div> -->
        <div class="item_detail">
            <h2 class="shop_name">{{data.title}}</h2>
            <div class="shop_price">
                <div class="new_icon" v-if="data.num == 1"></div>
                <div class="now_price" v-if="data.is_special">¥<span>{{$parent.numFilter(data.special_price-data.discount)}}</span></div>
                <div class="now_price" v-else>¥<span>{{$parent.numFilter(data.min-data.discount)}}</span></div>
                <div class="old_price" v-if="data.discount != 0">¥{{data.min}}</div>
                <span class="fxmoney">每日返现: {{data.apr_money}}元</span>
            </div>
            <div class="s_num discount_num" v-if="data.discount != 0">
                <div class="sale_num">已自动领劵： {{data.discount}}元</div>
            </div>
            <div class="s_num">
                <div class="sale_num" v-if="data.num_status == 'Y'">剩余库存：{{data.stock}}</div>
                <div class="sale_num" v-else>销量：{{parseInt(data.sales_base)}}</div>
                <div class="limit" v-if="data.num == '1'">限购：每人1单</div>
            </div>
        </div>
        <div class="active_box" v-if="data.activity && data.activity.status == 2">
            <div class="active_tit">活动</div>
            <div class="active_type">
                <div class="item_type">
                    <count :status="data.activity.status" :show_seckill="true" :second="data.activity.rest_second">后结束</count>
                </div>
            </div>
        </div>
        <div class="active_box" v-else-if="data.activity && data.activity.status == 1">
            <div class="active_tit">活动</div>
            <div class="active_type">
                <div class="item_type">
                    <count :status="data.activity.status" :show_seckill="true" :second="data.activity.stime_second">后开始</count>
                </div>
            </div>
        </div>
        <div class="invest_box">
            <h3 class="invest_tit">订单参数</h3>
            <div class="invest_item align_50 text_right origin_font">
                <div class="describe">返现佣金</div>
                <div class="invest_content">{{(data.apr_money*data.day).toFixed(2)}}元</div>
            </div>
            <div class="invest_item text_right origin_font">
                <div class="describe">百分比</div>
                <div class="invest_content" v-if="data.user_apr > 0">商品:{{data.rate}}% + 会员:{{data.user_apr}}%</div>
                <div class="invest_content" v-else>商品:{{data.rate}}%</div>
            </div>
            <div class="invest_item text_right origin_font">
                <div class="describe">期限</div>
                <div class="invest_content">
                    <div class="info"><span class="red">{{data.day}}天</span></div>
                </div>
            </div>
            <div class="invest_item origin_font">
                <div class="describe">计算方式</div>
                <div class="invest_content">
                    <div class="info">
                        比如：下单成功
                        <span class="red">{{data.min}}元/{{data.day}}天的商品 = 返现{{$parent.numFilter(data.apr_money*data.day)}}元
                            + 实际支付{{data.special_price ? parseFloat(data.special_price) - parseFloat(data.discount) : parseFloat(data.min) - parseFloat(data.discount)}}元
                            = 总计{{data.sum_money}}元</span>
                    </div>
                </div>
            </div>
            <div class="invest_item origin_font">
                <div class="describe">发放方式</div>
                <div class="invest_content">{{data.type_name}}（节假日不受影响）</div>
            </div>
            <div class="invest_item origin_font">
                <div class="describe">结算时间</div>
                <div class="invest_content">当天下单，满1天自动结算（例如在今天 11:00成功下单，则在明天 11:00结算），到期系统自动将当日返现金额和实际支付金额返还到会员账户中</div>
            </div>
            <div class="invest_item">
                <div class="describe">单数限制</div>
                <div class="invest_content" v-if="data.num <= 1">每人限购一单</div>
                <div class="invest_content" v-else>不限购</div>
            </div>
            <div class="invest_item">
                <div class="describe">资金用途</div>
                <div class="invest_content">用于平台系统自动下单操作</div>
            </div>
            <div class="invest_item">
                <div class="describe">安全保障</div>
                <div class="invest_content">平台为每一笔订单购买保险，生成电子合同书，保险公司提供100%全额保障</div>
            </div>
            <div class="invest_item">
                <div class="describe">平台概述</div>
                <div class="invest_content">我们是基于云计算技术搭建的聚合购物返现平台，解决了传统优惠券平台流程繁琐，账户繁多的痛点，为广大会员提供一站式服务。我们只对商家收费，会员完全免费，同时为会员争取最大返现额度。商家通过平台提高了销量，降低了获客成本，会员通过平台获得了返现，平台也由此发展壮大，共赢的模式受到大家的一致好评，感谢您的参与</div>
            </div>
        </div>
        <div class="item_sk" v-if="data.status == 'N'">该商品已下架</div>
        <div class="buy_box">
            <div class="custom" @click="$router.push('/kefu')">
                <i></i>
                <span>咨询客服</span>
            </div>
            <div class="cart_go" @click="$router.push('/cart')">
                <i><span v-if="catNum != 0">{{catNum < 10 ? catNum : 9}}</span></i>
                <span>购物车</span>
            </div>
			<div class="add_cart" v-if="data.num > 1&&data.is_sale" :class="data.status == '0'? 'notouch':''" @click="show_shop('cart')"></div>
			<div class="buy_btn" :class="[data.num == 1?'newPoeple':'',data.status == '0'? 'notouch':'']" @click="show_shop('buy')" v-html="data.num == 1?'立即购买':''" v-if="data.is_sale"></div>
			<div class="sale_time" v-if="data.is_sale == 0">
				待开售 <van-count-down :time="data.down_time" @finish="finish"/>
			</div>
            
        </div>
        <!-- 选择数量 -->
        <van-popup v-model="choose_num" closeable close-icon="close" round position="bottom">
            <div class="item_box">
                <div class="item_top">
                    <img :src="data.img" alt="">
                    <div class="item_price">
                        <div class="active_status" v-if="data.activity && data.activity.status == 2">秒杀</div>
                        <div class="price_show">
                            <!-- <div class="now_price" v-if="data.price_type != 0">¥{{data.special_price}}</div>
                            <div class="now_price" v-if="data.price_type == 0">¥{{data.money}}</div>
                            <div class="old_price" v-if="data.price_type != 0">¥{{data.money}}</div> -->
							
							<div class="now_price" v-if="data.is_special">¥<span>{{data.special_price-data.discount}}</span></div>
							<div class="now_price" v-else>¥<span>{{data.min-data.discount}}</span></div>
							<div class="old_price" v-if="data.discount != 0">¥{{data.min}}</div>
							
                        </div>
                        <p class="stock">库存：{{data.stock}}</p>
                    </div>
                </div>
                <div class="item_cut_num">
                    <p class="buy_num" v-if="data.num == '1'">购买数量(每人1单)</p>
                    <p class="buy_num" v-else>购买数量</p>
                    <div class="cut_num">
                        <div class="cut cut_del" @click="del()">-</div>
                        <input type="number" @input="inpChange()" v-model="buyNum">
                        <div class="cut cut_add" @click="add()">+</div>
                    </div>
                </div>
                <div class="define" @click="buyShop">确定</div>
            </div>
        </van-popup>
    </div>
</template>

<script>
    import Vue from 'vue';
    import count from '../../components/count.vue';
    import Fetch from '../../utils/fetch';
    import {Popup,CountDown} from 'vant'

    Vue.use(Popup).use(CountDown)

    export default {
        name: "login",
        data() {
            return {
                data: {},
                user: {},
                rands: [],
                password: '',
                isBuy: false,
                buyNum: 1,
                catNum: 0,
                is_show_countdown: 'N',
                end_time: '',
                // day:'',
                hr: '',
                min: '',
                sec: '',
                choose_num: false
            };
        },
        created() {
            this.$parent.footer('item', false);
        },
        components: {
            count
        },
        mounted() {
            this.start();
        },
        watch: {
            $route(to, from) {
                this.$router.go(0);
            }
        },
        methods: {
            start() {
                Fetch('/index/item_view', {
                    id: this.$router.history.current.params.id
                }).then((r) => {
                    this.data = r.data.view;
                    this.user = r.data.user;
                    this.rands = r.data.rands;
                });
                this.catNumHandle();
            },
			finish() {
			  this.start();
			},
            catNumHandle() {
                Fetch('/user/cart', {}, {
                    method: 'get'
                }).then((r) => {
                    this.catNum = r.data.list.length;
                });
            },
            show_shop(str) {
                if (str == 'cart') {
                    this.isBuy = false;
                } else {
                    this.isBuy = true;
                }
                this.choose_num = true;
            },
            buyShop() {
                if(this.data.stock == 0){
                    this.$toast('库存不足');
                    return;
                }
                if (this.isBuy) {
                    var items = [];
                    items.push({
                        item_id: this.data.id,
                        num: this.buyNum,
                    })
                    localStorage.setItem('cart', JSON.stringify(items));
                    this.$router.push('/confirm');
                } else {
                    // 加购
                    Fetch('/user/cart_add', {
                        item_id: this.data.id,
                        num: this.buyNum
                    }).then(r => {
                        this.start();
                        this.choose_num = false;
                    })
                }
            },
            add() {
                if (this.data.num == 1) {
                    this.buyNum = 1;
                    return;
                }
                if(this.data.num > 1){
                    if(this.buyNum >= this.data.num){
                        this.buyNum = this.data.num;
                        return;
                    }
                }
                if (this.buyNum >= this.data.stock) {
                    return
                }
                this.buyNum++;
            },
            inpChange() {
                if (this.data.num == 1) {
                    this.buyNum = 1;
                    return;
                }
                if(this.data.num > 1){
                    if(this.buyNum >= this.data.num){
                        this.buyNum = this.data.num;
                        return;
                    }
                }
                if (this.buyNum >= this.data.stock) {
                    this.buyNum = this.data.stock
                }
                if (this.buyNum <= 1) {
                    this.buyNum = 1
                }
            },
            del() {
                if (this.buyNum <= 1) {
                    return
                }
                this.buyNum--;
            },
            
        }
    };
</script>

<style lang="less" scoped>
    /deep/ .active_type {
        margin: 0;
    }
    .notouch{
        pointer-events: none;
    }
    .item_sk{
        width: 10rem;
        height: 35px;
        line-height: 35px;
        background: #FDFADB;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #C9793F;
        font-size: 12px;
        position: fixed;
        z-index: 10;
        left: 50%;
        bottom: 52px;
        transform: translateX(-50%);
    }
    .buy_box .buy_btn.newPoeple {
        margin-left: auto;
        width: 150px;
        background: #FFB700;
        color: #FFFFFF;
        line-height: 35px;
        font-size: 14px;
        text-align: center;
        border-radius: 18px;
    }

    .new_icon {
        width: 55px;
        height: 19px;
        background: url(../images/index/news.png) no-repeat center center;
        background-size: 100% 100%;
        margin-right: 8px;
    }

    .detail_img {
        width: 375px;
        height: 375px;
        position: relative;

        .back_left {
            width: 30px;
            height: 30px;
            position: absolute;
            top: 25px;
            left: 5px;
            background: url(../images/detail/back.png) no-repeat center center;
            background-size: 100% 100%;
            z-index: 5;
        }

        .video_box,
        .loop_box {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;

            img,
            video {
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                z-index: 1;
            }

            .video_icon {
                width: 61px;
                height: 61px;
                position: absolute;
                top: 50%;
                left: 50%;
                margin-top: -30px;
                margin-left: -30px;
                background: url(../images/detail/play.png) no-repeat center center;
                background-size: 100% 100%;
                z-index: 2;

                &.play {
                    background: url(../images/detail/sus.png) no-repeat center center;
                    background-size: 100% 100%;
                }
            }
        }

        .cut_box {
            width: 100%;
            position: absolute;
            height: 20px;
            left: 0;
            bottom: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 4;

            .video_btn {
                width: 48px;
                height: 100%;
                background: url(../images/detail/video.png) no-repeat center center;
                background-size: 100% 100%;
                margin: 0 6px;

                &.cur {
                    background: url(../images/detail/video_cur.png) no-repeat center center;
                    background-size: 100% 100%;
                }
            }

            .pic_btn {
                width: 48px;
                height: 100%;
                background: url(../images/detail/pic.png) no-repeat center center;
                background-size: 100% 100%;
                margin: 0 6px;

                &.cur {
                    background: url(../images/detail/pic_cur.png) no-repeat center center;
                    background-size: 100% 100%;
                }
            }
        }

        .loop_num {
            position: absolute;
            bottom: 10px;
            right: 16px;
            z-index: 5;
            height: 20px;
            display: flex;
            align-items: center;
            background: rgba(0, 0, 0, 0.3);
            font-size: 12px;
            text-align: center;
            color: #FFFFFF;
            border-radius: 10px;
            padding: 0 9px;
        }
    }

    .kill_slae {
        width: 100%;
        height: 46px;
        background: url(../images/detail/ms.png) no-repeat center center;
        background-size: 100% 100%;
        position: relative;

        .now_price {
            position: absolute;
            font-size: 14px;
            color: #FB2004;
            height: 30px;
            line-height: 30px;
            top: 13px;
            left: 107px;
            font-weight: 600;

            span {
                font-size: 28px;
            }
        }

        .old_price {
            position: absolute;
            font-size: 14px;
            color: #FFFFFF;
            height: 16px;
            line-height: 16px;
            top: 26px;
            left: 262px;
            text-decoration: line-through;
        }
    }

    .item_detail {
        width: 100%;
        padding: 16px 16px 20px 16px;
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 0 0 6px 6px;
        background-color: #FFFFFF;

        .shop_name {
            font-size: 16px;
            font-weight: bold;
            color: rgba(0,0,0,.8);
            line-height: 22px;
        }

        .shop_price {
            height: 28px;
            margin-top: 12px;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            .fxmoney{
                font-size: 12px;
                color: #f12211;
                margin-left: 10px;
                margin-top: 10px;
			}
            .now_price {
                font-size: 14px;
                color: #FB2004;
                height: 28px;
                line-height: 28px;
                font-weight: 600;

                span {
                    font-size: 26px;
                }
            }

            .old_price {
                font-size: 14px;
                color: #B3B3B3;
                height: 16px;
                line-height: 16px;
                text-decoration: line-through;
                margin-left: 10px;
                margin-top: 7px;
            }
        }
        .s_num.discount_num .sale_num{
            color: #f12211;
            font-size: 14px;
            font-weight: bold;
        }
        .s_num {
            height: 20px;
            margin-top: 11px;
            display: flex;
            align-items: center;
            justify-content: space-between;

            .sale_num {
                height: 17px;
                line-height: 17px;
                font-size: 12px;
                color: rgba(0,0,0,.6);
            }
        }
    }

    .active_box {
        width: 100%;
        padding: 18px 16px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        margin-top: 12px;
        display: flex;
        justify-content: flex-start;

        .active_tit {
            width: 44px;
            font-weight: bold;
            color: rgba(0,0,0,.8);
            height: 16px;
            font-size: 14px;
            line-height: 16px;
        }

        .active_type {
            flex: 1;
            font-size: 12px;

            .item_type {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                margin-top: 13px;

                &:first-child {
                    margin-top: 0;
                }

                .type_name {
                    height: 16px;
                    line-height: 16px;
                    width: 50px;

                    .name_inner {
                        background: rgba(241, 34, 17, 0.08);
                        border-radius: 4px;
                        color: #f12211;
                        padding: 0 3px;
                        text-align: center;
                        float: left;
                    }
                }

                .sale_status {
                    color: rgba(0,0,0,.8);
                    line-height: 17px;
                    margin-left: 3px;
                }
            }
        }
    }

    .invest_box {
        width: 375px;
        margin-top: 12px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        padding: 20px 16px;
        line-height: 17px;
        font-size: 12px;
        color: rgba(0,0,0,.8);

        .invest_tit {
            height: 14px;
            font-size: 14px;
            font-weight: bold;
        }

        .invest_item {
            display: flex;
            justify-content: flex-start;
            margin-top: 12px;

            &.align_50 {
                .describe {
                    flex: 1.5;
                }

                .invest_content {
                    flex: 1;
                }
            }

            &.text_right {
                .invest_content {
                    text-align: right;
                }
            }

            &.origin_font {
                .invest_content {
                    color: #FB2004;
                }
            }

            .describe {
                width: 90px;
            }

            .invest_content {
                flex: 1;
                line-height: 17px;
            }
        }
    }

    .buy_box {
        width: 375px;
        height: 52px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.2);
        display: flex;
        align-items: center;
        position: fixed;
        z-index: 10;
        left: 50%;
        bottom: 0;
        padding: 0 12px;
        transform: translateX(-50%);

        .custom {
            margin-left: 20px;
        }

        .cart_go {
            margin-left: 30px;
            position: relative;

            i span {
                position: absolute;
                width: 14px;
                height: 14px;
                border: 1px solid #f12211;
                border-radius: 50%;
                line-height: 14px;
                font-size: 12px;
                top: 0;
                right: 10px;
                background-color: #FFFFFF;
                transform: scale(0.7);
                color: #f12211;
                font-style: normal;
            }
        }

        .custom,
        .cart_go {
            width: 40px;
            height: 36px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;

            span {
                font-weight: 400;
                color: rgba(74, 74, 74, 1);
                line-height: 14px;
                font-size: 12px;
                width: 60px;
                transform: scale(0.85);
                text-align: center;
            }
        }

        .custom i {
            width: 22px;
            height: 22px;
            background: url(../images/detail/kf.png) no-repeat center center;
            background-size: 100% 100%;
        }

        .cart_go i {
            width: 22px;
            height: 22px;
            background: url(../images/detail/cart.png) no-repeat center center;
            background-size: 100% 100%;
        }

        .add_cart {
            width: 94px;
            height: 35px;
            background: url(../images/detail/jg.png) no-repeat center center;
            background-size: 100% 100%;
            margin-left: 24px;
        }

        .buy_btn {
            width: 94px;
            height: 35px;
            background: url(../images/detail/buy.png) no-repeat center center;
            background-size: 100% 100%;
            margin-left: 10px;
        }
		
		.sale_time {
		    width: 200px;
		    height: 35px;
			line-height: 35px;
		    background: linear-gradient(123deg,#e3382e,#ff4d15);
			color: #ffffff;
		    margin-left: 15px;
			border-radius: 18px;
			text-align: center;
			font-size: 14px;
			.van-count-down{
				display: inline;
				line-height: 35px;
				color: #ffffff;
				font-size: 14px;
			}
		}
    }

    .vip_price {
        width: 100%;
        height: 47px;
        background: linear-gradient(270deg, rgba(76, 64, 65, 1) 0%, rgba(72, 59, 61, 1) 100%);
        border-radius: 0px 0px 6px 6px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 16px;

        .vip_num {
            height: 33px;
            font-size: 24px;
            font-weight: 500;
            color: rgba(221, 206, 185, 1);
            line-height: 33px;
        }

        .vip_discount {
            height: 17px;
            font-size: 12px;
            font-weight: 400;
            color: rgba(224, 213, 207, 1);
            line-height: 17px;
        }
    }

    /deep/ .van-popup--bottom.van-popup--round {
        border-radius: 6px 6px 0 0;
        height: 265px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
    }

    /deep/ .van-icon-close::before {
        content: '';
        width: 24px;
        height: 24px;
        background: url(../images/item/clear.png) no-repeat center center;
        background-size: 100% 100%;
    }

    .item_box {
        width: 100%;
        height: 100%;
        padding: 16px 16px 11px 16px;

        .item_top {
            display: flex;
            justify-content: flex-start;

            img {
                width: 80px;
                height: 80px;
            }

            .item_price {
                flex: 1;
                margin-left: 14px;
                display: flex;
                align-items: flex-start;
                flex-direction: column;
                justify-content: center;
                font-size: 12px;

                .active_status {
                    height: 16px;
                    line-height: 16px;
                    background: rgba(241, 34, 17, 0.08);
                    border-radius: 4px;
                    padding: 0 3px;
                    font-weight: 400;
                    color: #f12211;
                    margin-bottom: 5px;
                }

                .price_show {
                    display: flex;
                    justify-content: flex-start;
                    align-items: baseline;
                    height: 21px;
                    line-height: 21px;

                    .now_price {
                        font-size: 15px;
                        color: #f12211;
                        font-weight: 600;
                    }

                    .old_price {
                        color: #B3B3B3;
                        margin-left: 10px;
                    }
                }

                .stock {
                    height: 17px;
                    line-height: 17px;
                    font-weight: 400;
                    color: rgba(0,0,0,.6);
                    margin-top: 2px;
                }
            }
        }

        .item_cut_num {
            height: 21px;
            margin-top: 25px;
            display: flex;
            align-items: center;
            justify-content: space-between;

            .buy_num {
                font-size: 12px;
                font-weight: 600;
                line-height: 17px;
                color: rgba(0, 0, 0, 0.8);
                flex: 1;
            }

            .cut_num {
                flex: 1;
                display: flex;
                justify-content: flex-end;
                align-items: center;

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
        }

        .define {
            width: 336px;
            height: 35px;
            background: linear-gradient(123deg,#e3382e,#ff4d15);
            border-radius: 18px;
            line-height: 35px;
            margin-top: 77px;
            font-size: 12px;
            font-weight: 600;
            color: rgba(255, 255, 255, 1);
            text-align: center;
        }
    }
</style>
