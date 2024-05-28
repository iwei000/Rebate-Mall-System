<template>
    <div class="withdraw_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.replace('/user')"></div>
            <div class="big_tit">账户提现</div>
            <p class="top_right" @click="$router.push('/account')">账户管理</p>
        </div>
        <div class="wrap_box wrap1">
            <div class="canal rela" v-if="showbank">
                <div class="title">提现渠道：</div>
                <van-dropdown-menu :overlay="false">
                    <van-dropdown-item v-model="value" @change="chooseBank" :options="option" />
                </van-dropdown-menu>
            </div>
            <div class="canal" v-if="showbank">
                <div class="title">提现账户：</div>
                <van-dropdown-menu :overlay="false">
                    <van-dropdown-item v-model="account" :disabled="true" :options="account_option" />
                </van-dropdown-menu>
            </div>
            <div class="canal" v-if="!showbank">
                <div class="title">提现账户：</div>
                <div class="not_bd">未绑定提现账户</div>
                <div class="all_canal" @click="$router.push('/addcount')">去绑定</div>
            </div>
            <div class="canal_money">
                <div class="title">提现金额</div>
                <input type="number" v-model="form.money" :placeholder="`可提现金额${data.money}`">
                <div class="all_canal" @click="subAll">全部提现</div>
            </div>
            <div class="canal_money">
                <div class="title">提现密码</div>
                <div class="showkey" @click="write_psd = true">
                    <input type="password" :disabled="true" v-model="form.password" placeholder="请输入提现密码">
                </div>
            </div>
            <p class="canal_tips">提现由银联系统自动审核处理，预计到账时间30分钟内，请耐心等待！!</p>
        </div>
        <div class="wrap_box wrap2" v-if="listLength!=0">
            <div class="tit">审核中的银行卡提现申请</div>
            <div class="item" v-for="item in searchData.list">
                <div class="bank_info">
                    <p class="bank_num">{{item.bank_name}} {{item.bank_card}}</p>
                    <p class="tx_time">{{item.uptime_date}}</p>
                </div>
                <div class="tx_number">-¥{{item.money}}</div>
            </div>
        </div>
        <div class="basic_btn" @click="submit">提交</div>
        <van-popup v-model="write_psd" closeable close-icon="close" round position="bottom">
            <div class="psw_box">
                <van-password-input :value="psd_val" :mask="true" :focused="showKeyboard" @focus="showKeyboard = true" />
                <div class="keybord_box">
                    <div class="keybord">
                        <div class="key_item" v-for="i in 9" @click="onInput(i)">
                            <div class="key_inner">{{i}}</div>
                        </div>
                        <div class="key_item no_bg">
                            <div class="key_inner"></div>
                        </div>
                        <div class="key_item" @click="onInput(0)">
                            <div class="key_inner">0</div>
                        </div>
                        <div class="key_item no_bg x" @click="onDelete">
                            <div class="key_inner">x</div>
                        </div>
                    </div>
                </div>
            </div>
        </van-popup>
    </div>
</template>

