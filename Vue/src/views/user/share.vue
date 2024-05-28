<template>
    <div class="invite_wrap">
        <div class="basic_wrap">
            <div class="red_top_bg">
                <div class="back_left" @click="$router.back()"></div>
                <div class="big_tit">产品推广</div>
                <div class="tj_tit_icon"></div>
                <div class="introduce">
                    <div class="line left_line"></div>
                    <div class="tit">奖励介绍</div>
                    <div class="line right_line"></div>
                </div>
                <div class="award_tip">推荐新用户下单：一级可获得{{data.reward.invest1}}%的佣金，二级可获得{{data.reward.invest2}}%的佣金，三级可获得{{data.reward.invest3}}%的佣金。</div>
                <p class="bq">*本活动最终解释权归属官方所有*</p>
            </div>
            <div class="wrap_box wrap1">
                <p class="tory_tit">数据及记录</p>
                <div class="cut_box">
                    <div class="cut" @click="cutShare(1)" :class="cutNow==1?'choose':''">
                        <p class="num">{{data.share_user.length}}</p>
                        <p class="type">推荐新用户</p>
                        <div class="cur"></div>
                    </div>
                    <div class="line"></div>
                    <div class="cut" @click="cutShare(2)" :class="cutNow==2?'choose':''">
                        <p class="num">¥{{tgData.share_reward}}</p>
                        <p class="type">累计推广佣金</p>
                        <div class="cur"></div>
                    </div>
                </div>

            </div>
            <div class="wrap_box wrap2" v-show="cutShow">
                <div class="tit"><span></span>邀请记录</div>
                <div class="list">
                    <van-empty description="暂无邀请记录" v-if="shareUserDate" />
                    <div class="item" v-for="i in data.share_user">
                        <div class="tel">{{i.phone}}</div>
                        <div class="time">{{i.time}}</div>
                    </div>
                </div>
            </div>
            <div class="wrap_box wrap3" v-show="!cutShow">
                <div class="tit"><span></span>邀请记录</div>
                <div class="list">
                    <van-empty description="暂无推广佣金记录" v-if="tgDataShow" />
                    <div class="item" v-for="item in tgData.list">
                        <div class="history_top">
                            <div class="name van-ellipsis">{{item.remark}}</div>
                            <div class="time">{{item.time}}</div>
                            <div class="price">¥{{item.money}}</div>
                        </div>
                        <p class="shop_title van-ellipsis">{{item.reason}}</p>
                    </div>
                </div>
            </div>
            <div class="basic_btn" @click="qrcode = true">获取推广二维码</div>
            <div class="mask" v-show="qrcode" @click="qrcode = false">
                <div class="share_inner">
                    <div class="white_bg">
                        <img class="qrcode" :src="data.share_image_url" alt="" />
                    </div>
                    <div @click.stop="downLoad" class="basic_btn">保存图片</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Fetch from '../../utils/fetch';
    import bsHeader from '../../components/bsHeader.vue'
    import Vue from 'vue';
    import { Empty } from 'vant';
    
    Vue.use(Empty);
    export default {
        name: "login",
        data() {
            return {
                data: {
					reward :[],
					share_user: []
				},
                tgData:{},
                cutNow: 1,
                cutShow: true,
                qrcode: false,
                tgDataShow: false,
                shareUserDate:false
            };
        },
        components: {
            bsHeader
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            this.start();
            
        },
        methods: {
            cutShare(idx){
                if(idx == 1){
                    this.cutNow = 1;
                    this.cutShow = true;
                }else{
                    this.cutNow = 2;
                    this.cutShow = false;
                }
            },
            start() {
                Fetch('/user/share').then((r) => {
                    this.data = r.data;
                    if(r.data.share_user.length == 0){
                        this.shareUserDate = true;
                    }else{
                        this.shareUserDate = false;
                    }
                });
                Fetch('/user/funds',{
                    reason_id: 10,
                }).then((r) => {
                    this.tgData = r.data;
                    if(r.data.list.length == 0){
                        this.tgDataShow = true;
                    }else{
                        this.tgDataShow = false;
                    }
                });
            },
            downLoad(){
                /*var that = this;
                 jsBridge.saveImageToAlbum(this.data.share_image_url, function(succ) {
                    that.$toast(succ ? "保存成功" : "保存失败：下载失败或没有相册使用权限");
                }); */
                this.downloadIamge(this.data.share_image_url,'share.jpg')
            },
            downloadIamge(imgsrc, name) { //下载图片地址和图片名
                var image = new Image();
                // 解决跨域 Canvas 污染问题
                image.setAttribute("crossOrigin", "anonymous");
                image.onload = function() {
                    var canvas = document.createElement("canvas");
                    canvas.width = image.width;
                    canvas.height = image.height;
                    var context = canvas.getContext("2d");
                    context.drawImage(image, 0, 0, image.width, image.height);
                    var url = canvas.toDataURL("image/png"); //得到图片的base64编码数据

                    var a = document.createElement("a"); // 生成一个a元素
                    var event = new MouseEvent("click"); // 创建一个单击事件
                    a.download = name || "photo"; // 设置图片名称
                    a.href = url; // 将生成的URL设置为a.href属性
                    a.dispatchEvent(event); // 触发a的单击事件
                };
                image.src = imgsrc;
            },
        }
    };
