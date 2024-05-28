<template>
  <div id="app">
    <router-view />
    <!--        <div class="download_box" v-if="is_show_footer && app.is_disable === 'Y' && is_show_down_app">
            <a :href="app.app_link" class="down">
                <div class="down_left">
                    <span class="app_logo" v-bind:style="{'background-image':'url(' + app.image + ')'}"></span>
                    <div class="app_info">
                        {{app.text1}}<br>{{app.text2}}
                    </div>
                </div>
                <div class="right">App客户端</div>
            </a>
            <span class="close_down" @click="closeDownApp"></span>
        </div> -->
    <div
      v-if="is_show_footer"
      class="footer"
    >
      <router-link
        to="/"
        class="footer_item"
        :class="show_icon_type === 'index' ? 'footer_item_active' : ''"
      >
        <span class="footer_icon footer_icon_home" />
        <p class="footer_info">
          首页
        </p>
      </router-link>
      <router-link
        to="/item"
        class="footer_item"
        :class="show_icon_type === 'item' ? 'footer_item_active' : ''"
      >
        <span class="footer_icon footer_icon_task" />
        <p class="footer_info">
          分类
        </p>
      </router-link>
      <router-link
        to="/cart"
        class="footer_item"
        :class="show_icon_type === 'cart' ? 'footer_item_active' : ''"
      >
        <span class="footer_icon footer_icon_cart" />
        <p class="footer_info">
          购物车
        </p>
      </router-link>
      <router-link
        to="/user"
        class="footer_item"
        :class="show_icon_type === 'user' ? 'footer_item_active' : ''"
      >
        <span class="footer_icon footer_icon_user" />
        <p class="footer_info">
          个人中心
        </p>
      </router-link>
    </div>
    <div
      v-show="real_name"
      class="real_name_mask"
    >
      <div class="real_box">
        <div class="tit" />
        <p class="tips">
          请先设置钱包余额支付密码！
        </p>
        <div
          class="basic_btn"
          @click="real_name = false"
        >
          立即设置
        </div>
      </div>
    </div>
  </div>
</template>

<script>
    import {
        Dialog
    } from 'vant';
    import Fetch from "./utils/fetch";

    export default {
        name: 'App',
        data() {
            return {
                show_icon_type: 'index',
                real_name: false,
                is_show_down_app: true,
                is_show_footer: true,
                sync_timer: null,
                app: {},
            }
        },
		updated(){
			document.body.scrollTop = 0
			document.documentElement.scrollTop = 0
		},
        mounted() {
            this.start();
        },
        methods: {
            bigNumeber(str){
                var str = str.toString();
                var strs = str.split(".");
                var s1 = strs[0] || 0;
                var s2 = strs[1] || "00"
                return `<span class="bigNum">${s1}</span><span>.</span><span>${s2}</span>`;
            },
			numFilter(value) {
			  let transformVal = parseFloat(value).toFixed(3)
			  let realVal = transformVal.substring(0, transformVal.length - 1)
			  return parseFloat(realVal)
			},
            footer: function(type = 'index', show_footer = true) {
                if (type == 'walfare') {
                    document.getElementById('app').style.paddingBottom = '0';
                } else {
                    document.getElementById('app').style.paddingBottom = '1.333333rem';
                }
                this.show_icon_type = type;
                this.is_show_footer = show_footer;
            },
            start() {

                Fetch("/index/webconfig").then((r) => {
                    this.app = r.data;
                    window.document.title = r.data.title;
                });

                this.sync_timer = setInterval(() => {
                    this.sync()
                }, 3000);
            },
            closeDownApp() {
                this.is_show_down_app = false;
            },
            sync() {
               /* Fetch("/index/sync", {}, null, false).then((r) => {
                    if (r.data.is_open_notice_dialog) {
                        this.openNoticeDialog();
                    }
                }); */
            },
            close() {
                this.show_anwser = false;
            },
            openNoticeDialog() {
                Dialog.confirm({
                    title: '提示',
                    message: '您有新消息，是否前往查看?'
                }).then(() => {
                    this.$router.push('/notice');
                }).catch(() => {

                });
            },
        }
    }
