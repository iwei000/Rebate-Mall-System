<template>
	<div class="basic_wrap">
		<bsHeader title="账户管理" backurl="/user"></bsHeader>
		<div class="wrap_box">
			<div class="item">
				<div class="left">
					<span class="icon icon_id"></span>
					<span class="info">实名认证</span>
				</div>
				<div class="right_info" v-if="data.is_auth == '1'">已认证</div>
				<router-link to="/auth" class="right_info auth" v-if="data.is_auth == '0'">去认证<div class="right icon_right"></div></router-link>
				
			</div>
<!-- 			<router-link to="/setpwd" class="item">
				<div class="left">
					<span class="icon icon_login"></span>
					<span class="info">修改手机号</span>
				</div>
				<span class="tips">{{data.mobile}}</span>
				<div class="right icon_right"></div>
			</router-link> -->
			<router-link to="/account" class="item">
				<div class="left">
					<span class="icon icon_login"></span>
					<span class="info">银行卡管理</span>
				</div>
				<div class="right icon_right"></div>
			</router-link>
			<router-link to="/setpwd" class="item">
				<div class="left">
					<span class="icon icon_login"></span>
					<span class="info">修改登录密码</span>
				</div>
				<div class="right icon_right"></div>
			</router-link>
			<router-link to="/setpaypwd" class="item">
				<div class="left">
					<span class="icon icon_pay"></span>
					<span class="info">修改支付密码</span>
				</div>
				<div class="right icon_right"></div>
			</router-link>
			<router-link to="/address" class="item">
				<div class="left">
					<span class="icon icon_login"></span>
					<span class="info">收货地址</span>
				</div>
				<div class="right icon_right"></div>
			</router-link>
			<router-link to="/useragreement" class="item">
				<div class="left">
					<span class="icon icon_greement"></span>
					<span class="info">用户协议</span>
				</div>
				<div class="right icon_right"></div>
			</router-link>
			<router-link to="/privacyPolicy" class="item">
				<div class="left">
					<span class="icon icon_policy"></span>
					<span class="info">隐私政策</span>
				</div>
				<div class="right icon_right"></div>
			</router-link>
			<!-- <a target="" href="" class="item">
				<div class="left">
					<span class="icon icon_zhuxiao"></span>
					<span class="info">注销账号</span>
				</div>
				<div class="right icon_right"></div>
			</a> -->
		</div>

		<div class="history_coupon flex_center" @click="logout">
			<span>退出当前账户</span>
		</div>
	</div>
</template>

<script>
	import Fetch from '../../utils/fetch'
	import bsHeader from '../../components/bsHeader.vue'
	export default {
		name: "safe",
		components: {
			bsHeader
		},
		data() {
			return {
				data: {},
			};
		},
		created() {
			this.$parent.footer('user', false);
		},
		mounted() {
			this.start();
		},
		methods: {
			start() {
				Fetch('/user/info').then((r) => {
					this.data = r.data;
				});
			},
			logout() {
				localStorage.removeItem('token');
				this.$router.replace("/");
			}
		}
	};
</script>

<style lang="less" scoped>
	.wrap_box{
		margin-top: 12px;
		display: flex;
		flex-direction: column;
		align-items: center;
		.item{
			height: 50px;
			width: 343px;
			padding: 16px 0;
			border-bottom: 1px solid #ECECEC;
			font-size: 14px;
			color: rgba(0,0,0,.8);
			font-weight: bold;
			line-height: 20px;
			display: flex;
			justify-content: space-between;
			.right{
				width: 20px;
				height: 20px;
				background: url(../images/user/arrow.png) no-repeat center center;
				background-size: 100% 100%;
			}
			.right_info{
				color: rgba(0,0,0,.6);
			}
			.tips{
				color: rgba(0,0,0,.6);
				margin-left: auto;
				margin-right: 4px;
				font-weight: normal;
			}
		}
	}
	.history_coupon{
		margin: 131px auto 0 auto;
		width:356px;
		height:36px;
		border-radius:2px;
		border:1px solid rgba(0,0,0,0.3);
		text-align: center;
		span{
			font-size: 14px;
			height: 20px;
			line-height: 20px;
			color: rgba(0,0,0,.6);
			position: relative;
			&::after{
				content: '';
				position: absolute;
				top: 3px;
				right: -25px;
				width: 12px;
				height: 13px;
				background: url(../images/user/more.png) no-repeat center center;
				background-size: 100% 100%;
			}
		}
	}
	.flex_center{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.auth{
		display: flex;
		align-items: center;
		justify-content: flex-start;
	}
</style>
