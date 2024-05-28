<template>
    <div class="basic_wrap">
        <bsHeader title="新人专享"></bsHeader>
        <div class="vip_box">
            <p class="num">新人专享专区</p>
            <p class="shop_num">共 {{ allNum }} 件商品</p>
        </div>
        <div class="hot_box">
            <van-list v-model="loading" :finished="finished" @load="onLoad">
                <div
                    class="item"
                    v-for="(i, idx) in backList"
                    :key="idx"
                    :title="idx"
                    @click="$router.push('/details/' + i.id)"
                >
                    <img :src="i.img" alt />
                    <p class="hot_tit van-multi-ellipsis--l2">{{ i.title }}</p>
                    <div class="price_box">
                        <p
                            v-if="i.new_user_rebate_money"
                            class="hot_prize numberFont"
                            v-html="
                                '<span>¥</span>' +
                                    $parent.bigNumeber(i.new_user_rebate_money)
                            "
                        ></p>
                        <p
                            v-else
                            class="hot_prize numberFont"
                            v-html="
                                '<span>¥</span>' +
                                    $parent.bigNumeber(i.min)
                            "
                        ></p>
                        <div class="sale" v-if="i.new_user_rebate_money">¥{{ i.min }}</div>
                    </div>
                </div>
            </van-list>
        </div>
    </div>
</template>

<script>
import Vue from "vue";
import Fetch from "../../utils/fetch";
import bsHeader from "../../components/bsHeader.vue";
import { List } from "vant";
Vue.use(List);
export default {
    name: "item",
    data() {
        return {
            loading: false,
            finished: false,
            page_curren: 1,
            data: {},
            backList: [],
            countLength: 0,
            allNum: 0,
        };
    },
    components: {
        bsHeader,
    },
    created() {
        this.$parent.footer("index", false);
    },
    mounted() {
        this.start();
    },
    methods: {
        onLoad() {
            this.page_curren++;
            this.start();

            // 加载状态结束
            this.loading = false;

            // 数据全部加载完成
            if (this.backList.length >= this.data.totalCount) {
                this.finished = true;
            }
        },
        start() {
            Fetch(
                "/index/new_user",
                {
                    page: this.page_curren,
                },
                { method: "get" }
            ).then((r) => {
                this.countLength = r.data.totalCount;
                r.data.list.forEach((item) => {
                    this.backList.push(item);
                });
                this.data = r.data;
                this.allNum = r.data.totalCount;
            });
        },
    },
};
</script>

<style lang="less" scoped>
input[type="search"]::-webkit-search-cancel-button {
    -webkit-appearance: none;
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

.vip_box {
    width: 375px;
    height: 40px;
    background: rgba(255, 255, 255, 1);
    box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
    border-radius: 0px 0px 6px 6px;
    display: flex;
    margin-top: 44px;
    padding: 0 14px 0 23px;
    justify-content: space-between;
    align-items: center;

    p {
        height: 20px;
        line-height: 20px;
        font-size: 14px;
        color: rgba(0,0,0,.6);
    }
}

.hot_box {
    margin-top: 11px;

    .hot_list,
    .van-list {
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-top: 12px;
        padding: 0 12px;

        .item {
            width: 172px;
            padding-bottom: 10px;
            background-color: #ffffff;
            border-radius: 6px;
            margin-bottom: 6px;
            overflow: hidden;

            img {
                display: block;
                width: 100%;
                height: 172px;
                border: 1px solid #f6f6f6;
            }

            .hot_tit {
                width: 144px;
                margin: 9px auto 0 auto;
                color: #455a64;
                font-size: 12px;
                line-height: 17px;
            }

            .hot_prize {
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
            }
        }
    }
}

.price_box {
    display: flex;
    align-items: baseline;
    justify-content: flex-start;
    margin-top: 7px;
    padding: 0 13px;

    .sale {
        color: #b3b3b3;
        font-size: 12px;
        line-height: 14px;
        margin-left: 4px;
        text-decoration: line-through;
    }
}
</style>
