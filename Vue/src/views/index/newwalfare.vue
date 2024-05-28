<template>
    <div class="basic_wrap">
        <bsHeader title="新人福利"></bsHeader>
        <div class="red_bag">
            <div class="money_icon"></div>
            <p class="bag_tips">{{title}}送您一个新人福利{{type}}</p>

            <div class="money">
                <!-- <svg viewBoxs="0 0" class="svgBox">
                    <defs>
                        <linearGradient id="SVGID_1_" gradientUnits="userSpaceOnUse" x1="0" y1="10" x2="0" y2="50">
                            <stop offset="0" style="stop-color:#FDEFDA" />
                            <stop offset="1" style="stop-color:#FFC684" />
                        </linearGradient>
                    </defs>
                    <text text-anchor="middle" class="gradient-text-three" x="50%" y="50%">{{data.amount}}</text>
                </svg> -->
                <span id="linear">{{data.amount}}</span>
                <span class="money_font">元</span>
            </div>
            <div class="get" :class="{'not_sm':!data.is_auth,'success':data.is_grant}" @click="getBtn"></div>
            <div class="sm_tips" v-if="!data.is_auth">
                <p class="tip">您还未实名认证，请先进行实名认证</p>
                <router-link to="/auth" class="rout" tag="div"><span>实名认证</span><span>></span></router-link>
            </div>
        </div>

    </div>
</template>

<script>
    import Fetch from '../../utils/fetch';
    import bsHeader from '../../components/bsHeader.vue'
    export default {
        name: "item",
        data() {
            return {
                data: {},
                type: '现金红包',
				title: ''
            }
        },
        components: {
            bsHeader
        },
        created() {
            this.$parent.footer('walfare', false);
        },
        mounted() {
            this.start();
        },
        methods: {
            start(){
                Fetch('/index/new_bonus').then(r=>{
                    this.data = r.data;
                })
				Fetch('/index/webconfig').then(r=>{
				    this.title = r.data.web_name;
				})
            },
            getBtn(){
                Fetch('/index/new_bonus_grant').then(r=>{
                    if(r.code == 1){
                        this.data.is_grant = true
                    }
                })
            }
        },
    }
</script>

<style lang="less" scoped>
    .basic_wrap {
        width: 100%;
        min-height: 100vh;
        background-image: linear-gradient(to right, #F22246, #EB0B42);
    }
    
    #linear{
        background: linear-gradient(to bottom, #FDEFDA, #FFC684);
        -webkit-background-clip: text;
        color: transparent;
        font-size: 75px;
        height: 75px;
        font-weight: bold;
        line-height: 75px;
    }
    

    .red_bag {
        width: 100%;
        height: 603px;
        background: url(../images/index/bag.png) no-repeat center center;
        background-size: 100% 100%;
        position: relative;

        .money_icon {
            width: 52px;
            height: 52px;
            position: absolute;
            background: url(../images/index/money.png) no-repeat center center;
            background-size: 100% 100%;
            top: 27px;
            left: 50%;
            transform: translateX(-50%);
        }

        .bag_tips {
            width: 100%;
            height: 25px;
            font-size: 18px;
            color: #FFFFFF;
            position: absolute;
            top: 87px;
            left: 0;
            text-align: center;
        }

        .money {
            width: 100%;
            height: 90px;
            position: absolute;
            top: 125px;
            left: 0;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: baseline;

            span {
                font-size: 32px;
                line-height: 45px;
                color: #FFD3A0;
            }
        }

    }

    .gradient-text-three {
        fill: url(#SVGID_1_);
        font-size: 75px;
        font-weight: bolder;
        text-shadow: 0px 2px 4px rgba(221, 0, 57, 1);
    }

    .get {
        width: 136px;
        height: 136px;
        position: absolute;
        top: 218px;
        left: 50%;
        transform: translateX(-50%);
    }

    .get {
        background: url(../images/index/get1.png) no-repeat center center;
        background-size: 100% 100%;
    }

    .get.not_sm {
        background: url(../images/index/get2.png) no-repeat center center;
        background-size: 100% 100%;
        pointer-events: none;
    }

    .get.success {
        background: url(../images/index/get3.png) no-repeat center center;
        background-size: 100% 100%;
        pointer-events: none;
    }

    .sm_tips {
        width: 353px;
        height: 83px;
        background: url(../images/index/tips.png) no-repeat center center;
        background-size: 100% 100%;
        position: absolute;
        top: 389px;
        left: 12px;
        font-size: 13px;
        line-height: 18px;

        .tip {
            color: #FFFFFF;
            position: absolute;
            top: 20px;
            left: 25px;
        }

        .rout {
            color: #FFDB80;
            position: absolute;
            top: 49px;
            left: 257px;

            span:first-child {
                text-decoration: underline;
                margin-left: 0;
            }

            span {
                margin-left: 7px;
            }
        }
    }
    .gradient-text-three:::after{
        content: '元';
    }
</style>
