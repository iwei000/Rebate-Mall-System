<template>
	<div class="basic_wrap">
		<bsHeader title="新人任务"></bsHeader>
		<div class="wrap_box wrap1">
			<router-link to="/sign" class="item">
				<img class="icon" src="../images/user/icon7.png" alt="" />
				<p class="info">每日签到</p>
			</router-link>
			<router-link to="/jz" class="item">
				<img class="icon" src="../images/user/icon8.png" alt="" />
				<p class="info">微信分享</p>
			</router-link>
			<router-link to="/share" class="item">
				<img class="icon" src="../images/user/icon9.png" alt="" />
				<p class="info">产品推广</p>
			</router-link>
		</div>
		<div class="wrap_box wrap2">
			<div class="tit">奖励介绍</div>
			<p>1、现金：直接发放现金到账户余额，可提现；<br><br> 2、代金券：可直接用于购物并充当现金使用，计入本金返还； </p>
		</div>
		<div class="wrap_box wrap3">
			<div class="tit">任务介绍</div>
			<p>1、签到：每日签到可领取奖励，连续签到达到天数后可领取更丰富的奖励；<br><br>
			2、分享：分享产品宣传文字及海报到微信群或朋友圈，每完成一次即可获得指定奖励；<br><br>
			3、推广：邀请新用户加入平台即产生代理关系，新用户产生有效订单后，可按照一定比例获得现金佣金奖励，且凡三级代理关系内的用户所产生的有效订单均可获得佣金奖励； </p>
		</div>
		
	</div>
</template>

<script>
	import Fetch from '../../utils/fetch';
	import bsHeader from '../../components/bsHeader.vue'
	export default {
		name: "item",
		data() {
			return {
				data: {},
			}
		},
		components:{
			bsHeader
		},
		created() {
			this.$parent.footer('index',false);
		},
		mounted() {

		},
		methods: {
			
		},
	}
</script>

<style lang="less" scoped>
	.wrap1{
		display: flex;
		padding: 16px 0;
		align-items: center;
		justify-content: space-around;
		.item{
			width: 48px;
			height: 62px;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			img{
				width: 35px;
				height: 35px;
			}
			p{
				margin-top: 5px;
				width: 200%;
				font-size: 12px;
				color: #000;
				text-align: center;
			}
		}
	}
	.wrap2,.wrap3{
		padding: 16px 12px;
		margin-top: 8px;
		.tit{
			font-size: 14px;
			font-weight: bold;
			color: rgba(0,0,0,.8);
			line-height: 20px;
			margin-bottom: 11px;
		}
		p{
			font-size: 13px;
			color: rgba(0,0,0,.6);
			line-height: 18px;
		}
	}
</style>
