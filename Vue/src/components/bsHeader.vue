<template>
	<div class="red_top_bg">
		<div class="back_left" @click.stop="handleBack"></div>
		<div class="big_tit">{{title}}</div>
		<p class="top_right" @click="right_router">
			<slot></slot>
		</p>
	</div>
</template>
<script>
	export default {
		name: "bsHeader",
		props: {
			backurl: {
				type: [String, Number],
				default: -1
			},
			title: {
				type: [String],
				default: ""
			},
			routerurl: {
				type: [String],
				default: ""
			},
		},
		methods: {
			handleBack(e) {
				console.log(this.backurl);
				if (this.backurl != -1) {
					this.$router.push({
						path: this.backurl
					});
					return;
				}
				if (window.history.length > 1) {
					this.$router.go(-1)
				} else {
					this.$router.push({
						path: "index"
					})
				}

			},
			right_router(e) {
				console.log(this.routerurl)
				if (this.routerurl != -1) {
					this.$router.push({
						path: this.routerurl
					});
					return;
				}
			}
		},
	}
</script>
<style lang="less" scoped>

</style>
