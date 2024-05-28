<template>
    <div class="sign_wrap">
        <div class="sign_header">
            <div class="sign_back" @click="$router.back()"></div>
            <div class="sign_tit">每日签到</div>
            <div class="sign_day_num">
                <span>您已经累计签到第</span>
                <span class="day_font">{{running_days}}</span>
                <span>天</span>
            </div>
            <div class="sign_btn" :class="isSign?'over':''" @click="signBtn"></div>
        </div>
        <div class="calendar_box">
            <div class="cd_tit">{{title}}</div>
            <div class="calendar_header">
                <div class="block">日</div>
                <div class="block">一</div>
                <div class="block">二</div>
                <div class="block">三</div>
                <div class="block">四</div>
                <div class="block">五</div>
                <div class="block">六</div>
            </div>
            <div class="body">
                <div v-for="num in placeholderEleCount" :key="'place_day_' + num" class="block"></div>
                <div v-for="day,idx in allDays" class="block" :key="'day_' + idx">
                    <span>{{idx+1}}</span>
                    <i :class="day.is_signin==1?'signs':''"></i>
                </div>
            </div>
        </div>
        <div class="sign_gift wrap_box">
            <p class="title">今日签到奖励</p>
            <div class="coupon_box tick_bg3" v-if="signData.reward_type == 1">
                <div class="left_money">
                    <div class="tick_money"><span>¥ </span>{{signData.reward_num}}</div>
                    <div class="tit">红包</div>
                </div>
                <div class="right_content center">
                    <p class="tick_tit">现金红包</p>
                    <p class="tick_time">直接发放至余额账户</p>
                </div>
            </div>
            
            <div class="coupon_box tick_bg1" v-if="signData.reward_type == 2">
                <div class="left_money">
                    <div class="tick_money"><span>¥ </span>{{signData.reward_num}}</div>
                    <div class="tit">代金券</div>
                </div>
                <div class="right_content">
                    <p class="tick_tit">签到满{{signData.days}}天系统赠送</p>
                    <p class="tick_tit_tip"><span>{{signData.coupon_xid > 0?'指定商品使用':'不限商品使用'}}</span></p>
                    <p class="tick_time">{{signData.coupon_day}} 日内有效</p>
                    <p class="tick_tips">注：代金券可充当本金使用且可返还</p>
                </div>
            </div>
        </div>
        <div class="series_sign wrap_box">
            <p class="title">累计签到奖励</p>
			<sign-process custom-class="process" :data="reward_set_list" :active="Number(running_days)" />
        </div>
        <p class="tips">备注： 奖励红包直接发放到钱包余额中，代金券直接发放到券包中，请注意查收！</p>
        <div class="sign_mask" v-show="signShow">
            <div class="sign_inner">
                <div class="award_tit">
                    <p class="award_tips">获得{{award_tips}}</p>
                    <p class="award_num">{{award_num}}元</p>
                </div>
                <div class="sign_button btn_over"></div>
                <div class="close_btn" @click="signShow = false"></div>
            </div>
        </div>
    </div>
</template>

