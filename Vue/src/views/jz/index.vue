<template>
	<div class="basic_wrap">
		<bsHeader title="分享" backurl="/user"></bsHeader>
		<router-link :to="'/jz/' + v.id" class="jobs_item" tag="div" v-for="(v,k) in data.list" :key="k">
			<img class="img" :src="v.img" alt="" />
			<div class="title">{{v.desc}}</div>
		</router-link>
	</div>
</template>

<script>
import Fetch from '../../utils/fetch';
import bsHeader from '../../components/bsHeader.vue';

export default {
    name: "jz",
    components: {
        bsHeader
    },
    data() {
        return {
            data: {}
        };
    },
    mounted() {
        this.start();
    },
    methods: {
        async start() {
            try {
                const { data } = await Fetch('/index/share');
                this.data = data;
            } catch (error) {
                console.error("Failed to fetch data", error);
                this.handleError();
            }
        },
        handleError() {
            // Handle error (e.g., show an error message)
        }
    }
};
</script>

<style lang="less" scoped>
	.jobs_item{
		width:344px;
		background:rgba(255,255,255,1);
		box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
		border-radius:6px;
		overflow: hidden;
		margin: 10px auto 0 auto;
		img{
			width: 100%;
			height: 138px
		}
		.title{
			padding: 0 11px;
			line-height: 20px;
			margin: 7px 0;
			font-size: 14px;
			color: #000000;
		}
		
	}
</style>
