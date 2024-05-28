<template>
    <div class="container">
        <bsHeader title="合同书"></bsHeader>
        <div class="content">
            <div class="box">
                <div class="contract_box">
                    <h1 class="con_name">{{data.title}}合同书</h1>
                    <p class="code">合同编号：{{data.contract_no}}</p>
                    <p><label>甲方（参与方）</label>：{{data.name1}}</p>
                    <p><label>乙方（管理方）</label>：{{data.name2}}</p>
                    <p><label>丙方（担保方）</label>：{{data.name3}}</p>
                    <p>甲乙丙三方经友好协商，本着平等自愿、诚实信用的原则，就甲方使用乙方提供的本网站所有服务的有关事项达成如下协议:</p>
                    <!-- <p><label>下单参与协议</label></p> -->
                    <p>一、<label>下单参与协议</label></p>
                    <table class="tablec">
                        <tbody>
                        <tr>
                            <td>产品名称</td>
                            <td>{{data.item_name}}</td>
                        </tr>
                        <tr>
                            <td>参与人姓名</td>
                            <td>{{data.name1}}</td>
                        </tr>
                        <tr>
                            <td>参与人身份证</td>
                            <td>{{data.name1_idcard}}</td>
                        </tr>
                        <tr>
                            <td>购买商品金额<br>(下称"甲方参与本金")</td>
                            <td>{{data.item_money}}元</td>
                        </tr>
                        <!-- <tr v-if="data.item_days < 24">
                            <td>协议期（小时）</td>
                            <td>{{data.item_days}}小时</td>
                        </tr> -->
                        <tr>
                            <td>协议期（天）</td>
                            <td>{{data.item_days}}天</td>
                        </tr>
                        <tr>
                            <td>佣金率</td>
                            <td>{{data.item_apr}}%</td>
                        </tr>
                        <tr>
                            <td>返佣日</td>
                            <td>{{data.item_adddate}}</td>
                        </tr>
                        <tr>
                            <td>到期日</td>
                            <td>{{data.item_enddate}}</td>
                        </tr>
                        <tr>
                            <td>应收本佣(元)</td>
                            <td>{{data.item_back_money}}元</td>
                        </tr>
                        <tr>
                            <td>还款方式</td>
                            <td>{{data.item_type}}</td>
                        </tr>
                        </tbody>
                    </table>
					<div v-html="data.contract_content" class="contract_content"></div>
                    <div class="signature">
                        <div class="Party" style="width: 50%">
                            <p>甲方：{{data.name1}}</p>
                            <span>{{data.contract_date}}</span>
                        </div>
                        <div class="Party" style="float: right; width: 50%">
                            <p>乙方：{{data.name2}}</p>
                            <span>{{data.contract_date}}</span>
                        </div>
                        <img :src="data.contract_image1" class="img1">
                        <div class="Party" style="padding:25px 0; clear: both; position: relative; width: 100%">
                            <p>丙方：{{data.name3}}</p>
                            <span>{{data.contract_date}}</span>
                        </div>
                        <img class="img2" :src="data.contract_image2">
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    import Fetch from '../../utils/fetch';
    import bsHeader from '../../components/bsHeader.vue'

    export default {
        name: "orderinfo",
        data() {
            return {
                data: {}
            };
        },
        components: {
        	bsHeader
        },
        created() {
            this.$parent.footer('user',false);
        },
        mounted() {
            this.start();
        },
        methods: {
            start() {
                Fetch('/index/item_contract', {id: this.$router.history.current.params.id}).then(res => {
                    this.data = res.data
                })
            },
        }
    };
</script>