</script>

<style lang="less" scoped>
    /deep/ .van-empty{
        padding: 0 0 20px 0;
    }
    .red_top_bg {
        height: 257px;
        background: url(../images/user/tg_bg.png) no-repeat center center;
        background-size: 100% 100%;
        position: relative;
        .big_tit{
            position: absolute;
        }
    }

    .tj_tit_icon {
        height: 27px;
        width: 226px;
        text-align: center;
        margin: 18px auto 0 auto;
        background: url(../images/user/ad_tit.png) no-repeat center center;
        background-size: 100% 100%;
    }

    .introduce {
        height: 25px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 18px;
        line-height: 25px;
        color: #FFFFFF;
        margin-top: 15px;

        .line {
            width: 36px;
            height: 10px;
        }

        .tit {
            margin: 0 12px;
            font-weight: bold;
        }

        .left_line {
            background: url(../images/user/left_icon.png) no-repeat center center;
            background-size: 100% 100%;
        }

        .right_line {
            background: url(../images/user/right_icon.png) no-repeat center center;
            background-size: 100% 100%;
        }
    }

    .award_tip {
        width: 314px;
        font-size: 14px;
        line-height: 20px;
        color: rgba(255, 255, 255, 0.8);
        text-align: center;
        margin: 3px auto 0 auto;
    }

    .bq {
        width: 100%;
        line-height: 17px;
        font-size: 12px;
        color: #FFFFFF;
        text-align: center;
        margin-top: 16px;
    }

    .wrap1 {
        padding-top: 8px;
        width: 351px;
        margin: -57px auto 0 auto;
        position: relative;
        z-index: 5;

        .tory_tit {
            height: 20px;
            line-height: 20px;
            font-size: 14px;
            padding-left: 11px;
            font-weight: bold;
            color: rgba(0,0,0,.8);
            padding-bottom: 5px;
            border-bottom: 1px solid #F6F6F6;
        }

        .cut_box {
            display: flex;
            align-items: center;
            justify-content: space-around;
            text-align: center;

            .line {
                height: 42px;
                border-left: 2px solid rgba(0, 0, 0, 0.1);
            }

            .cut {
                width: 50%;
                height: 77px;
                position: relative;

                .num {
                    font-size: 22px;
                    font-weight: bold;
                    color: rgba(0,0,0,.6);
                    margin-top: 18px;
                }

                .type {
                    height: 18px;
                    font-size: 13px;
                    color: rgba(0,0,0,.6);
                    line-height: 18px;
                    margin-top: 4px;
                }

                .cur {
                    width: 90px;
                    height: 6px;
                    background: rgba(227, 56, 46, 1);
                    border-radius: 4px 4px 0px 0px;
                    position: absolute;
                    left: 0;
                    right: 0;
                    margin: 0 auto;
                    bottom: 0;
                    display: none;
                }

                &.choose {

                    .num,
                    .type {
                        color: rgba(0,0,0,.8);
                    }

                    .cur {
                        display: block;
                    }
                }
            }
        }
    }

    .wrap2,
    .wrap3 {
        width: 351px;
        margin: 14px auto 0 auto;
        overflow: hidden;

        .list {
            margin-top: 16px;
        }

        .tit {
            width: 75px;
            height: 20px;
            line-height: 20px;
            margin: 15px auto 0 auto;
            font-size: 14px;
            font-weight: 600;
            color: rgba(0,0,0,.8);
            position: relative;
            text-align: center;

            span {
                width: 100%;
                height: 10px;
                background: rgba(255, 23, 0, 1);
                border-radius: 5px;
                opacity: 0.11;
                position: absolute;
                top: 11px;
                left: 0;
            }
        }
    }

    .wrap2 {
        width: 351px;
        margin: 14px auto 0 auto;
        overflow: hidden;

        .tit {
            width: 75px;
            height: 20px;
            line-height: 20px;
            margin: 15px auto 0 auto;
            font-size: 14px;
            font-weight: 600;
            color: rgba(0,0,0,.8);
            position: relative;
            text-align: center;

            span {
                width: 100%;
                height: 10px;
                background: rgba(255, 23, 0, 1);
                border-radius: 5px;
                opacity: 0.11;
                position: absolute;
                top: 11px;
                left: 0;
            }
        }

        .item {
            height: 52px;
            line-height: 52px;
            width: 314px;
            margin: 0 auto;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            border-bottom: 1px solid #E3E4E5;

            &:last-child {
                border-bottom: none;
            }

            .name {
                width: 84px;
                font-size: 14px;
                color: #000000;
            }

            .tel {
                width: 90px;
                font-size: 13px;
                color: #000;
                margin-left: 8px;
            }

            .time {
                flex: 1;
                margin-left: auto;
                text-align: right;
                font-size: 12px;
                color: rgba(0, 0, 0, 0.4);
            }
        }
    }

    .wrap3 {
        .item {
            height: 73px;
            width: 314px;
            margin: 0 auto;
            padding-top: 1px;
            border-bottom: 1px solid #E3E4E5;

            &:last-child {
                border-bottom: none;
            }

            .history_top {
                height: 20px;
                display: flex;
                margin-top: 13px;
                align-items: center;
                justify-content: flex-start;

                .name {
                    font-size: 13px;
                    color: #000000;
                }

                .time {
                    margin-left: 6px;
                    font-size: 12px;
                    color: rgba(0, 0, 0, 0.4);
                }

                .price {
                    margin-left: auto;
                    font-size: 14px;
                    font-weight: bold;
                    color: #f12211;
                }
            }

            .shop_title {
                font-size: 12px;
                color: rgba(0,0,0,.6);
                line-height: 17px;
                height: 17px;
                margin-top: 11px;
            }
        }
    }

    .mask {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: 30;

        .share_inner {
            width: 343px;
            height: 397px;
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            margin: -232px auto 0 auto;
            background: url(../images/user/code_bg.png) no-repeat center center;
            background-size: 100% 100%;
        }

        .white_bg {
            width: 160px;
            height: 160px;
            background-color: #FFFFFF;
            position: absolute;
            top: 209px;
            left: 92px;
            display: flex;
            justify-content: center;
            align-items: center;

            img {
                width: 143px;
                height: 143px;
            }
        }

        .basic_btn {
            position: absolute;
            left: 0;
            right: 0;
            margin: 0 auto;
            top: 419px;
        }
    }

    .basic_btn {
        margin: 30px auto 0 auto;
    }
</style>
