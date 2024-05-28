<template>
	<div class="basic_wrap">
		<bsHeader :title="data.title"></bsHeader>
		<div class="p_agr" v-html="data.content"></div>
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
			    Fetch('/index/article_detail', {
			        id: 12
			    }).then(res => {
			        this.data = res.data;
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
	.p_agr{
		margin-top: 77px;
		padding: 0 18px;
		font-size: 13px;
		color: rgba(0,0,0,0.9);
		line-height: 20px;
		p{
			font-weight: bold;
			margin-top: 8px;
		}
		.child{
			font-weight: normal;
			margin-top: 6px;
		}
		h4{
			margin: 10px 0;
		}
	}
</style>
