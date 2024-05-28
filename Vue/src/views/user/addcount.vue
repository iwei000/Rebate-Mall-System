<template>
    <div class="recharge_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.push('/cash')"></div>
            <div class="big_tit">新增绑定账户</div>
        </div>
        <div class="wrap_box warp1">
            <div class="item">
                <div class="ari_font">银　　行：</div>
                <input type="text" v-model="bank.bank" placeholder="请输入银行名称">
            </div>
			<div class="item">
			    <div class="ari_font">支　　行：</div>
			    <input type="text" v-model="bank.area" placeholder="请输入支行名称">
			</div>
            <div class="item">
                <div class="ari_font">卡　　号：</div>
                <input type="text" v-model="bank.card" placeholder="请输入储蓄卡号">
            </div>
        </div>
        <div class="basic_btn" @click="submitBtn">保存</div>
    </div>
</template>

<script>
    import Vue from 'vue';
    import Fetch from '../../utils/fetch'

    export default {
        name: "account",
        data() {
            return {
                bank: {
                    card: '',
                    area: '',
                    bank:'',
                },
            };
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            this.start();
        },
        methods: {
            submitBtn(){
				if (!this.bank.bank.replace(/\s/g, "")) {
				    this.$notify("请输入银行名称");
				    return;
				}
				if (!this.bank.card.replace(/\s/g, "")) {
				    this.$notify("请输入银行卡号");
				    return;
				}
                Fetch('/user/bank_add',{
                    ...this.bank
                }).then(r=>{
                    this.$toast({
                    	background: '#07c160',
                    	message: '添加成功'
                    });
                    this.$router.push('/account');
                })
                
            },
            start(){}
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
        width: 211px;
        height: 34px;
        border: 1px solid #D9D9D9;
        border-radius: 4px;
        text-align: left;
    }

    /deep/ .van-dropdown-item--down {
        width: 211px;
        margin: 0 auto;
        z-index: 12;
        transform: translateX(4px);
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

    .rela {
        position: relative;
        z-index: 11;
    }

    .warp1 {
        margin-top: 12px;

        .item {
            height: 50px;
            padding: 0 16px;
            font-size: 14px;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            border-bottom: 1px solid #ECECEC;

            &:last-child {
                border-bottom: none;
            }

            input {
                line-height: 14px;
            }
        }
    }

    .ari_font {
        width: 70px;
        word-break: keep-all;
        white-space: nowrap;
        height: 20px;
        font-size: 14px;
        font-weight: 600;
        color: rgba(0,0,0,.8);
        line-height: 20px;
    }

    .basic_btn {
        margin: 75px auto 0 auto;
    }
</style>
