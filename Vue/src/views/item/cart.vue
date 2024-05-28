<template>
    <div class="basic_wrap">
        <bsHeader title="购物车"></bsHeader>
        <div class="no_item" v-show="no_shop">
            <img src="../images/item/nocart.png" alt="">
            <p>购物车中还没有任何物品</p>
        </div>
        <div class="cart_detail" v-show="!no_shop">
            <div class="shop_num_box" v-show="set_shop_btn">
                <p class="num">共 {{data.count}} 种产品</p>
                <div class="set_shop" v-if="hide_remove" @click="cart_set('set')">管理</div>
                <div class="set_shop" v-if="!hide_remove" @click="cart_set('ok')">完成</div>
            </div>
            <div class="cart_shop" v-show="set_shop_btn">
                <div class="cart_list" v-for="i,j in shop" :key="j" :class="i.item_num == 0?notouch:''">
                    <count v-if="i.show_seckill && i.seckill.status == 2" :status="i.seckill.status" :show_seckill="i.show_seckill"
                        :second="i.seckill.rest_second">结束</count>
                    <count v-if="i.show_seckill && i.seckill.status == 1" :status="i.seckill.status" :show_seckill="i.show_seckill"
                        :second="i.seckill.stime_second">后开始</count>
                    <div class="item_center">
                        <div class="left_check" :class="i.stock <= 0?notouch:''">
                            <div class="check_box" @click="checkit(i.id)" :class="i.check?'ischeck':''"></div>
                        </div>
                        <div class="right_detail">
                            <div class="item_img" @click="$router.push('/details/'+i.item_id)">
                                <img :src="i.img" alt="">
                            </div>
                            <div class="item_box">
                                <p class="item_tit van-multi-ellipsis--l2" @click="$router.push('/details/'+i.item_id)">{{i.title}}</p>
                                <p class="norms" v-if="i.stock <= 0">库存不足</p>
                                <div class="item_price">
                                    <div class="price" v-if="i.is_special" v-html="'¥'+$parent.bigNumeber(i.special_price-i.discount)"></div>
                                    <div class="price" v-else v-html="'¥'+$parent.bigNumeber(i.min-i.discount)"></div>
                                    <div class="old_price" v-if="i.discount > 0">¥{{i.min}}</div>

                                    <div class="cut_num">
                                        <div class="cut cut_del" @click="del(i.id)">-</div>
                                        <input type="number" @input="inpChange(i.id)" v-model="i.number">
                                        <div class="cut cut_add" @click="add(i.id)">+</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="hot_box">
            <div class="home_tit">
                <div class="line l1"></div>
                <h5>精选热卖</h5>
                <div class="line l2"></div>
            </div>
            <div class="hot_list">
                <div class="item" v-for="item in salesItem" @click="$router.push('/details/'+item.id)">
                    <img :src="item.img" alt="">
                    <p class="hot_tit van-multi-ellipsis--l2">{{item.title}}</p>
                    <p class="hot_prize">¥{{item.min}}</p>
                </div>
            </div>
        </div>
        <div id="cart_foot" v-show="show_footer">
            <div class="cart_footer" v-show="hide_remove">
                <div class="check_all_box">
                    <div class="left_check">
                        <div class="check_box" @click="checkAll" :class="check_all?'ischeck':''"></div>
                        全选
                    </div>
                    <div class="all_price">
                        <p class="sum_box">
                            <span class="sum_tit">合计</span>
                            <span class="sum_price">¥{{payData.actual_money}}</span>
                        </p>
                        <p class="sale_money">
                            <span>总额:</span>
                            <span>￥{{payData.total_money}}</span>
                            <span>优惠减:</span>
                            <span>￥{{payData.discount_money}}</span>
                        </p>
                    </div>
                    <div class="sub_btn" @click="submitShop">提交订单</div>
                </div>
            </div>
            <div class="cart_footer_set" v-show="!hide_remove">
                <div class="check_all_box">
                    <div class="left_check">
                        <div class="check_box" @click="checkAll" :class="check_all?'ischeck':''"></div>
                        全选
                    </div>
                    <div class="remove_btn" @click="removeShop">移除</div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import Fetch from '../../utils/fetch';
    import bsHeader from '../../components/bsHeader.vue';
    import count from '../../components/count.vue';

    export default {
        name: "item",
        data() {
            return {
                data: {},
                hide_remove: true,
                show_footer: false,
                check_all: false,
                no_shop: false,
                set_shop_btn: true,
                salesItem: {},
                shop: [],
                payData: {},
                notouch: {"pointer-events": "none"},
                now: true,
                isSet: false
            }
        },
        watch: {
            'shop.length': {
                handler(newValue, oldValue) {
                    if (newValue == 0) {
                        this.no_shop = true;
                        this.hide_remove = false;
                        this.show_footer = false;
                        this.set_shop_btn = false;
                        this.$parent.footer('cart', true);
                    }
                }
            }
        },
        components: {
            bsHeader,
            count
        },
        created() {
            this.$parent.footer('cart');
        },
        mounted() {
            // 精选热卖
            Fetch('/index/hot_sales', {
                page: 1
            }, {
                method: 'get'
            }).then(r => {
                this.salesItem = r.data;
            });

            this.start();
        },
        methods: {
            start() {
                Fetch('/user/cart', {}, {
                    method: 'get'
                }).then(r => {
                    var itemList = [];
                    r.data.list.forEach(item => {
                        itemList.push({
                            check: false,
                            ...item
                        });
                    })
                    this.data = r.data;
                    this.shop = itemList;
                    this.shop.length == 0 ? this.no_shop = true : this.no_shop = false;
                    this.show_footer = false;
                    this.$parent.footer('cart', true);
                })
            },
            submitShop() {
                // var check = this.shop.filter((item) => {
                //     return item.check
                // })
                this.$router.push('/confirm');
            },
            cart_set(t) {
                if (t == 'set') {
                    this.hide_remove = false;
                    this.show_footer = true;
                    this.$parent.footer('cart', false);
                    this.notouch = {"pointer": "none"};
                    this.isSet = true;
                    
                } else {
                    this.hide_remove = true;
                    this.isSet = false;
                    this.shop.forEach(item=>{
                        if(item.status == 'N'){
                            item.check = false;
                        }
                    })
                    this.computedPrice();
                    this.notouch = {"pointer-events": "none"}
                    if (this.shop.some((item) => item.check)) {
                        this.show_footer = true;
                        this.$parent.footer('cart', false);
                    } else {
                        this.show_footer = false;
                        this.$parent.footer('cart', true);
                    }

                }
            },
            shopIndex(id) {
                var idx = 0;
                this.shop.forEach((item, index) => {
                    if (item.id == id) {
                        idx = index
                    }
                });
                return idx;
            },
            removeShop() {
                var all = this.shop.some((item, index) => {
                    return item.check == true
                });
                if (!all) {
                    this.$toast('请选择商品');
                    return;
                }
                this.$dialog.confirm({
                        message: '确认删除订单？',
                    })
                    .then(() => {
                        var str = "";
                        this.shop.forEach(item => {
                            if (item.check) {
                                str += ',' + item.id;
                            }
                        });
                        str = str.substring(1);
                        Fetch('/user/cart_del', {
                            ids: str,
                        }).then(r => {
                            this.start();
                        })
                        this.shop = new_list;
                    })
                    .catch(() => {

                    });


            },
            checkit(id) {
                this.shop[this.shopIndex(id)].check = !this.shop[this.shopIndex(id)].check;
                if (this.hide_remove) {
                    this.accHandle();
                }
                this.isCheckAll();
                this.computedPrice();
                
            },
            computedPrice() {
                var checkShop = this.shop.filter((item) => {
                    return item.check
                });
                var items = [];
                checkShop.forEach(i => {
                    if(i.stock > 0){
                        items.push({
                            item_id: i.item_id,
                            num: i.number,
                        })
                    }
                    
                })

                Fetch('/user/cart_check', {
                    items: JSON.stringify(items)
                }).then(r => {
                    this.payData = r.data;
                    localStorage.setItem('cart',JSON.stringify(items));
                })
            },
            add(id) {
                if (this.shop[this.shopIndex(id)].type_num == 1) {
                    this.shop[this.shopIndex(id)].number = 1;
                    return;
                }
                if (this.shop[this.shopIndex(id)].number >= this.shop[this.shopIndex(id)].stock) {
                    this.shop[this.shopIndex(id)].number = this.shop[this.shopIndex(id)].stock
					return;
                }
                if (this.shop[this.shopIndex(id)].number >= this.shop[this.shopIndex(id)].type_num) {
                    return
                }
                this.shop[this.shopIndex(id)].number++;
                Fetch('/user/update_cart', {
                    id: id,
                    number: this.shop[this.shopIndex(id)].number
                }).then(r=>{
                    this.computedPrice();
                    this.start();
                })
                
            },
            inpChange(id) {
                if (this.shop[this.shopIndex(id)].type_num == 1) {
                    this.shop[this.shopIndex(id)].number = 1;
                    return;
                }
                if (this.shop[this.shopIndex(id)].number >= this.shop[this.shopIndex(id)].stock) {
                    this.shop[this.shopIndex(id)].number = this.shop[this.shopIndex(id)].stock
                }
                if (this.shop[this.shopIndex(id)].number <= 1) {
                    this.shop[this.shopIndex(id)].number = 1
                }
                Fetch('/user/update_cart', {
                    id: id,
                    number: this.shop[this.shopIndex(id)].number
                }).then(r=>{
                    this.computedPrice();
                    this.start();
                })
            },
            del(id) {
                if (this.shop[this.shopIndex(id)].number <= 1) {
                    return
                }
                this.shop[this.shopIndex(id)].number--;
                Fetch('/user/update_cart', {
                    id: id,
                    number: this.shop[this.shopIndex(id)].number
                }).then(r=>{
                    this.computedPrice();
                    this.start();
                })

            },
            isCheckAll() {
                var all = this.shop.every((item, index) => {
                    return item.check == true
                });
                if (all) {
                    this.check_all = true;
                } else {
                    this.check_all = false;
                }
            },
            checkAll() {
                this.isCheckAll();
                if(this.isSet){
                    
                    if (!this.check_all) {
                        this.shop.forEach((item, index) => {
                            item.check = true;
                        });
                        this.check_all = true;
                    } else {
                        this.shop.forEach((item, index) => {
                            item.check = false;
                        });
                        this.check_all = false;
                    }
                    
                    
                }else{
                    
                    if (!this.check_all) {
                        this.shop.forEach((item, index) => {
                            if(item.status != 'N'){
                                item.check = true;
                            }
                        });
                        this.check_all = true;
                    } else {
                        this.shop.forEach((item, index) => {
                            if(item.status != 'N'){
                                item.check = false;
                            }
                        });
                        this.check_all = false;
                    }
                }
                
                this.computedPrice();

            },
            accHandle() {
                var show = this.shop.some((item) => item.check);
                if (show) {
                    this.$parent.footer('cart', false);
                    this.show_footer = true;
                } else {
                    this.$parent.footer('cart', true);
                    this.show_footer = false;
                }
            }
        },
    }