<script>
    const BIG_MONTH = [1, 3, 5, 7, 8, 10, 12]
    const SMALL_MONTH = [4, 6, 9, 11]

    function getDaysFromCurrentMonth(year, month) {
        if (BIG_MONTH.indexOf(month) !== -1) {
            return 31
        }

        if (SMALL_MONTH.indexOf(month) !== -1) {
            return 30
        }

        if ((year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0)) {
            return 29
        }

        return 28
    }

    function getWeekdayOfMonth(year, month) {
        const fistDate = new Date(year, month - 1, 1)
        return fistDate.getDay()
    }

    function isObject(obj) {
        return Object.prototype.toString.call(obj) === '[object Object]'
    }
    function getRewardSetList(obj) {
    	if (isObject(obj)) {
            return Object.keys(obj).map(key => {
                return {
                    value: obj[key].value,
                    type: obj[key].type,
                    day: key,
                    id:obj[key].id,
                    getstatus:obj[key].getstatus
                }
            })
    	}
    	
    	return []
    }

    import Vue from 'vue';
    import SignProcess from '../../components/signProcess'
    import Fetch from '../../utils/fetch';
    import {
        Dialog
    } from 'vant';

    export default {
        name: "jz",
        components: {
            SignProcess
        },
        data() {
            return {
                data: {},
                signData: {},
                running_days:0,
                show_down: false,
                title: '',
                isSign:false,
                placeholderEleCount: 0,
                allDays: 0,
                reward_set_list: [],
                award_tips: '',
                award_num: '',
                signShow: false,
            };
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            this.init();
        },
        methods: {
            signBtn() {
                Fetch('/user/sign').then(r=>{
                    this.signShow = true;
                    this.running_days = r.data.days;
                    this.isSign = true;
                    this.award_tips = r.data.reward_type == 1 ? '红包': '代金券';
                    this.award_num = r.data.reward_num;
                    this.init();
                })
            },
            init() {
                
                Fetch('/user/sign_log').then(r=>{
                    this.allDays = r.data.date_list;
                })
                
                // 累计奖励列表
                Fetch('/user/sign_reward').then(r=>{
                    var reward_set = {};
                    r.data.reward_list.forEach(item=>{
                        reward_set[item.days] = {
                            type: item.reward_type == 2? 'djq': 'hb',
                            value: item.reward_num,
                            getstatus: item.can_draw,
                            id: item.id
                        }
                    })
                    this.running_days = r.data.signin_days
					this.isSign = r.data.isSign
                    this.reward_set_list = getRewardSetList(reward_set)
                    this.signData = r.data.today_reward
                })
                
                
                const today = new Date()
                const year = today.getFullYear()
                const month = today.getMonth() + 1

                // const days = getDaysFromCurrentMonth(year, month)
                this.title = `${year}年${month}月`
                // this.allDays = getDaysFromCurrentMonth(year, month)
                this.placeholderEleCount = getWeekdayOfMonth(year, month);

                
            }
        }
    };
</script>

