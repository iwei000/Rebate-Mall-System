<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="search_box">
                <i class="fdj"></i>
                <form action="javascript:void(0)" @submit.prevent="formsubmit" class="form">
                    <input type="search" autofocus ref="input" @keypress.enter.prevent="tosearch" placeholder="搜索商品名称" class="search_inp">
                </form>
                <div class="clear_inp" @click="clearsearch"></div>
            </div>
            <div class="cancel" @click="$router.back()">取消</div>
        </div>
        <div class="search_wrap" v-show="ishistory">
            <div class="history">
                <p>搜索历史</p>
                <i v-show="!noHistory" @click="clearLocal"></i>
            </div>
            <div class="history_list" v-show="!noHistory">
                <span v-for="i in searchHistory" @click="searchLocal(i)">{{i}}</span>
            </div>
            <div class="no_history" v-show="noHistory">
                <img src="../images/item/no_history.png" alt="">
            </div>
        </div>
        <div class="search_info" v-show="!ishistory">
            <div class="tabs" v-if="listLength != 0">
                <div class="tab" :class="{cur:cut_tab == 1}" @click="sort(1)">
                    <p>综合排序</p>
                </div>
                <div class="tab" :class="{cur:cut_tab == 2}" @click="sort(2)">
                    <p>销量排序</p>
                </div>
                <div class="tab" :class="{cur:cut_tab == 3}" @click="sort(3)">
                    <p>价格排序</p>
                </div>
                <div class="bottom_line cut1" ref="line"></div>
            </div>
            <van-empty v-if="listLength == 0" description="没有找到您要搜索的商品" />
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
                noHistory: true,
                ishistory: true,
                id: '',
                searchHistory: [],
                cats: {
                    sort_type: 1
                },
                searchName:'',
                listLength: 0
            }
        },
        created() {
            this.$parent.footer('item', false);
        },
        mounted() {
            this.getLocal();
            this.$refs.input.focus();
        },
        methods: {
            getLocal(){
                                
                if(!localStorage.getItem('search') || JSON.parse(localStorage.getItem('search')).length == 0 ){
                    this.searchHistory = [];
                    this.noHistory = true;
                }else{
                    this.noHistory = false;
                    this.searchHistory = JSON.parse(localStorage.getItem('search'));
                }
            },
            clearLocal(){
                this.searchHistory = [];
                localStorage.setItem('search', JSON.stringify([]));
                this.getLocal();
            },
            clearsearch(){
                this.searchName = '';
                this.$refs.input.value = '';
                this.ishistory = true;
                this.getLocal();
            },
            start() {
                Fetch('/index/item_search', {
                    name: this.searchName,
                    ...this.cats
                }).then(r => {
                    this.data = r.data;
                    this.ishistory = false;
                    this.listLength = r.data.list.length;
                })
            },
            sort(num) {
                if(this.searchName == ""){
                    return;
                }
                if(num == 1){
                    this.cats = {
                        sort_type: 1,
                    }
                    this.start()
                }
                if(num == 2){
                    this.cats = {
                        sort_type: 2,
                    }
                    this.start()
                }
                if(num == 3){
                    this.cats = {
                        sort_type: 3,
                    }
                    this.start()
                }
                this.$refs.line.className = 'bottom_line cut'+num;
                this.cut_tab = num;
            },
            searchLocal(val){
                this.searchName = val;
                this.$refs.input.value = val;
                this.start();
            },
            tosearch(ev) {
                ev.preventDefault();
                if(ev.target.value == ''){
                    return;
                }
                this.ishistory = false;
                this.searchName = ev.target.value;
                
                this.start();
                
                this.searchHistory.push(ev.target.value);
                
                localStorage.setItem('search', JSON.stringify(this.searchHistory));
                

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
        overflow: hidden;
    }

    .basic_wrap {
        position: relative;
    }

    .search_box {
        width: 313px;
        height: 29px;
        background-color: #f6f6f6;
        border-radius: 17px;
        margin-top: 8px;
        margin-left: 16px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        padding: 0 10px 0 14px;
        float: left;

        .fdj {
            width: 16px;
            height: 16px;
            background: url(../images/item/fdj.png) no-repeat center center;
            background-size: 100% 100%;
        }

        .form {
            flex: 1;
            margin: 0 8px;
            font-size: 14px;
            color: #000000;
            line-height: 20px;
            height: 20px;

            .search_inp {
                width: 100%;
                height: 100%;
            }
        }

        .clear_inp {
            width: 20px;
            height: 20px;
            background: url(../images/item/clear.png) no-repeat center center;
            background-size: 100% 100%;
        }
    }

    .left_type::-webkit-scrollbar,
    .item_wrap::-webkit-scrollbar {
        display: none;
    }

    .cancel {
        line-height: 18px;
        height: 18px;
        font-size: 13px;
        color: #FFFFFF;
        margin-left: 8px;
        float: left;
        margin-top: 13px;
    }

    .search_wrap {
        margin-top: 64px;
        padding: 19px 17px;

        .history {
            width: 100%;
            height: 22px;
            display: flex;
            justify-content: space-between;
            align-items: center;

            p {
                line-height: 22px;
                font-size: 14px;
                font-weight: bold;
                color: rgba(0,0,0,.8);
            }

            i {
                width: 20px;
                height: 20px;
                background: url(../images/item/del.png) no-repeat center center;
                background-size: 100% 100%;
            }
        }

        .history_list {
            margin-top: 5px;
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            align-items: flex-start;
            text-align: center;

            span {
                padding: 0 7px;
                height: 20px;
                line-height: 20px;
                border-radius: 10px;
                background-color: #DEDEDE;
                font-size: 12px;
                color: rgba(0,0,0,.8);
                margin-right: 12px;
                margin-bottom: 12px;
            }
        }
    }

    .no_history {
        width: 100%;
        height: 70vh;
        display: flex;
        justify-content: center;
        align-items: center;

        img {
            width: 223px;
            height: 159px;
        }
    }

    .search_info {
        margin-top: 64px;
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
            color: #020202;
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
                line-height: 16px;
                margin-top: 10px;
                color: #455A64;
                font-size: 12px;
            }

            div {
                display: block;
                width: 146px;
                margin: 0 auto;
                font-size: 13px;
                color: #F03041;
                margin-top: 13px;
                line-height: 18px;
            }
        }
    }
</style>