</script>

<style lang="less" scoped>
    input[type="search"]::-webkit-search-cancel-button {
        -webkit-appearance: none;
    }
    .pointer-events{
        pointer-events: none;
    }
    .red_top_bg {
        position: fixed;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        z-index: 10;
    }

    .back_left {
        width: 20px;
        height: 20px;
        background: url(../images/item/back.png) no-repeat center center;
        background-size: auto 100%;
        margin: 32px 0 0 10px;
    }

    .basic_wrap {
        position: relative;
    }

    .cart_detail,
    .no_item {
        margin-top: 44px;
    }

    .no_item {
        width: 100%;
        height: 396px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        img {
            width: 225px;
        }

        p {
            font-size: 12px;
            color: rgba(0,0,0,.6);
            margin-top: 10px;
        }
    }

    .cart_shop {
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 6px;
        margin-top: 11px;
        padding: 12px 12px 8px 12px;
        font-size: 12px;

        .cart_list {
            padding-bottom: 16px;
            margin-bottom: 16px;
            border-bottom: 1px solid #ECECEC;

            &:last-child {
                border-bottom: none;
                margin-bottom: 0;
            }

            .active_type {
                height: 16px;
                line-height: 16px;
                margin-left: 24px;
                display: flex;
                justify-content: flex-start;
                align-items: center;
                margin-bottom: 8px;

                .active_name {
                    background: rgba(241, 34, 17, 0.08);
                    border-radius: 4px;
                    color: #f12211;
                    padding: 0 3px;
                    text-align: center;
                }

                .count_tip {
                    margin-left: 9px;
                    color: #f12211;
                    font-weight: bold;
                }

                .count_tip2 {
                    margin-left: 9px;
                    color: rgba(0,0,0,.6);
                    font-weight: bold;
                }
            }

            .item_center {
                height: 88px;
                display: flex;
                justify-content: flex-start;
                align-items: center;

                .left_check {
                    width: 16px;
                    height: 100%;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .right_detail {
                    flex: 1;
                    margin-left: 12px;
                    display: flex;
                    justify-content: center;
                    align-items: center;

                    .item_img {
                        width: 80px;
                        height: 80px;

                        img {
                            width: 100%;
                            height: 100%;
                        }
                    }

                    .item_box {
                        margin-left: 12px;
                        flex: 1;
                        display: flex;
                        flex-direction: column;
                        justify-content: space-between;

                        .item_tit {
                            height: 40px;
                            line-height: 20px;
                            font-size: 14px;
                            color: rgba(0,0,0,.8);
                            font-weight: bold;
                        }

                        .norms {
                            margin-top: 3px;
                            line-height: 14px;
                            color: rgba(0,0,0,.6);
                        }

                        .item_price {
                            height: 21px;
                            line-height: 21px;
                            margin-top: 10px;
                            display: flex;
                            justify-content: space-between;
                            align-items: baseline;

                            .old_price {
                                height: 17px;
                                margin-left: 4px;
								text-decoration: line-through;
                                font-size: 12px;
                                color: #B3B3B3;
                            }

                            .price {
                                font-size: 15px;
                                color: #f12211;
                                font-weight: bold;
                            }
                        }
                    }
                }
            }
        }
    }

    .check_box {
        width: 16px;
        height: 16px;
        background: url(../images/item/check2.png) no-repeat center center;
        background-size: 100% 100%;

        &.ischeck {
            background: url(../images/item/ischeck2.png) no-repeat center center;
            background-size: 100% 100%;
        }
    }


    .cut_num {
        flex: 1;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        margin-right: 5px;

        input {
            width: 39px;
            height: 21px;
            background: rgba(242, 242, 242, 1);
            font-size: 12px;
            color: rgba(0, 0, 0, 0.8);
            text-align: center;
            margin: 0 7px;
        }

        .cut {
            width: 11px;
            height: 21px;
            line-height: 21px;
            font-size: 20px;
            color: #757880;
            text-align: center;
        }
    }

    .shop_num_box {
        width: 375px;
        height: 40px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 0px 0px 6px 6px;
        display: flex;
        padding: 0 14px 0 23px;
        justify-content: space-between;
        align-items: center;

        .num {
            font-size: 14px;
            color: rgba(0,0,0,.8);
            line-height: 20px;
            font-weight: 600;
        }

        .set_shop {
            font-size: 12px;
            color: #3D96FF;
        }
    }

    .hot_box {
        margin-top: 23px;

        .hot_list {
            width: 100%;
            background: linear-gradient(180deg, rgba(255, 255, 255, 1) 0%, rgba(255, 255, 255, 0.02) 100%);
            border-radius: 18px;
            padding: 14px 12px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 12px;

            .item {
                width: 172px;
                background-color: #FFFFFF;
                border-radius: 6px;
                margin-bottom: 6px;
                overflow: hidden;
                padding-bottom: 10px;

                img {
                    display: block;
                    width: 100%;
                    height: 172px;
                }

                .hot_tit {
                    width: 144px;
                    margin: 9px auto 0 auto;
                    color: #455A64;
                    font-size: 12px;
                    line-height: 17px;
                }

                .hot_prize {
                    width: 144px;
                    margin: 7px auto 0 auto;
                    height: 18px;
                    font-size: 13px;
                    font-weight: 600;
                    color: rgba(240, 48, 65, 1);
                    line-height: 18px;
                }
            }
        }
    }

    .cart_footer,
    .cart_footer_set {
        width: 375px;
        height: 52px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.2);
        position: fixed;
        margin: 0 auto;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 10;

        .check_all_box {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px 0 13px;
            font-size: 12px;
            color: rgba(0,0,0,.8);
            font-weight: bold;

            .left_check {
                width: 50px;
                display: flex;
                justify-content: flex-start;
                align-items: center;

                .check_box {
                    margin-right: 6px;
                }
            }

            .all_price {
                margin-left: 7px;
                flex: 1;

                .sum_box {
                    line-height: 25px;
                    font-size: 15px;

                    .sum_price {
                        color: #f12211;
                    }
                }

                .sale_money {
                    line-height: 14px;
                    white-space: nowrap;
                }

            }
        }
    }

    @media (min-width: 300px) and (max-width: 340px) {
        .cart_footer .check_all_box {
            padding: 0 10px;
        }

        .cart_footer .check_all_box .left_check {
            width: 60px;
        }

        .sub_btn {
            width: 75px;
        }
    }
</style>
