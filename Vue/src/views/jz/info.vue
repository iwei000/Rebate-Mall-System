<template>
    <div class="basic_wrap">
        <bsHeader :title="data.title"></bsHeader>
        <div class="reset_box" v-show="!show_down">
            <div class="show_icon" @click="ex_show = true"></div>
            <div class="share_ctn wrap_box" v-if="data.content">
                <p class="title">示例文案</p>
				<p class="info" v-html="data.content"></p>
                <!-- <p class="info">1.点击下方立即分享，复制文字和保存图片到手机相册</p>
                <p class="info">2.分享示例，可参考上方示例</p>
                <p class="info">3.截图已分享的图片，点击上传截图，把图片上传，等待官方审核</p>
                <p class="info">*本活动最终解释权归属官方所有*</p> -->
            </div>
            <div class="wrap_box award">
                <p class="title">奖励介绍</p>
                <div class="award_box">
                    <div class="left_info">
                        <div class="award_num">
                            <p><span>¥</span>{{data.money}}</p>
                        </div>
                        <p class="name">红包</p>
                    </div>
                    <div class="right_detail">
                        <p class="award_tit">现金奖励</p>
                        <p class="tips">直接发放至账户余额</p>
                    </div>
                </div>
            </div>
            <div class="wrap_box btn_box">
                <button type="button" class="btn btn_red" @click="showDown">立即分享</button>
                <button type="button" class="btn btn_load" @click="showDown">上传图片</button>
                <van-uploader class="upload" :max-size="2 * 1024 * 1024" @oversize="onOversize" :after-read="afterRead"
                    :before-read="beforeRead">
                    <van-button class="file" type="primary"></van-button>
                </van-uploader>
            </div>
        </div>
        <!-- 分享保存 -->
        <div class="share_box" v-show="show_down">
            <div class="wrap_box">
                <div class="share_ctn wrap_box">
                    <p class="title">示例文案</p>
                    <p class="info" v-html="data.content"></p>
                    <img :src="data.down_image" class="down_img" alt="">
                </div>
            </div>
            <div class="basic_btn down_btn" @click="downLoad" v-clipboard="() => data.content" v-clipboard:success="copy">一键保存</div>
            <div class="tips_mask mask" v-show="mask_show">
                <div class="tips_inner">
                    <p>1、复制文案内容</p>
                    <p>2、保存海报</p>
                    <div class="basic_btn sure_btn" @click="mask_show = false">好的</div>
                </div>
            </div>
        </div>

        <!-- 选择数量 -->
        <van-popup v-model="ex_show" closeable close-icon="close" round position="bottom">
            <p class="share_title">分享示例</p>
            <img class="share_img" :src="data.share" />
        </van-popup>
    </div>
</template>

<script>
    import Vue from 'vue';
    import Fetch from '../../utils/fetch';
    import bsHeader from '../../components/bsHeader.vue'
    import Clipboard from 'v-clipboard';
    import {
        Popup
    } from 'vant';

    Vue.use(Popup).use(Clipboard);
    import {
        Overlay
    } from 'vant';
    import {
        Uploader
    } from 'vant';
    import {
        Button
    } from 'vant';
    import axios from 'axios'

    Vue.use(Overlay).use(Uploader).use(Button);

    export default {
        name: "jz",
        data() {
            return {
                data: {},
                mask_show: false,
                ex_show: false,
                show_down: false,
                timer: null
            };
        },
        components: {
            bsHeader
        },
        created() {
            this.$parent.footer('jz', false);
        },
        mounted() {
            this.timer = null;
            this.start();
        },
        methods: {
            downLoad() {
                this.mask_show = true;
                var that = this;
                var local = window.location.origin;
                var url = local + this.data.down_image;
                
                /* jsBridge.saveImageToAlbum(url, function(succ) {
                    that.$toast(succ ? "保存成功" : "保存失败：下载失败或没有相册使用权限");
                }); */
                this.downloadIamge(this.data.down_image, 'share')
            },
            downloadIamge(imgsrc, name) {
                var image = new Image();
                image.setAttribute("crossOrigin", "anonymous");
                image.onload = function() {
                    var canvas = document.createElement("canvas");
                    canvas.width = image.width;
                    canvas.height = image.height;
                    var context = canvas.getContext("2d");
                    context.drawImage(image, 0, 0, image.width, image.height);
                    var url = canvas.toDataURL("image/png");

                    var a = document.createElement("a");
                    var event = new MouseEvent("click");
                    a.download = name || "photo";
                    a.href = url;
                    a.dispatchEvent(event);
                };
                image.src = imgsrc;
            },
            copy() {
                this.$toast({
                    background: '#07c160',
                    message: '复制成功'
                })
            },
            showDown() {
                this.show_down = true;
            },
            downLoadImg() {
                this.mask_show = true;

            },
            start() {
                Fetch('/index/share_view', {
                    id: this.$router.history.current.params.id
                }).then((r) => {
                    this.data = r.data;
                });
            },
            onOversize(file) {
                this.$toast('请上传2M以内的图片');
            },
            beforeRead(file) {
                if (file.type !== 'image/jpeg' && file.type !== 'image/png') {
                    this.$toast('只支持jpg,png图片上传');
                    return false;
                }
                return true;
            },
            afterRead(file) {

                let formData = new FormData();
                formData.append('file', file.file);
                formData.append('id', this.$router.history.current.params.id);
				formData.append('token', localStorage.getItem('token'));
                axios.post("http://shop.test/api/index/share_upload", formData).then((r) => {
                    if (r.data.code === 1) {
                        this.$toast('上传成功');
                    } else {
                        if (r.data.info) {
                            this.$toast(r.data.info);
                        } else {
                            this.$toast('上传失败');
                        }
                    }
                });
            }
        }
    };