</script>
<style lang="less">
    // @import "./assets/font/font.css";
    .kefu{
        width: 80px;
        height: 80px;
        position: fixed;
        z-index: 10;
        right: 13px;
        bottom: 50px;
        transition: all 1s;
        opacity: 1;
        transform: translateX(0);
        z-index: 80;
        img{
            width: 100%;
            height: 100%;
        }
    }
    .kefu.kefu_hide{
        transform: translateX(70%);
        opacity: 0.5;
    }
    .numberFont{
        font-family: barlow !important;
        font-size: 15px !important;
        font-weight: bold !important;
        span:first-child{
            font-size: 12px !important;
        }
        span:nth-of-type(2){
            font-size: 14px !important;
        }
    }
    html,body{ width: 100%; height: 100%; overflow-y: scroll;}
    html::-webkit-scrollbar, body::-webkit-scrollbar{width:0px;height:0px;}
    body{margin:0;}
    .bigNum{
        font-size: 18px !important;
    }
    .fh{
        font-size: 12px !important;
    }
    .larfont .fh{
        margin-top: 3px;
    }
    .wan{
        font-size: 14px;
        margin-top: 2px;
    }
    .numberFontBold{
        span:first-child{
            font-size: 12px;
            margin-top: 4px;
        }
        span:last-child{
            margin-top: 2px;
        }
    }
    #app {
        padding-bottom: 50px;
        min-height: 100%;
        height: auto;
        width: 100%;
        max-width: 375px;
        background-color: #FAFAFA;
    }

    #app .download_box {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        position: fixed;
        margin: 0 auto;
        left: 0;
        right: 0;
        height: 45px;
        width: 100%;
        max-width: 375px;
        background: rgba(0, 0, 0, 0.5);
        bottom: 50px;
        padding: 0 3.6%;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
        z-index: 10;
    }

    #app .download_box .down {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        padding-right: 10px;
    }

    #app .download_box .down .down_left {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
    }

    #app .download_box .down .down_left .app_logo {
        display: inline-block;
        width: 40px;
        height: 40px;
        background-repeat: no-repeat;
        background-size: contain;
        background-position: center;
        background-image: url(./views/images/home/app_logo.svg);
        margin-right: 14px;
        ;
    }

    #app .download_box .down .down_left .app_info {
        font-size: 12px;
        color: #fff;
        line-height: 1.5;
        ;
    }

    #app .download_box .down .right {
        background: #D8232C;
        padding: 5px 5px;
        color: #ffffff;
        border-radius: 5px;
        font-size: 12px;
    }

    #app .download_box .close_down {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 20px;
        flex: 0 0 20px;
        height: 45px;
        ;
        background-repeat: no-repeat;
        background-size: contain;
        background-position: center;
        background-image: url(./views/images/home/close.svg);
    }

    #app .footer {
        position: fixed;
        margin: 0 auto;
        left: 0;
        right: 0;
        -webkit-box-flex: 0;
        -ms-flex: 0 0 48px;
        flex: 0 0 48px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-pack: distribute;
        justify-content: space-around;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        background: #fff;
        box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 375px;
        bottom: 0;
        height: 49px;
		z-index: 4;
    }

    #app .footer .footer_item {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        cursor: pointer;
        color: #999999;
        width: 60px;
    }

    #app .footer .footer_item .footer_icon {
        display: inline-block;
        width: 26px;
        height: 26px;
        background-repeat: no-repeat;
        background-size: contain;
        background-position: center;
        margin-bottom: 6px;
    }

    #app .footer .footer_item .footer_icon.footer_icon_home {
        background-image: url(./views/images/common/home.png);
    }

    #app .footer .footer_item .footer_icon.footer_icon_task {
        background-image: url(./views/images/common/task.png);
    }

    #app .footer .footer_item .footer_icon.footer_icon_cart {
        background-image: url(./views/images/common/cart.png);
    }

    #app .footer .footer_item .footer_icon.footer_icon_user {
        background-image: url(./views/images/common/user.png);
    }

    #app .footer .footer_item .footer_info {
        font-size: 12px;
    }

    #app .footer .footer_item.footer_item_active {
        color: #E3382E;
    }

    #app .footer .footer_item.footer_item_active .footer_icon.footer_icon_home {
        background-image: url(./views/images/common/home_cur.png);
    }

    #app .footer .footer_item.footer_item_active .footer_icon.footer_icon_task {
        background-image: url(./views/images/common/task_cur.png);
    }

    #app .footer .footer_item.footer_item_active .footer_icon.footer_icon_cart {
        background-image: url(./views/images/common/cart_cur.png);
    }

    #app .footer .footer_item.footer_item_active .footer_icon.footer_icon_user {
        background-image: url(./views/images/common/user_cur.png);
    }

    .red_top_bg {
        width: 100%;
        height: 44px;
        max-width: 375px;
        margin: 0 auto;
        background: url(./assets/images/red_bg.png) no-repeat center center;
        background-size: 100% 100%;
        overflow: hidden;
    }

    .top_right {
        position: absolute;
        font-size: 13px;
        line-height: 18px;
        color: #FFFFFF;
        top: 16px;
        right: 14px;
    }

    .limit {
        height: 20px;
        line-height: 20px;
        border-radius: 10px;
        background: rgba(241, 34, 17, 0.08);
        color: #f12211;
        text-align: center;
        padding: 0 7px;
        border: 1px solid #f12211;
        font-size: 12px;
    }

    .gray_btn {
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

    .big_tit {
        position: absolute;
        height: 25px;
        font-size: 18px;
        font-weight: 500;
        color: rgba(255, 255, 255, 1);
        line-height: 25px;
        top: 12px;
        left: 50%;
        transform: translateX(-50%);
    }

    .sub_btn {
        background: linear-gradient(123deg,#e3382e,#ff4d15);
        height: 36px;
        line-height: 36px;
        font-size: 12px;
        color: #FFFFFF;
        text-align: center;
        width: 94px;
        border-radius: 18px;
    }

    .remove_btn {
        background: linear-gradient(117deg, rgba(254, 166, 0, 1) 0%, rgba(255, 188, 0, 1) 100%);
        height: 36px;
        line-height: 36px;
        font-size: 12px;
        color: #FFFFFF;
        text-align: center;
        width: 94px;
        border-radius: 18px;
    }

    .home_tit {
        width: 100%;
        height: 22px;
        line-height: 22px;
        display: flex;
        align-items: center;
        justify-content: center;

        .line {
            width: 75px;
            height: 2px;
        }

        h5 {
            font-size: 16px;
            line-height: 22px;
            color: #000000;
            margin: 0 10px;
            font-weight: bold;
        }

        .l1 {
            background: url(./views/images/index/l1.png) no-repeat center center;
            background-size: 100% 100%;
        }

        .l2 {
            background: url(./views/images/index/l2.png) no-repeat center center;
            background-size: 100% 100%;
        }
    }

    .van-popup {
        max-width: 375px;
        margin: 0 auto;
        right: 0;
    }

    .back_left {
        width: 20px;
        height: 20px;
        background: url(./views/images/item/back.png) no-repeat center center;
        background-size: auto 100%;
        margin: 12px 0 0 8px;
    }

    .basic_btn {
        height: 45px;
        line-height: 45px;
        font-size: 16px;
        width: 335px;
        background: linear-gradient(90deg, rgba(228, 57, 46, 1) 0%, rgba(255, 77, 22, 1) 100%);
        border-radius: 23px;
        color: #FFFFFF;
        text-align: center;
    }

    .basic_btn.no_touch {
        color: rgba(255, 255, 255, 0.5);
    }

    .flex_center {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .wrap_box {
        width: 375px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
    }

    .eye_bi {
        width: 21px;
        height: 25px;
        background: url(./views/images/user/eye2.png) no-repeat center center;
        background-size: 100% auto;

        &.eye {
            background: url(./views/images/user/eye1.png) no-repeat center center;
            background-size: 100% auto;
        }
    }

    .real_name_mask {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 30;
        background-color: rgba(0, 0, 0, 0.95);

        .real_box {
            width: 272px;
            height: 185px;
            background: rgba(255, 255, 255, 1);
            border-radius: 8px;
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            margin: -92px auto 0 auto;

            .tit {
                width: 77px;
                height: 67px;
                position: absolute;
                top: -35px;
                left: 50%;
                transform: translateX(-50%);
                background: url(./views/images/user/tit.png) no-repeat center center;
                background-size: 100% 100%;
            }

            .tips {
                width: 185px;
                height: 50px;
                text-align: center;
                font-size: 18px;
                color: #000000;
                line-height: 25px;
                position: absolute;
                top: 49px;
                left: 50%;
                transform: translateX(-50%);
            }

            .basic_btn {
                width: 225px;
                position: absolute;
                left: 0;
                right: 0;
                margin: 0 auto;
                bottom: 15px;
            }
        }
    }
    .contract_box img{
        width: 100%;
    }
</style>
