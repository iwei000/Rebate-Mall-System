<template>
	<div class="coupon">
		<div class="red_top_bg">
			<div class="back_left" @click="backCoupon" v-if="more_tick"></div>
			<div class="back_left" @click="$router.back()" v-if="!more_tick"></div>
			<div class="big_tit">我的券包</div>
		</div>
	<div class="coupon-list">
	    <!-- 优惠券列表 -->
		<van-tabs v-model="active">
		  <van-tab title="未使用">
			<div class="coupon-card" v-for="(item, key) in coupons" :key="key">
				<span class="use-now" @click="goToDetail(item.xid)">去使用</span>
				<div class="van-coupon__content">
				<div class="van-coupon__head">
				  <h2 class="van-coupon__amount">{{item.valueDesc}}<span>元</span></h2>
				  <p class="van-coupon__condition">{{item.condition}}</p>
				</div>
				<div class="van-coupon__body">
				  <p class="van-coupon__name">{{item.name}}</p>
				  <p class="van-coupon__valid">{{item.startAt|dateFormat}} - {{item.endAt|dateFormat}}</p>
				</div>
				</div>
				<p class="van-coupon__description">{{item.description}}</p>
			</div>
		  </van-tab>
		  <van-tab title="已使用">
			<div class="coupon-card" v-for="(item, key) in disabledCoupons" :key="key">
				<div class="van-coupon__content">
				  <div class="van-coupon__head" style="color: #323233;">
					  <h2 class="van-coupon__amount">{{item.valueDesc}}<span>元</span></h2>
					  <p class="van-coupon__condition">{{item.condition}}</p>
				  </div>
				  <div class="van-coupon__body">
					  <p class="van-coupon__name">{{item.name}}</p>
					  <p class="van-coupon__valid">{{item.startAt|dateFormat}} - {{item.endAt|dateFormat}}</p>
					</div>
				</div>
				<p class="van-coupon__description">{{item.description}}</p>
			</div>
		  </van-tab>
		  <van-tab title="已过期">
			  <div class="coupon-card" v-for="(item, key) in expireCoupons" :key="key">
				<div class="van-coupon__content">
				  <div class="van-coupon__head" style="color: #323233;">
					  <h2 class="van-coupon__amount">{{item.valueDesc}}<span>元</span></h2>
					  <p class="van-coupon__condition">{{item.condition}}</p>
				  </div>
				  <div class="van-coupon__body">
					  <p class="van-coupon__name">{{item.name}}</p>
					  <p class="van-coupon__valid">{{item.startAt|dateFormat}} - {{item.endAt|dateFormat}}</p>
					</div>
				</div>
				<p class="van-coupon__description">{{item.description}}</p>
			  </div>
		  </van-tab>
		</van-tabs>
	</div>
  </div>
</template>
<script type='text/ecmascript-6'>
  import Vue from 'vue'
  import { Tab, Tabs } from 'vant'
  Vue.use(Tab).use(Tabs)
  import Fetch from '../../utils/fetch'
  import moment from "moment";
  export default {
    data () {
      return {
        coupons: [],
		disabledCoupons: [],
		expireCoupons: [],
		active: 0,
		more_tick: false,
      }
    },
	filters: {
		dateFormat(time) {
			return moment(time*1000).format('YYYY-MM-DD');
		}
	},
	created(){
		this.$parent.footer('item',false);
	},
	mounted() {
		this.start();
	},
    methods: {
		backCoupon(){
			this.more_tick = false;
		},
		back() {
			this.$router.push('/user');
		},
		goToDetail(xid){
			if(xid > 0){
				this.$router.replace('/details/' + xid);
			}else{
				this.$router.replace('/item');
			}		    
		},
      	start() {
			Fetch('/user/coupon_list').then(res => {
				this.coupons = res.data.coupons;
				this.disabledCoupons = res.data.disabledCoupons;
				this.expireCoupons = res.data.expireCoupons;
			})
		},
    },
  }
</script>
<style lang="less" scoped>
.coupon-list{
	margin-top: 44px;
}
.coupon-card{
	width: 94%;
	margin:15px auto;
	overflow: hidden;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 4px rgba(0,0,0,.1);
	position: relative;
}
.red_top_bg {
	position: fixed;
	top: 0;
	left: 50%;
	transform: translateX(-50%);
	z-index: 10;
}

.back_left {
	width: 20px;
	height: 20px;
	background: url(../images/item/back.png) no-repeat center center;
	background-size: auto 100%;
	margin: 12px 0 0 10px;
}
.use-now{
	position: absolute;
	right: 0;
	top: 0;
	border-radius: 0 8px 0 8px;
	padding: 6px 11px;
	background: #fb1b55;
	font-size: 14px;
	color:#FFFFFF;
}
.coupon .van-coupon__content {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    box-sizing: border-box;
    min-height: 84px;
    padding: 14px 0;
    color: #323233;
}

.coupon .van-coupon__head {
    position: relative;
    min-width: 120px;
    padding: 0 8px;
    color: #ee0a24;
    text-align: center;
}

.coupon .van-coupon__amount {
    margin-bottom: 6px;
    font-weight: 500;
    font-size: 26px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.coupon .van-coupon__amount span:not(:empty) {
    margin-left: 2px;
}
.coupon .van-coupon__amount span {
    font-weight: 400;
    font-size: 40%;
}

.coupon .van-coupon__condition {
    font-size: 12px;
    line-height: 16px;
    white-space: pre-wrap;
}
.coupon .van-coupon__amount, .van-coupon__condition, .van-coupon__name, .van-coupon__valid {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.coupon .van-coupon__body {
    position: relative;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    flex: 1;
    border-radius: 0 8px 8px 0;
}
.coupon .van-coupon__name {
    margin-bottom: 10px;
    font-weight: 700;
    font-size: 14px;
    line-height: 20px;
}
.coupon .van-coupon__valid {
    font-size: 12px;
}
.coupon .van-coupon__description {
    padding: 8px 16px;
    font-size: 12px;
    border-top: 1px dashed #ebedf0;
}
</style>