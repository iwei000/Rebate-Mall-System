<template>
	<div class="user_wrap">
		<div class="top_header">
			<router-link to="/safe" class="set_go"></router-link>
			<!-- <router-link to="/kefu" class="kf_go"></router-link> -->
			<div class="user_detail">
				<div class="user_header">
					<img :src="data.user_icon" alt="">
				</div>
				<div class="user_name">
					<div class="user_all">
						<p class="user_nickname">{{data.name?data.name:data.mobile}}</p>
						<p class="user_vip flex_center"><span>{{data.vip_name}} 累计积分：{{data.credit}}</span></p>
					</div>
					<div class="sm flex_center" v-if="data.is_auth == '0'" @click="$router.push('/auth')"><span>未实名认证</span><i class="triangle"></i></div>
					<div class="sm flex_center" v-if="data.is_auth == '1'"><span>已实名认证</span></div>
				</div>
			</div>
			<div class="user_active">
				<div class="left_tit">
					<i></i>
					<span>通知</span>
				</div>
				<div class="center_msg">
					<p class="van-ellipsis">{{firstMsg}}</p>
					<!-- <p>申领指定银联卡，送1年会员权益</p> -->
				</div>
				<router-link to="/notice" class="look_active flex_center"><span>立即查看</span><i class="triangle"></i></router-link>
			</div>
		</div>
		<div class="part1">
			<router-link to="/coupon" class="item">
				<img class="icon" src="../images/user/icon1.png" alt="" />
				<p class="info">我的券包</p>
			</router-link>
			<router-link to="/about" class="item">
				<img class="icon" src="../images/user/icon2.png" alt="" />
				<p class="info">业务须知</p>
			</router-link>
			<router-link to="/logistics" class="item">
				<img class="icon" src="../images/user/icon3.png" alt="" />
				<p class="info">物流中心</p>
			</router-link>
            <router-link to="/safe" class="item">
            	<img class="icon" src="../images/user/my.png" alt="" />
            	<p class="info">账号设置</p>
            </router-link>
			<router-link to="/kefu" class="item">
				<img class="icon" src="../images/user/kefu.png" alt="" />
				<p class="info">在线客服</p>
			</router-link>
		</div>
		<div class="part2">
			<div class="tit">
				<h5>我的订单</h5>
				<p @click="$router.push('/order')">
					<span>查看订单</span>
					<i></i>
				</p>
			</div>
			<div class="wrap" v-if="load">
				<div class="money">
					<div class="money_num flex_center numberFontBold" v-html="'<span>¥</span>'+bigNumeber(data.ds_money)"></div>
					<p class="info">待收本金</p>
				</div>
				<div class="money">
                    <div class="money_num flex_center numberFontBold" v-html="'<span>¥</span>'+bigNumeber(data.ds_apr_money)"></div>
					<p class="info">待收佣金</p>
				</div>
				<div class="money">
                    <div class="money_num flex_center numberFontBold" v-html="'<span>¥</span>'+bigNumeber(data.all_money)"></div>
					<p class="info">累计收益</p>
				</div>
			</div>
		</div>
		<div class="part2 money_bag">
			<div class="tit">
				<h5>我的钱包</h5>
				<p @click="$router.push('/moneybag')">
					<span>进入钱包</span>
					<i></i>
				</p>
				<p class="sm_go" v-if="false" @click="$router.push('/auth')">
					<span>立即实名</span>
					<i></i>
				</p>
			</div>
			<div class="wrap">
				<div class="money_all flex_center">
					<p class="money_num flex_center larfont" v-html="`<span class='fh'>¥</span>${wan(data.money)}`"></p>
					<p class="info">钱包余额</p>
				</div>
				<div class="bag_icon">
					<router-link to="/moneybag" class="item">
						<img class="icon" src="../images/user/icon4.png" alt="" />
						<p class="info">资金流水</p>
					</router-link>
					<router-link to="/invest" class="item">
						<img class="icon" src="../images/user/icon5.png" alt="" />
						<p class="info">充值</p>
					</router-link>
					<router-link to="/cash" class="item">
						<img class="icon" src="../images/user/icon6.png" alt="" />
						<p class="info">提现</p>
					</router-link>
				</div>

			</div>
		</div>

		<div class="part2 money_bag rw">
			<div class="tit">
				<h5>任务中心</h5>
			</div>
			<div class="wrap">
				<div class="money_all flex_center">
					<p class="money_num flex_center larfont" v-html="`<span class='fh'>¥</span>${wan(data.reward)}`"></p>
					<p class="info">累计奖励</p>
				</div>
				<div class="bag_icon">
					<router-link to="/jz" class="item">
						<img class="icon" src="../images/user/icon8.png" alt="" />
						<p class="info">微信分享</p>
					</router-link>
					<router-link to="/share" class="item">
						<img class="icon" src="../images/user/icon9.png" alt="" />
						<p class="info">产品推广</p>
					</router-link>
					<router-link to="/sign" class="item">
						<img class="icon" src="../images/user/icon7.png" alt="" />
						<p class="info">每日签到</p>
					</router-link>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import Vue from 'vue';
	import qs from 'qs'
	import Fetch from '../../utils/fetch'
	import {
		Swipe,
		SwipeItem,
		NoticeBar
	} from "vant";

	Vue.use(NoticeBar);

	export default {
		name: "user",
		components: {
			VanSwipe: Swipe,
			VanSwipeItem: SwipeItem,
		},
		data() {
			return {
				data: {},
                load: false,
                firstMsg:"消息列表"
			};
		},
		created() {
			this.$parent.footer('user');
		},
		mounted() {
			this.start();
		},
		methods: {
            bigNumeber(str){
                str = str.replace(',','');
                var num = parseFloat(str) || 0;
                if(num>99999){
                    return `<span>${(num / 10000).toFixed(2)}万</span>`;
                }else{
                    var str = str.toString();
                    var strs = str.split(".");
                    return `<span class="bigNum">${strs[0]}</span><span>.</span><span>${strs[1]}</span>`;
                }
                
            },
            wan(str){
                var num = parseFloat(str) || 0;
                if(num>99999){
                    return `${(num / 10000).toFixed(2)}<span class="wan">万</span>`;
                }else{
                    return str || 0;
                }
                
            },
			start() {
				Fetch('/user/info').then((r) => {
					this.data = r.data;
                    this.load = true;
				});
                
                // 消息
                Fetch('/user/notice').then((r) => {
                    
                    var msg_arr = []
                    r.data.list.forEach(item=>{
                        if(!item.is_read){
                            msg_arr.push(item);
                        }
                    })
                    
                    if(msg_arr.length!=0){
                        this.firstMsg = msg_arr[0].title
                    }
                }); 
			},
		}
	};
