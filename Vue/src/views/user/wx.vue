<template>
    <div class="alipay_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.push('/user')"></div>
            <div class="big_tit">账户充值</div>
        </div>
        <div class="code_box">
            <img class="qrcode" :src="data.image" alt="" />
            <p>金额：{{money}}</p>
        </div>
        <div class="warming">
            <p class="tit">充值说明：</p>
            <div class="content">{{data.content}}</div>
        </div>
        <!-- <div class="basic_btn" @click="submitBtn">完成</div> -->
    </div>
</template>

<script>
    import Fetch from '../../utils/fetch'

    export default {
        name: "wx",
        data() {
            return {
                data: {},
                money: 0,
            };
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            this.money = this.$route.query.money;
            this.start();
        },
        methods: {
            start() {
            	Fetch('/user/recharge_type', {
            		money: this.$route.query.money ? this.$route.query.money : "",
            		type: 'wx'
            	}).then((r) => {
            		this.data = r.data;
            	});
            },
            submitBtn(){
                Fetch('/user/invest/apply', {
                	money: this.$route.query.money ? this.$route.query.money : "",
                	channel: 'wx'
                }).then((r) => {
                	if(r.code == 200){
                        this.$toast({
                        	background: '#07c160',
                        	message: '充值申请提交成功'
                        });
                        this.$router.replace('/moneybag');
                        
                    }
                });
            }
        }
    };
</script>

<style lang="less" scoped>
    .code_box {
        width: 375px;
        height: 258px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        margin-top: 12px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        img {
            width: 158px;
            height: 158px;
        }

        p {
            font-size: 15px;
            line-height: 21px;
            color: #000;
            font-weight: bold;
            margin-top: 13px;
        }
    }

    .warming {
        margin-top: 17px;
        padding: 0 14px;

        .tit {
            font-size: 14px;
            color: rgba(0,0,0,.8);
            line-height: 20px;
            font-weight: bold;
        }

        .content {
            font-size: 12px;
            color: rgba(0,0,0,.6);
            line-height: 17px;
            margin-top: 9px;
        }
    }

    .basic_btn {
        margin: 30px auto 0 auto;
    }
</style>
