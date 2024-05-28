<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.replace('/user')"></div>
            <div class="big_tit">我的钱包</div>
            <div class="bag_tit">{{userName}} 的钱包余额</div>
            <router-link to="/invest" class="fixed_btn invest">充值</router-link>
            <router-link to="/cash" class="fixed_btn cash">提现</router-link>
            <div class="money_price">
                <span>¥</span>
                <span>{{funds}}</span>
            </div>
        </div>
        <div class="center_choose">
                <p>资金流水</p>
                <van-dropdown-menu :overlay="false">
                    <van-dropdown-item v-model="account" :options="option" @change="chooseType" />
                </van-dropdown-menu>
            </div>
        <van-empty description="暂无当前类型流水" v-if="listShow" />
        <div class="detail_box">
            <div class="item" v-for="item in data">
                <div class="de_wrap">
                    <p class="tit">{{item.reason}}</p>
                    <p class="time">{{item.time}}</p>
                </div>
                <div class="price" :class="item.type =='1'?'':'del'" v-html="item.type =='1'?item.money : '-'+item.money"></div>
            </div>
        </div>
    </div>
</template>

<script>
    import Vue from 'vue';
    import Fetch from '../../utils/fetch'
    import {
        DropdownMenu,
        DropdownItem
    } from 'vant';

    import { Empty } from 'vant';

    Vue.use(Empty);
    Vue.use(DropdownMenu).use(DropdownItem);

    export default {
        name: "moneybag",
        data() {
            return {
                data: [],
                list: {},
                account: 0,
                option: [],
                listShow:false,
                funds: 0,
                userName:''
            };
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            Fetch('/user/funds').then(r => {
                this.option.push({
                    text: "全部类型",
                    value: 0
                })
                for (var i in r.data.reason) {
                    this.option.push({
                        text: r.data.reason[i],
                        value: i
                    })
                }
                
                this.showError(r.data.list.length);
                this.data = r.data.list;
                this.funds = r.data.money;
                this.userName = r.data.username;
            })
        },
        methods: {
            chooseType(val) {
                if(val == 0){
                    Fetch('/user/funds').then(r=>{
                        this.data = r.data.list;
                        this.showError(r.data.list.length);
                    })
                }else{
                    Fetch('/user/funds',{
                        reason_id: val
                    }).then(r=>{
                        this.data = r.data.list;
                        this.showError(r.data.list.length);
                    })
                }
            },
            showError(len){
                len == 0 ? this.listShow = true : this.listShow = false
            }
        }
    };
</script>

<style lang="less" scoped>
    /deep/ .van-dropdown-menu {
        position: relative;
        z-index: 10;
        color: #CCCCCC;
    }

    /deep/ .van-dropdown-menu__bar {
        position: relative;
        z-index: 10;
        width: 130px;
        height: 34px;
        border: 1px solid #D9D9D9;
        border-radius: 4px;
        text-align: left;
    }

    /deep/ .van-dropdown-item--down {
        width: 130px;
        margin: 0 auto;
        z-index: 12;
        transform: translateX(106px);
    }

    /deep/ .van-dropdown-menu__item {
        justify-content: flex-start;
        color: #ccc;
        background-color: #fff;
    }

    /deep/ .van-dropdown-menu__title {
        width: 100%;
    }

    /deep/ .van-dropdown-menu__title::after {
        width: 13px;
        height: 22px;
        transform: none;
        background: url(../../assets/images/drop.png) no-repeat center center;
        background-size: 100% 100%;
        border: none;
        opacity: 1;
        margin-top: -11px;
        right: 10px;
    }

    /deep/ .van-cell {
        padding: 5px 8px;
    }

    /deep/ .van-cell__title {
        flex: 3;
        white-space: normal;
    }

    /deep/ .van-ellipsis {
        color: #000;
    }

    /deep/ .van-dropdown-item__option {
        color: #ccc;
        border: 1px solid #D9D9D9;
        border-bottom: none;
        border-radius: 4px;
    }

    /deep/ .van-dropdown-item__option:last-child {
        border-bottom: 1px solid #D9D9D9;
    }

    /deep/ .van-dropdown-item__option--active.van-dropdown-item__option {
        color: #000;

        .van-dropdown-item__icon {
            color: #E96259;
        }
    }

    .red_top_bg {
        height: 156px;
        background: url(../images/user/order.png) no-repeat center center;
        background-size: 100% 100%;
        position: fixed;
        z-index: 15;
    }

    .bag_tit {
        position: absolute;
        font-size: 12px;
        line-height: 17px;
        color: #FFFFFF;
        top: 58px;
        left: 16px;
    }

    .fixed_btn {
        width: 67px;
        height: 35px;
        border-radius: 18px 0 0 18px;
        font-size: 12px;
        line-height: 35px;
        color: #FFFFFF;
        text-align: center;
        position: absolute;
        right: 0;
    }

    .invest {
        top: 44px;
        background: linear-gradient(300deg, rgba(255, 186, 0, 1) 0%, rgba(255, 109, 73, 1) 100%);
    }

    .cash {
        top: 96px;
        background: linear-gradient(125deg, rgba(255, 185, 22, 1) 0%, rgba(255, 186, 0, 1) 100%);
    }

    .money_price {
        position: absolute;
        height: 48px;
        line-height: 48px;
        color: #FFFFFF;
        top: 92px;
        left: 12px;

        span:first-child {
            font-size: 16px;
            margin-right: 4px;
        }

        span:last-child {
            font-size: 34px;
        }
    }

    .center_choose {
        position: fixed;
        top: 156px;
        left: 50%;
        z-index: 2;
        width: 375px;
        margin-left: -187.5px;
        height: 40px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 0px 0px 6px 6px;
        padding: 0 16px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 14px;
        p {
            line-height: 20px;
            color: rgba(0,0,0,.8);
            font-weight: bold;
            font-weight: bold;
        }

        .select_box {
            width: 92px;
            height: 30px;
            border: 1px solid #D9D9D9;
            border-radius: 4px;
        }
    }


    .detail_box {
        width: 375px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        padding: 0 8px;
        margin-top: 208px;
        .item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 8px;
            border-bottom: 1px solid #ECECEC;

            .de_wrap {
                flex: 2;

                .tit {
                    font-size: 14px;
                    color: rgba(0,0,0,.8);
                    line-height: 20px;
                    font-weight: bold;
                }

                .time {
                    font-size: 12px;
                    color: rgba(0,0,0,.8);
                    line-height: 17px;
                    margin-top: 10px;
                }
            }

            .price {
                flex: 1;
                font-size: 20px;
                line-height: 28px;
                font-weight: bold;
                text-align: right;
                color: #f12211;
                white-space: nowrap;
                &.del {
                    color: #3FAF3E;
                }
            }
        }
    }
</style>
