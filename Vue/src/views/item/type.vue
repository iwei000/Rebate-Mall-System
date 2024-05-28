<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.back()"></div>
        </div>
        <div class="type_title">
            <div class="type_name">{{typeMsg}}</div>
            <div class="all_num">总共{{listLength}}件</div>
        </div>
        <div class="search_info">
            <div class="tabs">
                <div class="tab" :class="{cur:cut_tab == 1}" @click="sort(1,1)">
                    <p>综合排序</p>
                </div>
                <div class="tab" :class="{cur:cut_tab == 2}" @click="sort(2,2)">
                    <p>销量排序</p>
                </div>
                <div class="tab" :class="{cur:cut_tab == 3}" @click="sort(3,3)">
                    <p>价格排序</p>
                </div>
                <div class="bottom_line cut1" ref="line"></div>
            </div>
            <van-empty v-if="listLength == 0" description="该分类下暂无商品" />
            <div class="item_info">
                <div class="item" v-for="item in data.list" @click="$router.push('/details/'+item.id)">
                    <img :src="item.img" alt="">
                    <p class="van-multi-ellipsis--l2">{{item.title}}</p>
                    <div class="numberFont" v-html="'<span>¥</span>'+$parent.bigNumeber(item.min)"></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Fetch from '../../utils/fetch';
    import Vue from 'vue';
    import { Tab, Tabs } from 'vant';
    
    Vue.use(Tab);
    Vue.use(Tabs);
    import {
        Empty
    } from 'vant';

    Vue.use(Empty);

    export default {
        name: "item",
        data() {
            return {
                cut_tab: 1,
                data: {},
                typeMsg: "",
                id: '',
                cats: {},
                listLength: 0
            }
        },
        created() {
            this.$parent.footer('item', false);
        },
        mounted() {
            if (this.$route.query.type2 && this.$route.query.type3) {
                this.typeMsg = this.$route.query.type2 + " > " + this.$route.query.type3;
                this.cats = {
                    cats: this.$route.query.id
                }
            }
            if (this.$route.query.type1) {
                this.typeMsg = this.$route.query.type1;
                this.cats = {
                    first_cats: this.$route.query.id
                }
            }

            this.id = this.$route.query.id;

            this.start('1');
        },
        methods: {
            start(sort_type) {
                Fetch('/index/item_search', {
                    sort_type: sort_type,
                    ...this.cats
                }).then(r => {
                    this.data = r.data;
                    this.listLength = r.data.list.length;
                })
            },
            sort(type, num) {
                this.$refs.line.className = 'bottom_line cut'+num;
                this.cut_tab = num;
                this.start(type);
            }


        },
    }
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
        margin: 12px 0 0 10px;
    }

    .basic_wrap {
        position: relative;
    }

    .left_type::-webkit-scrollbar,
    .item_wrap::-webkit-scrollbar {
        display: none;
    }

    .type_title {
        width: 100%;
        height: 44px;
        background-color: #FFFFFF;
        padding: 0 12px;
        line-height: 44px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 44px;
        font-size: 14px;
        color: rgba(0, 0, 0, 0.6);
        border-bottom: 1px solid #FAFAFA;
    }

    .tabs {
        height: 45px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 4px 0px rgba(102, 102, 102, 0.1);
        display: flex;
        align-items: center;
        justify-content: space-around;
        font-size: 15px;
        font-weight: 600;
        position: relative;

        .bottom_line {
            width: 30px;
            height: 2px;
            background-color: #E33820;
            position: absolute;
            bottom: 0;
            left: 48px;
            transition: all 0.3s;
        }
        .cut1{
            left: 45px;
        }
        .cut2{
            left: 172px;
        }
        .cut3{
            left: 298px;
        }

        .tab {
            color: #0202027d;
            font-size: 15px;
            position: relative;
            height: 100%;
            line-height: 45px;

            &.cur {
                color: #E33820;

                i {
                    display: block;
                }
            }
        }
    }

    .item_info {
        margin-top: 12px;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: 0 12px;

        .item {
            width: 172px;
            height: 250px;
            margin-bottom: 6px;
            border-radius: 6px;
            background-color: #FFFFFF;

            img {
                display: block;
                width: 172px;
                height: 172px;
                border: 1px solid #F6F6F6;
                border-radius: 6px 6px 0px 0px;
            }

            p {
                width: 146px;
                margin: 0 auto;
                line-height: 17px;
                height: 34px;
                margin-top: 9px;
                color: #455A64;
                font-size: 12px;
            }

            div {
                display: block;
                width: 146px;
                margin: 0 auto;
                font-size: 13px;
                color: #F03041;
                margin-top: 7px;
                line-height: 18px;
                font-weight: bold;
            }
        }
    }
</style>
