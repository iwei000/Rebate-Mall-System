<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="search_box" @click="$router.push('/search')">
                <i class="fdj"></i>
                <input type="text" readonly placeholder="搜索商品名称" class="search_inp">
                <div class="clear_inp"></div>
            </div>
        </div>
        <div class="item_wrap">
            <div class="left_type">
                <div class="type_list" v-for="item,idx in data" :class="idx== current?'cur':''" @click="choostShop(idx)"><i></i><span>{{item.name}}</span></div>
            </div>
            <div class="right_content">
                <div class="content_list" v-for="v in child_list">
                    <h3>{{v.name}}</h3>
                    <ul class="list_item">
                        <li v-for="itm,index in v.sub" @click="shopGo(itm.id,v.name,itm.name)" :class="(index)%3 == 1 ?'mar_left':''">
                            <img v-if="itm.img1 != null" :src="itm.img1" alt="">
                            <p>{{itm.name}}</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Fetch from '../../utils/fetch';
    export default {
        name: "item",
        data() {
            return {
                data: [],
                current: 0,
                child_list: []
            }
        },
        created() {
            this.$parent.footer('item');
        },
        mounted() {
            this.start();
        },
        methods: {
            start() {
                Fetch('/index/item_class').then((r) => {
                    var shop_arr = [];

                    r.data.forEach((v) => {
                        if (v.sub) {
                            shop_arr.push(v);
                            v.sub.forEach((item, idx) => {
                                if (!item.sub) {
                                    v.sub.splice(idx, 1);
                                }
                            })
                        }
                    })

                    this.data = shop_arr;
                    if(this.data[this.current]){
                        this.child_list = this.data[this.current].sub;
                    }


                })
            },
            shopGo(id,two,three) {
                this.$router.push({
                    path: 'type',
                    query: {
                        id: id,
                        type2:two,
                        type3:three
                    },
                })
            },
            choostShop(idx) {
                this.current = idx;
                this.child_list = this.data[idx].sub;
            }
        },
    }
</script>

<style lang="less" scoped>
    .red_top_bg {
        position: fixed;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        z-index: 10;
    }

    .basic_wrap {
        position: relative;
    }

    .search_box {
        width: 343px;
        height: 29px;
        background-color: #f6f6f6;
        border-radius: 17px;
        margin: 8px auto 0 auto;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        padding: 0 10px 0 14px;

        .fdj {
            width: 16px;
            height: 16px;
            background: url(../images/item/fdj.png) no-repeat center center;
            background-size: 100% 100%;
        }

        .search_inp {
            flex: 1;
            margin: 0 8px;
            font-size: 14px;
            color: #000000;
            line-height: 20px;
            height: 20px;
        }

        .clear_inp {
            width: 20px;
            height: 20px;
            background: url(../images/item/clear.png) no-repeat center center;
            background-size: 100% 100%;
        }
    }

    .left_type::-webkit-scrollbar,
    .right_content::-webkit-scrollbar {
        display: none;
    }

    .item_wrap {
        width: 375px;
        display: flex;
        justify-content: space-between;
        height: 100%;
        padding: 44px 0 49px 0;
        overflow: hidden;
        position: fixed;
        transform: translateX(-50%);
        top: 0;
        left: 50%;

        .left_type {
            width: 90px;
            height: 100%;
            overflow-y: scroll;
            -webkit-overflow-scrolling: touch;
            background-color: #FFFFFF;

            .type_list {
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
                height: 46px;

                i {
                    position: absolute;
                    width: 4px;
                    height: 14px;
                    background-color: #E33820;
                    left: 0;
                    display: none;
                }

                span {
                    font-size: 12px;
                    color: rgba(0, 0, 0, 0.6);
                }

                &.cur {
                    background: rgba(245, 245, 245, 1);
                    font-weight: bold;

                    i {
                        display: block;
                    }

                    span {
                        font-size: 14px;
                        color: rgba(0,0,0,.8);
                    }
                }
            }
        }

        .right_content {
            flex: 1;
            height: 100%;
            overflow-y: scroll;
            -webkit-overflow-scrolling: touch;

            .content_list {
                width: 261px;
                padding: 14px 7px;
                background: rgba(255, 255, 255, 1);
                box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
                border-radius: 6px;
                margin: 12px auto 0 auto;

                h3 {
                    font-weight: 600;
                    color: rgba(0,0,0,.8);
                    line-height: 24px;
                    font-size: 14px;
                }

                &:last-child {
                    margin-bottom: 10px;
                }
            }

            .list_item {
                width: 100%;
                margin-top: 10px;
                display: flex;
                justify-content: flex-start;
                flex-wrap: wrap;

                li.mar_left {
                    margin: 0 26px 17px 26px;
                }

                li {
                    width: 65px;
                    height: 85px;
                    margin: 0 0px 17px 0px;

                    img {
                        display: block;
                        width: 65px;
                        height: 65px;
                    }

                    p {
                        width: 100%;
                        line-height: 14px;
                        height: 14px;
                        font-size: 12px;
                        text-align: center;
                        color: rgba(0, 0, 0, 0.6);
                        margin-top: 6px;
                    }
                }
            }
        }
    }
</style>
