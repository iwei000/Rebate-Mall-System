<template>
    <div class="basic_wrap">
		<div class="red_top_bg">
			<div class="back_left" @click="$router.back()"></div>
			<div class="big_tit">消息详情</div>
		</div>
        <div class="ctn">
            <!-- <vue-editor v-model="data.content" style="display: none"/> -->
			<div class="msg_box">
				<div class="tit">
					<p class="tips">{{data.title}}</p>
					<p class="time">{{data.add_time}}</p>
				</div>
				<div class="contract_box" style="width: 100%" v-html="data.content"></div>
			</div>
        </div>
    </div>
</template>

<script>

    import Fetch from "../../utils/fetch";
    // import {VueEditor} from 'vue2-editor'

    export default {
        name: "notice_article",
        /* components: {
            VueEditor
        }, */
        data() {
            return {
                data: {},
            };
        },
        created() {
            this.$parent.footer('user',false);
        },
        mounted() {
            this.start();
        },
        methods: {
            start() {
                Fetch('/user/notice_view', {
                    id: this.$router.history.current.params.id
                }).then(res => {
                    this.data = res.data.view;
                })
            },
        }
    };
</script>

<style lang="less" scoped>
	.red_top_bg {
		position: fixed;
		top: 0;
		left: 50%;
		transform: translateX(-50%);
		z-index: 10;
	}
	.msg_box{
		width:375px;
		margin-top: 76px;
		font-size: 13px;
		color: rgba(0,0,0,.6);
		padding: 16px 12px;
		background:rgba(255,255,255,1);
		box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
		.tit{
			display: flex;
			justify-content: space-between;
			align-items: center;
			.tips{
				font-size: 14px;
				line-height: 20px;
				color: rgba(0,0,0,.8);
				font-weight: bold;
                flex: 1;
			}
			.time{
				font-size: 12px;
				color: rgba(0,0,0,.6);
                text-align: right;
			}
		}
	}
	.contract_box.ql-editor {
		font-size: 13px;
		line-height: 20px;
	}
    .newdetail_wrap {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        overflow-x: hidden;
        overflow-y: auto;
        background: #ffffff;
    }

    .newdetail_wrap .ctn {
        width: 100%;
        background: #fff;
        padding: 5px;
        margin: 0 auto;
    }

    .newdetail_wrap .ctn .title {
        font-size: 12px;
        color: #333;
        font-weight: bold;
        line-height: 1.7;
    }

    .newdetail_wrap .ctn .info {
        font-size: 12px;
        color: #333;
        line-height: 1.7;
    }
	.contract_box{
		margin-top: 15px;
	}
    .newdetail_wrap .contract_box {
        padding: 0;
        /deep/ .ql-editor {
            padding: 0 0;
        }

        img {
            max-width: 100%;
        }

        html, address,
        blockquote,
        body, dd, div,
        dl, dt, fieldset, form,
        frame, frameset,
        h1, h2, h3, h4,
        h5, h6, noframes,
        ol, p, ul, center,
        dir, hr, menu, pre {
            display: block;
            unicode-bidi: embed
        }

        li {
            display: list-item
        }

        head {
            display: none
        }

        table {
            display: table
        }

        tr {
            display: table-row
        }

        thead {
            display: table-header-group
        }

        tbody {
            display: table-row-group
        }

        tfoot {
            display: table-footer-group
        }

        col {
            display: table-column
        }

        colgroup {
            display: table-column-group
        }

        td, th {
            display: table-cell
        }

        caption {
            display: table-caption
        }

        th {
            font-weight: bolder;
            text-align: center
        }

        caption {
            text-align: center
        }

        body {
            //margin: 8px
        }

        h1 {
            font-size: 2em;
            margin: .67em 0
        }

        h2 {
            font-size: 1.5em;
            margin: .75em 0
        }

        h3 {
            font-size: 1.17em;
            margin: .83em 0
        }

        h4, p,
        blockquote, ul,
        fieldset, form,
        ol, dl, dir,
        menu {
            margin: 1.12em 0
        }

        h5 {
            font-size: .83em;
            margin: 1.5em 0
        }

        h6 {
            font-size: .75em;
            margin: 1.67em 0
        }

        h1, h2, h3, h4,
        h5, h6, b,
        strong {
            font-weight: bolder
        }

        blockquote {
            margin-left: 40px;
            margin-right: 40px
        }

        i, cite, em,
        var, address {
            font-style: italic
        }

        pre, tt, code,
        kbd, samp {
            font-family: monospace
        }

        pre {
            white-space: pre
        }

        button, textarea,
        input, select {
            display: inline-block
        }

        big {
            font-size: 1.17em
        }

        small, sub, sup {
            font-size: .83em
        }

        sub {
            vertical-align: sub
        }

        sup {
            vertical-align: super
        }

        table {
            border-spacing: 2px;
        }

        thead, tbody,
        tfoot {
            vertical-align: middle
        }

        td, th, tr {
            vertical-align: inherit
        }

        s, strike, del {
            text-decoration: line-through
        }

        hr {
            border: 1px inset
        }

        ol, ul, dir,
        menu, dd {
            margin-left: 40px
        }

        ol {
            list-style-type: decimal
        }

        ol ul, ul ol,
        ul ul, ol ol {
            margin-top: 0;
            margin-bottom: 0
        }

        u, ins {
            text-decoration: underline
        }

        br:before {
            content: "\A";
            white-space: pre-line
        }

        center {
            text-align: center
        }

        :link, :visited {
            text-decoration: underline
        }

        :focus {
            outline: thin dotted invert
        }

        /* Begin bidirectionality settings (do not change) */

        BDO[DIR="ltr"] {
            direction: ltr;
            unicode-bidi: bidi-override
        }

        BDO[DIR="rtl"] {
            direction: rtl;
            unicode-bidi: bidi-override
        }

        *[DIR="ltr"] {
            direction: ltr;
            unicode-bidi: embed
        }

        *[DIR="rtl"] {
            direction: rtl;
            unicode-bidi: embed
        }

        @media print {
            h1 {
                page-break-before: always
            }

            h1, h2, h3,
            h4, h5, h6 {
                page-break-after: avoid
            }

            ul, ol, dl {
                page-break-before: avoid
            }
        }
    }
</style>