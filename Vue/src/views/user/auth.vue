<template>
	<div class="basic_wrap">
		<bsHeader title="实名认证"></bsHeader>
		<form class="form" @submit.prevent="submit">
			<div class="item">
				<input type="text" class="inp" v-model.trim="name" placeholder="请输入姓名" />
				<div class="right_icon"></div>
			</div>
			<div class="item m18">
				<input type="text" class="inp" v-model.trim="idcard" placeholder="请输入身份证号" />
				<div class="right_icon"></div>
			</div>
			<button type="submit" class="basic_btn sbtn" :class="name==''|| idcard == ''?'no_touch':''">立即认证</button>
		</form>
	</div>
</template>

<script>
	import Fetch from '../../utils/fetch'
	import bsHeader from '../../components/bsHeader.vue'
	export default {
		name: "setpwd",
		components: {
			bsHeader
		},
		data() {
			return {
				name: '',
				idcard: '',
			};
		},
		created() {
			this.$parent.footer('user',false);
		},
		mounted() {

		},
		methods: {
			submit() {
				if (!this.name) {
					this.$toast('姓名不能为空');
					return false;
				}

				if (!this.idcard) {
					this.$toast('身份证号不能为空');
					return false;
				}

				Fetch('/user/auth', {
					name: this.name,
					idcard: this.idcard,
				}).then(() => {

					this.$toast({
						background: '#07c160',
						message: '认证成功'
					});
					if(this.$route.query.redirect){
						this.$router.replace(this.$route.query.redirect)
					}else{ 
						this.$router.replace('/safe')
					}
				});
			},
		}
	};
</script>

<style lang="less" scoped>
	.m18{
		margin-top: 18px;
	}
	.form{
		width: 100%;
		margin-top: 32px;
		padding: 0 20px;
		.item{
			width: 100%;
			height: 45px;
			background:rgba(255,255,255,1);
			border-radius:2px;
			border:1px solid rgba(0,0,0,0.1);
			display: flex;
			justify-content: space-between;
			align-items: center;
			input{
				flex: 1;
				padding: 0 10px;
				height: 22px;
				font-size: 16px;
				line-height: 22px;
			}
			.right_icon{
				width: 13px;
				height: 13px;
				background: url(../images/item/clear.png) no-repeat center center;
				background-size: 100% 100%;
				margin-right: 12px;
			}
		}
	}
	.basic_btn{
		margin-top: 43px;
	}
</style>