<style lang="less" scoped>
    .red_top_bg{
        position: fixed;
        z-index: 15;
    }
    .container {
        height: 100%;
        // background-color: #f5f5f5;
        // position: relative;
		.contract_content{
			line-height: 20px;
			font-size: 14px;
		}
        .content {
            font-size: 12px;
            margin-top: 44px;

            .img1 {
                width: 100px;
                top: -20px;
                right: 40px;
            }

            .img2 {
                top: 55px;
                left: 40px;
                width: 100px;
            }


            /*合同*/

            .contract_box {
                width: 94%;
                margin: 0 auto;
                background: #fff;
                padding: .3rem .2rem;
            }

            .contract_box.deta {
                width: 7.1rem;
                padding: .2rem;
            }

            .contract_box .con_name {
                text-align: center;
                font-weight: normal;
                font-size: .6rem;
                margin: .3rem 0 1rem 0;
            }

            .contract_box p.stamp {
                color: #e16f00;
                font-size: .24rem;
                text-align: right;
                margin: 0;
                cursor: pointer;
            }

            .contract_box p {
                line-height: 20px;
                font-size: 14px;
                margin: .15rem 0;
                color: #000;
                text-align: left;
            }

            .contract_box p.code {
                text-align: right;
            }

            .contract_box p label {
                color: #000;
                font-weight: bold;
            }

            .contract_box.deta .table_auto {
                width: 100%;
                margin: auto;
                overflow: auto;
            }

            .contract_box.deta .table_auto table {
                margin: auto;
                width: 14rem;
            }

            .contract_box .tablec {
                width: 100%;
                border-collapse: collapse;
                border-top: 1px solid #e5e5e5;
                border-left: 1px solid #e5e5e5;
                margin-bottom: .3rem;
            }

            .contract_box .tablec td {
                border-right: 1px solid #ddd;
                border-bottom: 1px solid #e5e5e5;
                padding: .2rem;
                font-size: 14px;
				line-height: 20px;
            }

            .contract_box .tablec td:first-child {
                width: 43%;
            }

            .contract_box .tablec tr:nth-child(odd) {
                background: #f5f5f5;
            }

            .contract_box.deta .tablec td:first-child {
                width: auto;
            }

            .contract_box.deta .tablec td {
                text-align: center;
                padding: .3rem 0;
            }

            .contract_box.deta .tablec tr:nth-child(odd) {
                background: none;
            }

            .contract_box.deta .tablec tr:hover {
                background: #f9f9f9;
            }

            .contract_box.deta .tablec th {
                font-size: .28rem;
                background: #f5f5f5;
                padding: .3rem 0;
                border-right: 1px solid #ddd;
                border-bottom: 1px solid #e5e5e5;
            }

            .signature {
                position: relative;
                margin: 1rem 0 40px;
                height: 190px;
            }

            .signature .Party {
                float: left
            }

            .signature .Party p {
                margin-bottom: .3rem;
            }

            .signature .Party span {
                font-size: 13px;
            }

            .signature img {
                position: absolute;
            }


            .back {
                position: absolute;
                z-index: 10;
                color: #fff;
                text-indent: 8px;
                width: 36px;
                height: 24px;
                line-height: 20px;
                font-size: 18px;
                background: #e8c27d;
                border-radius: 0 20px 20px 0;
                top: 10px;
            }

            .top {
                height: 70px;
                background: #544b5e;
            }

            .main {
                padding: 1px 0 20px 0;
                margin: -18px auto 0 auto;
            }

            .main .title1 {
                position: absolute;
                top: 2em;
                left: 20%;
                width: 60%;
                height: 36px;
                line-height: 36px;
                border-radius: 36px;
                color: #333333;
                font-size: 18px;
                text-align: center;
                background: #e8c27d;
                margin: 0 auto 10px auto;
            }

            .box {
                width: 92.4%;
                margin: 0 auto;
                overflow: hidden;
                border-radius: 12px;
                background: #fff;
            }

            .box .item {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: horizontal;
                -webkit-box-direction: normal;
                -ms-flex-direction: row;
                flex-direction: row;
                -webkit-box-align: stretch;
                -ms-flex-align: stretch;
                align-items: stretch;
                -webkit-box-pack: justify;
                -ms-flex-pack: justify;
                justify-content: space-between;
                -ms-flex-line-pack: center;
                align-content: center;
                border-bottom: 1px solid #dcdcdc;
                font-size: 12px;
            }

            .box .item_head {
                color: #333333;
            }

            .box .item_body {
                color: #808080;
            }

            .box .item > div {
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                padding: 10px 4px;
                text-align: center;

            }

            .box .item .item_line {
                border-left: 1px solid #dcdcdc;
                border-right: 1px solid #dcdcdc;

            }

            .box .item .item_1 {
                -webkit-box-flex: 27;
                -ms-flex: 27;
                flex: 27;
            }

            .box .item .item_2 {
                -webkit-box-flex: 7;
                -ms-flex: 7;
                flex: 7;
            }

            .box .item .item_3 {
                -webkit-box-flex: 6;
                -ms-flex: 6;
                flex: 6;
            }

            .box .item .item_4 {
                -webkit-box-flex: 5;
                -ms-flex: 5;
                flex: 5;
            }

            .box .item .item_5 {
                -webkit-box-flex: 5;
                -ms-flex: 5;
                flex: 5;
            }

            .box .item .item_no {
                color: #e8c27d;
            }

            .box .item .item_yes {
                color: #64d17c;
            }

            .box .item .item_4 > span {
                display: inline-block;
                height: 16px;
                line-height: 16px;

                border-radius: 4px;
                text-align: center;
                color: #fff;
                font-size: 12px;
                width: 28px;
                background: #e8c27d;
            }

            .box .item .item_5 > span {
                display: inline-block;
                height: 16px;
                line-height: 16px;

                border-radius: 4px;
                text-align: center;
                color: #fff;
                font-size: 12px;
                width: 28px;
                background: #544b5e;
            }

            @media (max-width: 360px) {
                .box .item > div {
                    padding: 10px 2px;
                }
            }

        }
    }
</style>