</script>

<style lang="less" scoped>
	a{
		color: #222;
	}
    .numberFontBold{
        font-family: barlow !important;
        font-size: 15px !important;
        font-weight: bold !important;
    }
    .larfont{
        font-family: barlow !important;
    }
	.user_wrap {
		background-color: #FAFAFA;
		max-width: 375px;
		margin: 0 auto;
		overflow: hidden;
	}

	.top_header {
		position: relative;
		width: 375px;
		height: 178px;
		background: url(../images/user/header.png) no-repeat center center;
		background-size: 100% 100%;

		.set_go,
		.kf_go {
			width: 26px;
			height: 26px;
			position: absolute;
			top: 11px;
		}

		.set_go {
			right: 14px;
			background: url(../images/user/set_icon.png) no-repeat center center;
			background-size: 100% 100%;
		}

		.kf_go {
			right: 14px;
			background: url(../images/user/kf_icon.png) no-repeat center center;
			background-size: 100% 100%;
		}
	}

	.user_detail {
		width: 100%;
		padding: 0 15px;
		position: absolute;
		top: 34px;
		display: flex;
		justify-content: flex-start;
		align-items: center;

		.user_header {
			width: 60px;
			height: 60px;
			overflow: hidden;
			border-radius: 50%;
			border: 3px solid rgba(255, 255, 255, 0.3);

			img {
				width: 100%;
				height: 100%;
			}
		}

		.user_name {
			margin-left: 3px;
			margin-top: 3px;
			flex: 1;
			display: flex;
			flex-direction: column;
			justify-content: flex-start;
			color: #FFFFFF;

			.user_all {
				display: flex;
				justify-content: flex-start;
				align-items: center;

				.user_nickname {
					line-height: 21px;
					font-size: 16px;
				}

				.user_vip {
					margin: 0 4px 0 6px;
				}

				.user_vip,
				.user_score {
					height: 13px;
					line-height: 13px;
					background: rgba(0, 0, 0, 0.16);
					border-radius: 3px;

					span {
						font-size: 12px;
						transform: scale(0.85);
					}
				}
			}

			.sm {
				height: 17px;
				background: rgba(237, 15, 64, 1);
				border-radius: 8px;
				border: 1px solid rgba(187, 12, 12, 0.58);
				padding: 6px;
				margin-top: 9px;
				white-space: nowrap;
				width: 88px;

				span {
					font-size: 12px;
					transform: scale(0.85);
				}
			}
		}
	}

	.flex_center {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.triangle {
		width: 0;
		height: 0;
		border: 3px solid transparent;
		border-left-color: #FFFFFF;
	}

	.user_active {
		width: 375px;
		height: 67px;
		background: url(../images/user/msg.png) no-repeat center center;
		background-size: 100% 100%;
		position: absolute;
		bottom: -4px;
		left: 0;
		padding: 0 17px;
		display: flex;
		justify-content: flex-start;
		align-items: center;

		.left_tit {
			width: 77px;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;

			i {
				width: 22px;
				height: 23px;
				background: url(../images/user/icon11.png) no-repeat center center;
				background-size: 100% 100%;
			}

			span {
				line-height: 17px;
				font-size: 12px;
				color: #E3E07A;
			}
		}

		.center_msg {
			width: 205px;
            margin-right: 10px;
			display: flex;
			justify-content: flex-start;
			flex-direction: column;
			align-items: flex-start;
			padding-left: 10px;
			border-left: 1px solid #EEE47973;
			white-space: nowrap;
            overflow: hidden;

			p:first-child {
                width: 100%;
				height: 18px;
				line-height: 18px;
				font-size: 13px;
				color: #E3E07A;
			}

			// p:last-child {
			// 	height: 16px;
			// 	font-size: 12px;
			// 	font-weight: 400;
			// 	color: rgba(227, 224, 122, 0.69);
			// 	line-height: 16px;
			// 	transform: scale(0.85) translateX(-8%);
			// }
		}

		.look_active {
			width: 64px;
			height: 17px;
			background: #FFDF6E;
			border-radius: 9px;
			font-weight: 400;
			color: rgba(28, 39, 79, 1);
			line-height: 17px;
			margin-right: 11px;
			white-space: nowrap;

			span {
				font-size: 12px;
				line-height: 17px;
				transform: scale(0.85);
			}

			.triangle {
				border-left-color: #1C274F;
				margin-left: 3px;
			}
		}
	}

	.part1 {
		width: 351px;
		background: rgba(255, 255, 255, 1);
		box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
		border-radius: 9px;
		padding: 11px 0 16px 0;
		margin: 16px auto 0 auto;
		display: flex;
		align-items: center;
		justify-content: space-around;

		.item {
			width: 48px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;

			.icon {
				width: 38px;
				height: 38px;
			}

			.info {
				width: 150%;
				height: 17px;
				line-height: 17px;
				font-size: 12px;
				color: #000000;
				text-align: center;
				margin-top: 1px;
				white-space: nowrap;
			}
		}
	}

	.part2.money_bag .wrap {
		justify-content: flex-start;
		.money_all{
			margin-top: -12px;
		}
		.bag_icon{
			flex: 1;
			display: flex;
			align-items: center;
			padding-left: 5px;
			justify-content: space-around;
			.item{
				padding: 4px 0 21px 0;
			}
		}
	}

	.part2.money_bag.rw .wrap{
		.money_all{
			margin-top: -4px;
			height: 55px;
			.info{
				margin-top: 8px;
			}
		}
		.bag_icon{
			.item{
				padding: 15px 0 17px 0;
				.info{
					margin-top: 6px;
				}
			}
		}
	}
	
	.part2 {
		width: 351px;
		background: rgba(255, 255, 255, 1);
		box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
		border-radius: 9px;
		margin: 11px auto 11px auto;
		color: #000000;

		.tit {
			width: 100%;
			border-bottom: 1px solid #F6F6F6;
			padding: 0 9px;
			height: 30px;
			line-height: 30px;
			display: flex;
			justify-content: space-between;
			align-items: center;

			h5 {
				font-size: 14px;
			}

			p {
				color: rgba(0,0,0,.6);
				display: flex;
				align-items: center;

				span {
					font-size: 12px;
					transform: scale(0.85);
				}

				i {
					width: 4px;
					height: 7px;
					background: url(../images/user/right.png) no-repeat center center;
					background-size: 100% 100%;
					margin-left: 7px;
				}
			}
			.sm_go{
				color: #3D96FF;
				i{
					background: url(../images/user/right2.png) no-repeat center center;
					background-size: 100% 100%;
				}
			}
		}

		.wrap {
			display: flex;
			justify-content: space-around;
			align-items: center;

			.money_all {
				width: 94px;
				border-right: 1px solid #EAEAEA;
				height: 43px;
				flex-direction: column;
			}

			.money,
			.item {
				display: flex;
				align-items: center;
				justify-content: center;
				flex-direction: column;
				padding: 12px 0 21px 0;
			}

			.money_num {
				font-size: 16px;
				height: 34px;
				line-height: 16px;
				font-weight: bold;
				width: 200%;
				white-space: nowrap;

				span {
					font-size: 12px;
					line-height: 12px;
					margin-top: 4px;
				}
			}

			.icon {
				width: 34px;
				height: 34px;

			}

			.info {
				font-size: 12px;
				line-height: 17px;
				white-space: nowrap;
			}
		}
	}
</style>
