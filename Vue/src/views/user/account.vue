<template>
    <div class="recharge_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.replace('/cash')"></div>
            <div class="big_tit">账户管理</div>
        </div>
        <div class="wrap_box warp1">
            <p>当前共有 <span>{{allNum}}</span> 个绑定的提现账户</p>
        </div>
        <div class="wrap_box warp2">
            <div class="item" v-for="i in data.bank">
                <img src="../images/user/bank.png" alt="">
                <div class="item_name ari_font">{{i.bank}}</div>
                <div class="item_detail">
                    <p class="user_name ari_font">{{i.name}}</p>
                    <p class="user_num">{{i.account}}</p>
                </div>
                <div class="del" @click="delCard(i.id)"></div>
            </div>
        </div>
        <div class="basic_btn" @click="$router.push('/addcount')" v-if="allNum <= 0">新增绑定账户</div>
    </div>
</template>

<script>
    import Fetch from '../../utils/fetch'


    export default {
        name: "account",
        data() {
            return {
                allNum:0,
                data: {}
            };
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            this.start();
        },
        methods: {
            delCard(id){
                Fetch('/user/bank_remove', {id: id}).then(() => {
                    this.start()
                });
            },
            start(){
                Fetch('/user/my_bank').then(r=>{
                    console.log(r);
                    this.data = r.data;
                    this.allNum = r.data.count;
                })
            }
        }
    };
</script>

<style lang="less" scoped>
    .red_top_bg {
        position: relative;
    }

    .warp1 {
        padding: 0 20px;
        height: 40px;

        p {
            font-size: 14px;
            line-height: 40px;
            color: rgba(0,0,0,.8);
            font-weight: bold;

            span {
                color: #F03041;
            }
        }
    }

    .ari_font {
        height: 20px;
        font-size: 14px;
        font-weight: 600;
        color: rgba(0,0,0,.8);
        line-height: 20px;
    }

    .warp2 {
        padding: 0 9px;
        margin-top: 12px;

        .item {
            padding: 14px 0 11px 0;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            border-bottom: 1px solid #ECECEC;

            &:last-child {
                border-bottom: none;
            }

            img {
                width: 52px;
                height: 52px;
            }

            .item_name {
                width: 65px;
            }

            .user_num {
                height: 17px;
                font-size: 12px;
                font-weight: 600;
                color: rgba(0,0,0,.6);
                line-height: 17px;
                margin-top: 10px;
            }

            .del {
                width: 20px;
                height: 20px;
                background: url(../images/item/del.png) no-repeat center center;
                background-size: 100% 100%;
                margin: 0 8px 0 auto;
            }
        }
    }

    .basic_btn {
        margin: 75px auto 0 auto;
    }
</style>