<script>
    import Vue from 'vue';
    import Fetch from '../../utils/fetch'
    import {
        DropdownMenu,
        DropdownItem
    } from 'vant';

    import {
        Popup
    } from 'vant';
    import {
        PasswordInput,
        NumberKeyboard
    } from 'vant';

    Vue.use(PasswordInput);
    Vue.use(NumberKeyboard);
    Vue.use(Popup)
    Vue.use(DropdownMenu).use(DropdownItem);

    export default {
        name: "cost",
        data() {
            return {
                data: {},
                showKeyboard: true,
                write_psd: false,
                psd_val: '',
                form: {
                    money: '',
                    password: '',
                    bank_id: 0,
                },
                searchData: {},
                listLength: 0,
                showbank: true,
                value: -1,
                account: -1,
                bankList: [],
                option: [],
                account_option: [{
                    text: '请先选择提现账户',
                    value: -1
                }],
            };
        },
        created() {
            this.$parent.footer('user', false);
        },
        mounted() {
            this.start();
            /* Fetch('/user/cash/search').then(r => {
                this.searchData = r.data
                this.listLength = r.data.list.length;
            }) */
        },
        methods: {
            onConfirm() {
                this.$refs.item.toggle();
            },
            onInput(key) {
                this.psd_val = (this.psd_val + key).slice(0, 6);
                if (this.psd_val.length == 6) {
                    this.form.password = this.psd_val;
                    this.write_psd = false;
                }
            },
            onDelete() {
                this.psd_val = this.psd_val.slice(0, this.psd_val.length - 1);
            },
            chooseBank(val) {
                console.log(val);
                this.form.bank_id = val;

                this.bankList.forEach(item => {
                    if (val == item.id) {
                        console.log(item);
                        this.account = item.id;
                        this.account_option = [{
                            text: item.account,
                            value: item.id
                        }]
                    }
                })
            },
            subAll() {
                this.form.money = this.data.money;
            },
            start() {
                Fetch('/user/my_bank').then((r) => {
                    this.data = r.data;
                    if (this.data.bank.length == 0) {
                        this.showbank = false;
                    } else {
                        this.showbank = true;
                    }
                    var bankvalue = [];
                    this.bankList = r.data.bank;
                    r.data.bank.forEach(item => {
                        bankvalue.push({
                            text: item.bank,
                            value: item.id
                        })
                    })

                    bankvalue.unshift({
                        text: '请选择提现账户',
                        value: -1
                    })

                    this.option = bankvalue;
                });
            },
            submit() {

                if (!this.form.money) {
                    this.$toast('提现金额不能为空');
                    return false;
                }
                if(this.form.money < 0){
                    this.$toast('提现金额不能为负数');
                    return false;
                }

                if (!this.form.password) {
                    this.$toast('提现密码不能为空');
                    return false;
                }
                if (this.form.bank_id == 0 || this.form.bank_id == -1) {
                    this.$toast('请选择提现账户');
                    return false;
                }


                Fetch('/user/cost_apply', {
                    money: this.form.money,
                    bank_id: this.form.bank_id,
                    passwd: this.form.password
                }).then(() => {

                    this.$toast({
                        background: '#07c160',
                        message: '提现申请成功'
                    });

                    this.$router.replace('/user')
                });
            },
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
        display: none;
    }

    .rela /deep/ .van-dropdown-menu__title::after {
        display: block;
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

    .top_right {
        position: absolute;
        font-size: 13px;
        line-height: 18px;
        color: #FFFFFF;
        top: 16px;
        right: 14px;
    }

    .wrap1 {
        margin-top: 12px;
    }

    .wrap2 {
        margin-top: 3px;
    }

    .canal,
    .canal_money {
        padding: 0 16px;
        display: flex;
        justify-content: flex-start;
        align-items: center;

        .title {
            font-size: 14px;
            color: rgba(0,0,0,.8);
            line-height: 20px;
            font-weight: bold;
            width: 70px;
            word-break: keep-all;
            white-space: nowrap;
        }
    }

    .canal {
        height: 50px;

        .not_bd {
            flex: 1;
            height: 20px;
            line-height: 20px;
            font-size: 14px;
            color: rgba(0, 0, 0, 0.4);
        }
    }

    .canal_money {
        height: 75px;

        .showkey,
        input {
            flex: 1;
            height: 20px;
            line-height: 20px;
            font-size: 14px;
        }
    }

    .all_canal {
        font-size: 12px;
        line-height: 17px;
        color: #3D96FF;
        margin-left: 10px;
    }

    .canal_tips {
        padding: 10px 16px 14px 16px;
        line-height: 17px;
        font-size: 12px;
        color: #f12211;
        border-top: 1px solid #ECECEC;
    }

    .wrap2 {
        .tit {
            height: 45px;
            border-bottom: 1px solid #ECECEC;
            font-size: 14px;
            padding: 0 15px;
            line-height: 20px;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        .item {
            padding: 10px 15px 13px 15px;
            border-bottom: 1px solid #ECECEC;
            display: flex;
            align-items: center;
            justify-content: flex-start;

            &:last-child {
                border-bottom: none;
            }

            .bank_icon {
                width: 52px;
                height: 52px;

                img {
                    width: 100%;
                    height: 100%;
                }
            }

            .bank_info {
                width: 195px;

                .bank_num {
                    line-height: 20px;
                    font-size: 14px;
                    font-weight: bold;
                    color: rgba(0,0,0,.8);
                }

                .tx_time {
                    font-size: 12px;
                    line-height: 17px;
                    color: rgba(0,0,0,.6);
                    margin-top: 10px;
                }
            }

            .tx_number {
                margin-left: auto;
                font-size: 20px;
                line-height: 28px;
                color: rgba(0,0,0,.8);
                font-weight: bold;
            }
        }
    }

    .basic_btn {
        margin: 53px auto 0 auto;
    }

    /deep/ .van-password-input {
        margin: 50px 28px 0 28px;
    }

    /deep/ .van-hairline--left::after {
        border: 1px solid #ECECEC;
    }

    .van-password-input .van-password-input__security::after {
        border-radius: 0;
    }

    .keybord_box {
        height: 250px;
        background-color: #F0F0F0;
        margin-top: 35px;
        padding: 24px 12px 0 12px;

        .keybord {
            width: 361px;
            margin: 24px auto 0 atuo;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            text-align: center;

            .key_item {
                width: 115px;
                height: 44px;
                line-height: 44px;
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 6px;
                background: rgba(255, 255, 255, 1);
                border-radius: 3px;

                &.no_bg {
                    background: none;
                }

                &.x {
                    color: #757880;
                    font-weight: bold;
                }
            }
        }
    }
</style>
