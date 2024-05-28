<template>
	<div class="basic_wrap">
		<bsHeader title="业务须知" backurl="/user"></bsHeader>
		<div class="wrap_box">
			<router-link :to="'about/' + v.id" class="item" v-for="(v,k) in data.list" :key="k">
				<img v-if="k<=13" :src="require(`../images/about/icon${k}.png`)" alt="">
				<img v-else :src="require(`../images/about/icon${parseInt(Math.random()*13)}.png`)" alt="">
				<span class="down_icon">{{v.title}}</span>
			</router-link>
		</div>
	</div>
</template>

<script>
	import Fetch from '../../utils/fetch';
	import bsHeader from '../../components/bsHeader.vue'
	export default {
		name: "login",
		components: {
			bsHeader
		},
		data() {
			return {
				show_icon_type: 'about',
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
				Fetch('/index/about').then((r) => {
					this.data = r.data;
				});
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
	.wrap_box{
		margin-top: 56px;
		height:516px;
		padding: 28px 10px 152px 10px;
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start;
		.item{
			height: 62px;
			margin: 0 20px 23px 20px;
			width: 48px;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			img{
				width: 44px;
				height: 44px;
			}
			.down_icon{
				width: 200%;
				line-height: 18px;
				color: rgba(0,0,0,.8);
				text-align: center;
				font-size: 12px;
			}
		}
	}
</style>
