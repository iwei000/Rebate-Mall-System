<template>
	<div class="letter_wrap">
		<div class="red_top_bg">
			<div class="back_left" @click="$router.back()"></div>
			<div class="big_tit">消息中心</div>
		</div>
		<div class="msg_num">
			<div class="all_msg">共有<span>{{data.ok_read_num}}</span>条未读消息</div>
			<!-- <div class="read">全部标为已读</div> -->
		</div>
		<div class="msg_box">
			<div class="item" v-for="item in data.list" @click="$router.push('/notice/'+item.id)">
				<div class="tit">
					<p class="tips van-ellipsis">{{item.title}}</p>
					<p class="time">{{item.time}}</p>
				</div>
				<div class="content van-multi-ellipsis--l2" v-html="item.content"></div>
			</div>
		</div>
	</div>
</template>

<script>
	import Fetch from '../../utils/fetch';

	export default {
		name: "login",
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
				Fetch('/user/notice').then((r) => {
					this.data = r.data;
				});
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
	.msg_num{
		margin-top: 64px;
		width:375px;
		height:40px;
		line-height: 40px;
		background:rgba(255,255,255,1);
		box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
		border-radius:0px 0px 6px 6px;
		display: flex;
		justify-content: space-between;
		padding: 0 11px 0 20px;
		align-items: center;
		overflow: hidden;
		.all_msg{
			font-size: 14px;
			color: rgba(0,0,0,.8);
			font-weight: bold;
			span{
				color: #F03041;
			}
		}
		.read{
			font-size: 12px;
			color: #3D96FF;
		}
	}
	.msg_box{
		width:375px;
		background:rgba(255,255,255,1);
		padding: 0 13px 0 20px;
		margin-top: 14px;
		box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
		.item{
			padding: 10px 0 13px 0;
			border-bottom: 1px solid #ECECEC;
			&:last-of-type{
				border-bottom: none;
			}
			.tit{
				display: flex;
				justify-content: space-between;
				align-items: center;
				.tips{
					font-size: 14px;
                    flex: 1;
                    height: 20px;
					line-height: 20px;
					color: rgba(0,0,0,.8);
					font-weight: bold;
				}
				.time{
                    flex: 1;
                    text-align: right;
					font-size: 12px;
					color: rgba(0,0,0,.6);
				}
			}
			.content{
				height: 36px;
				margin-top: 2px;
				line-height: 18px;
				font-size: 13px;
				color: rgba(0,0,0,.6);
			}
		}
	}
</style>
