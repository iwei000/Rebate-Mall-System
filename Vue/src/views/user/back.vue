<template>
    <div class="order_wrap">
        <div class="back_orange">
            <router-link to="/" class="back_to"></router-link>
            返佣记录
        </div>
        <div class="mt0">
            <div class="mt0_item">
                <div class="item_top">
                    <span class="info"></span>已收佣金(元)
                </div>
                <div class="item_bottom">¥{{data.ok_apr_money}}</div>
            </div>
            <div class="mt0_item">
                <div class="item_top">待收佣金(元)</div>
                <div class="item_bottom">¥{{data.on_apr_money}}</div>
            </div>
        </div>
        <div class="mt1">
            <table class="table">
                <thead>
                <tr>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>佣金</th>
                    <th>状态</th>
                    <th>预计返佣时间</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(v,k) in data.list" :key="k">
                    <td>{{v.name}}</td>
                    <td>{{v.money}}</td>
                    <td>{{v.apr_money}}</td>
                    <td>{{v.status_name}}</td>
                    <td>{{v.back_time_date}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>

    import Fetch from '../../utils/fetch';

    export default {
        name: "login",
        data() {
            return {
                data: {}
            };
        },
        created() {
            this.$parent.footer('user');
        },
        mounted() {
            this.start();
        },
        methods: {
            start() {
                Fetch('/item/list/search').then((r) => {
                    this.data = r.data;
                });
            },
        }
    };
</script>

<style lang="less" scoped>

    .order_wrap {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        overflow-x: hidden;
        overflow-y: auto;
        background: #f5f5f5;
    }

    .order_wrap .mt0 {
        padding: 15px 3.2% 10px 3.2%;
        background: #fff;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
    }

    .order_wrap .mt0 .mt0_item {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-flex: 0;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
    }

    .order_wrap .mt0 .mt0_item .item_top {
        font-size: 15px;
        color: #333;
        margin-bottom: 8px;
    }

    .order_wrap .mt0 .mt0_item .item_top > span {
        font-size: 12px;
    }

    .order_wrap .mt0 .mt0_item .item_bottom {
        font-size: 25px;
        color: #fb661e;
        line-height: 40px;
    }

    .order_wrap .mt1 {
        width: 100%;
        margin-top: 16px;
    }

    .order_wrap .mt1 .table {
        width: 100%;
    }

    .order_wrap .mt1 .table thead th {
        font-weight: bold;
        color: #333;
        font-size: 13px;
        line-height: 1.6;
        border: 1px #ddd solid;
        padding: 5px;
    }

    .order_wrap .mt1 .table tbody td {
        font-weight: normal;
        color: #333;
        font-size: 13px;
        line-height: 1.6;
        border: 1px #ddd solid;
        padding: 5px;
        text-align: center;
    }
</style>