<style lang="less" scoped>
    .sign_header {
        width: 100%;
        height: 176px;
        background: url(../images/sign/sign_bg.png) no-repeat center center;
        background-size: 100% 100%;
        position: relative;
        overflow: hidden;
        position: fixed;
        z-index: 15;

        .sign_back {
            width: 20px;
            height: 20px;
            background: url(../images/item/back.png) no-repeat center center;
            background-size: auto 100%;
            position: absolute;
            top: 26px;
            left: 14px;
        }

        .sign_tit {
            width: 100%;
            height: 25px;
            line-height: 25px;
            font-size: 18px;
            color: #fff;
            font-weight: 500;
            margin-top: 23px;
            text-align: center;
        }

        .sign_day_num {
            height: 42px;
            margin-top: 3px;
            display: flex;
            justify-content: center;
            align-items: baseline;

            span {
                font-size: 15px;
                color: #FEED9F;
                font-weight: 500;
                line-height: 21px;
            }

            .day_font {
                font-size: 30px;
                font-weight: 600;
                line-height: 42px;
                color: #fff;
                margin: 0 5px;
            }
        }

        .sign_btn {
            width: 151px;
            height: 51px;
            background: url(../images/sign/sign_btn.png) no-repeat center center;
            background-size: auto 100%;
            margin: 6px auto 0 auto;
            &.over{
                background: url(../images/sign/sign_over.png) no-repeat center center;
                background-size: auto 100%;
                pointer-events: none;
            }
        }
    }

    .calendar_box {
        width: 350px;
        padding: 22px 0;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        margin: 176px auto 0 auto;
        
        .cd_tit {
            height: 21px;
            font-size: 15px;
            line-height: 21px;
            color: #020202;
            text-align: center;
        }

        .calendar_header {
            display: flex;
            flex-wrap: nowrap;
            align-items: center;
            width: 100%;
            padding: 0 22px;
            height: 34px;
            margin-top: 10px;
            background-color: #f4f7ff;
            line-height: 34px;

            .block {
                width: 14.28%;
                font-size: 12px;
                color: rgba(0,0,0,.6);
                text-align: center;
            }
        }

        .body {
            display: flex;
            flex-wrap: wrap;
            padding: 0 22px;

            .block {
                text-align: center;
                line-height: 28px;
                position: relative;
                height: 28px;
                margin-top: 5px;
                width: 14.28%;
                font-size: 13px;
                color: #222222;

                span {
                    position: absolute;
                    width: 100%;
                    height: 100%;
                    top: 0;
                    left: 0;
                    z-index: 3;
                }

                i.award_icon {
                    width: 29px;
                    height: 26px;
                    background: url(../images/sign/sign3.png) no-repeat center center;
                    background-size: auto 100%;
                    position: absolute;
                    top: 1px;
                    left: 50%;
                    transform: translateX(-50%);
                }
                i.award_icon2 {
                    width: 29px;
                    height: 26px;
                    background: url(../images/sign/sign4.png) no-repeat center center;
                    background-size: auto 100%;
                    position: absolute;
                    top: 1px;
                    left: 50%;
                    transform: translateX(-50%);
                }

                /deep/ i.signs {
                    width: 23px;
                    height: 23px;
                    background: url(../images/sign/ok.png) no-repeat center center;
                    background-size: auto 100%;
                    position: absolute;
                    top: 2px;
                    left: 50%;
                    transform: translateX(-50%);
                }
            }
        }
    }

    .sign_gift,
    .series_sign {
        width: 351px;
        margin: 12px auto 0 auto;
        padding: 7px 7px 13px 7px;

        .title {
            margin-left: 2px;
            height: 25px;
            font-size: 14px;
            font-weight: 600;
            color: rgba(0, 0, 0, 1);
            line-height: 20px;
            padding-bottom: 5px;
            border-bottom: 1px solid #F6F6F6;
            margin-bottom: 13px;
        }
    }

    .tick_bg1 .use_it {
        border: 1px solid #5E98E1;
    }

    .tick_bg3 .use_it {
        border: 1px solid #E9B368;
    }

    .tick_bg1 .use_it span {
        color: #5E98E1;
    }

    .tick_bg3 .use_it span {
        color: #E9B368;
    }

    .coupon_box {
        width: 337px;
        height: 88px;
        position: relative;
        display: flex;
        justify-content: flex-start;

        .use_it {
            position: absolute;
            height: 20px;
            line-height: 20px;
            top: 10px;
            right: 7px;
            z-index: 5;
            border-radius: 10px;
            padding: 0 7px;
            font-size: 12px;

            span {
                transform: scale(0.85);
            }
        }

        .left_money {
            width: 114px;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            color: #FFFFFF;

            .tick_money {
                height: 42px;
                line-height: 42px;
                font-size: 28px;
                font-weight: bold;

                span {
                    font-size: 18px;
                }
            }

            .tit {
                font-size: 12px;
                margin-top: 4px;
                line-height: 17px;
            }
        }

        .right_content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            font-size: 12px;
            margin-left: 10px;

            p {
                color: rgba(0,0,0,.8);
                line-height: 14px;
            }

            .tick_tit,
            .tick_tit_tip {
                margin-top: 10px;
                font-weight: bold;
            }

            .tick_time {
                margin-top: 10px;
            }

            .tick_tips {
                white-space: normal;
                word-break: keep-all;
                margin-top: 5px;
                color: rgba(0,0,0,.6);
            }
        }
        .right_content.center{
            justify-content: center;
            .tick_time {
                margin-top: 20px;
            }
            .tick_tit{
                margin-top: 0;
            }
        }
    }

    .tick_bg1 {
        background: url(../images/sign/award_bg.png) no-repeat center center;
        background-size: 100% 100%;
    }

    .tick_bg2 {
        background: url(../images/item/tick_bg2.png) no-repeat center center;
        background-size: 100% 100%;
    }

    .tick_bg3 {
        background: url(../images/sign/redbag.png) no-repeat center center;
        background-size: 100% 100%;
    }

    .tips {
        width: 100%;
        padding: 0 15px;
        font-size: 12px;
        color: #f12211;
        line-height: 17px;
        margin-top: 7px;
    }

    .sign_mask {
        position: fixed;
        z-index: 40;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.6);

        .sign_inner {
            width: 275px;
            height: 481px;
            background: url(../images/sign/pop.png) no-repeat center center;
            background-size: 100% 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -240px;
            margin-left: -137px;

            .award_tit {
                position: absolute;
                width: 140px;
                height: 55px;
                top: 276px;
                left: 68px;
                font-weight: bold;
                text-align: center;
                .award_tips{
                    font-size: 20px;
                    line-height: 28px;
                    color: #f12211;
                }
                .award_num{
                    font-size: 22px;
                    color: #f12211;
                    line-height: 30px;
                }
            }

            .sign_button {
                position: absolute;
                width: 89px;
                height: 89px;
                background: url(../images/sign/button.png) no-repeat center center;
                background-size: 100% 100%;
                top: 340px;
                left: 91px;

                &.btn_over {
                    background: url(../images/sign/btn_over.png) no-repeat center center;
                    background-size: 100% 100%;
                }
            }

            .close_btn {
                position: absolute;
                width: 32px;
                height: 32px;
                background: url(../images/sign/clear.png) no-repeat center center;
                background-size: 100% 100%;
                top: 18px;
                left: 263px;
            }
        }
    }
</style>