</script>

<style lang="less" scoped>
    .mask {
        position: fixed;
        z-index: 5;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.6);
    }

    .tips_inner {
        width: 272px;
        height: 185px;
        background: rgba(255, 255, 255, 1);
        border-radius: 8px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -92px;
        margin-left: -136px;
        padding: 28px 28px 15px 28px;

        p {
            line-height: 25px;
            color: #000000;
            position: relative;
            font-size: 18px;
            margin-bottom: 14px;

            &::after {
                content: '';
                width: 17px;
                height: 17px;
                background: url(../images/sign/dui.png) no-repeat center center;
                background-size: 100% 100%;
                position: absolute;
                right: 0px;
                top: 4px;
            }
        }

        .sure_btn {
            width: 100%;
            margin: 33px auto 0 auto;
        }
    }

    .reset_box {
        position: relative;
        z-index: 1;
    }

    .down_btn {
        display: block;
        margin: 46px auto 0 auto;
    }

    .share_box {
        position: relative;
        z-index: 3;
    }

    .share_ctn {
        padding: 16px 12px 22px 12px;
        margin-top: 12px;

        .title {
            font-size: 14px;
            line-height: 20px;
            font-weight: bold;
        }

        .info {
            font-size: 13px;
            line-height: 18px;
            color: rgba(0,0,0,.6);
            margin-top: 8px;
			white-space: pre-line;
        }
    }

    .award {
        margin-top: 12px;
        padding: 7px 11px 11px 11px;

        .title {
            font-size: 14px;
            line-height: 20px;
            font-weight: bold;
            margin-left: 2px;
        }

        .award_box {
            width: 353px;
            height: 92px;
            background: url(../images/sign/award.png) no-repeat center center;
            background-size: 100% 100%;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-top: 17px;

            .left_info {
                width: 114px;
                height: 100%;

                .award_num {
                    line-height: 42px;
                    font-size: 37px;
                    color: #fff;
                    text-align: center;
                    margin-top: 15px;

                    span {
                        font-size: 18px;
                    }
                }

                .name {
                    font-size: 12px;
                    color: #fff;
                    left: 17px;
                    margin-top: 3px;
                    text-align: center;
                }
            }

            .right_detail {
                flex: 1;
                margin-left: 10px;
                color: rgba(0,0,0,.8);

                .award_tit {
                    font-size: 16px;
                    line-height: 22px;
                    font-weight: bold;
                    margin-top: 15px;
                }

                .tips {
                    font-size: 12px;
                    line-height: 14px;
                    margin-top: 9px;
                }
            }
        }
    }

    .btn_box {
        height: 52px;
        display: flex;
        padding: 0 31px;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        z-index: 2;
        bottom: 0;
        left: 0;

        .btn_red {
            width: 140px;
            height: 35px;
            background-color: #FD4B16;
            border-radius: 35px;
            line-height: 35px;
            font-size: 12px;
            color: #FFFFFF;
            text-align: center;
        }

        .btn_load {
            width: 140px;
            height: 35px;
            position: absolute;
            top: 8px;
            right: 30px;
            pointer-events: none;
            z-index: 20;
            border-radius: 35px;
            background-color: #FEA600;
            line-height: 35px;
            font-size: 12px;
            color: #FFFFFF;
            text-align: center;
        }

        /deep/ .van-uploader {
            width: 140px;
            height: 35px;
            border: none;
        }

        /deep/ .van-button--primary {
            background-color: transparent;
            border: none;
            width: 100%;
        }
    }

    .show_icon {
        width: 67px;
        height: 67px;
        position: absolute;
        top: -40px;
        right: 9px;
        background: url(../images/sign/show.png) no-repeat center center;
        background-size: 100% 100%;
    }

    .basic_wrap {
        position: relative;
    }

    /deep/ .van-uploader__input-wrapper {
        width: 100%;
    }

    /deep/ .van-popup--bottom.van-popup--round {
        border-radius: 6px 6px 0 0;
        height: 564px;
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

    .share_title {
        line-height: 20px;
        font-size: 18px;
        color: rgba(0,0,0,.8);
        margin-top: 13px;
        text-align: center;
    }

    .share_img {
        width: 100%;
        margin-top: 14px;
    }

    .down_img {
        display: block;
        width: 165px;
        height: 249px;
        margin: 10px auto 0 auto;
    }
</style>
