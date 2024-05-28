<template>
	<div class="basic_wrap">
		<bsHeader title="我的收货地址" backurl="/safe"></bsHeader>
		<div class="no_address" v-if="data.length==0">
			<img src="../images/user/address.png" alt="">
		</div>
		<div class="address_list">
			<div class="item" v-for="v in data">
				<div class="user_name">
					<div class="name">{{v.name}}</div>
					<div class="tel">{{v.tel}}</div>
				</div>
				<p class="address">
					{{v.province}} {{v.city}} {{v.county}} {{v.address}}
				</p>
				<div class="edit" @click="$router.push('/editaddress/' + v.id)">
					<i class="edit_icon"></i>
					<span>编辑</span>
				</div>
			</div>
		</div>
		<div class="basic_btn" v-if="data.length==0" @click="$router.push('/editaddress')">添加收货地址</div>
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
				data:[]
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
				Fetch('/user/address').then(res => {
					this.data = res.data.list;
				})
				// Fetch('/user/address/remove',{
				// 	id: 34
				// }).then(res => {
				// 	this.data = res.data.list;
				// })
			
			},
		}
	};
</script>

<style lang="less" scoped>
	.red_top_bg{
		position: fixed;
		top: 0;
		left: 50%;
		transform: translateX(-50%);
		z-index: 10;
	}
	.no_address{
		margin: 101px auto 0 auto;
		width: 223px;
		height: 159px;
		img{
			width: 100%;
			height: 100%;
		}
	}
	.basic_btn{
		margin: 141px auto 0 auto;
	}
	.address_list{
		width: 100%;
		margin-top: 76px;
		padding: 0 17px;
		.item{
			width:341px;
			background:rgba(255,255,255,1);
			box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
			border-radius:4px;
			margin-bottom: 12px;
			padding: 12px 14px 0px 14px;
			.user_name{
				display: flex;
				justify-content: space-between;
				font-size: 13px;
				color: #333333;
				line-height: 18px;
				height: 18px;
			}
			.address{
				width: 100%;
				line-height: 17px;
				font-size: 12px;
				color: #666666;
				margin-top: 8px;
			}
			.edit{
				display: flex;
				justify-content: flex-end;
				height: 32px;
				border-top: 1px solid #F0F1F3;
				margin-top: 6px;
				align-items: center;
				.edit_icon{
					width: 20px;
					height: 21px;
					background: url(../images/user/edit.png) no-repeat center center;
					background-size: 100% 100%;
				}
				span{
					font-size: 12px;
					color: #333333;
					margin-left: 4px;
					line-height: 17px;
				}
			}
		}
	}
</style>
