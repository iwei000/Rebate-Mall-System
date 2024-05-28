<template>
	<ul :class="[customClass, 'sign-process', wrapClass,scroll]">
		<li v-for="(item, index) in formatData" :key="index" :class="[itemClass, 'sign-process__item']">
			<div class="sign-process__item__content">
				<template v-if="item.isPlaceholder">
					<div class="sign-process__item__content__middle" />
				</template>

				<template v-else>
					<div class="sign-process__item__content__top">
						<img :src="require('../assets/images/'+ item.type + '_over.png')" v-if="item.getstatus == 2" alt="" />
						<img :src="require('../assets/images/'+ item.type + '.png')" v-else alt="" />
						<span>{{item.value}}元</span>
						<div class="get_gift" v-if="item.getstatus == 1" @click="getAward($event,item.id)"></div>
						<div class="get_gift over" v-if="item.getstatus == 2"></div>
						<div class="get_gift no_get" v-if="item.getstatus == 0"></div>
					</div>
					<div :class="[{'sign-process__item__content__middle--active': active >= item.day}, 'sign-process__item__content__middle']" />
					<div class="sign-process__item__content__bottom"><span>{{item.day}}</span>天</div>
				</template>
			</div>
			<div class="tail" v-if="formatData.length - 1 !== index" />
		</li>
	</ul>
</template>

<script>
    import Fetch from '../utils/fetch';
	export default {
		name: "SignProcess",
		props: {
			customClass: String,
			active: {
				type: Number,
				default: -1
			},
			data: {
				type: Array,
				default () {
					return []
				}
			},
			maxNum: {
				type: Number,
				default: 5
			}
		},
		data() {
			return {}
		},
		computed: {
			formatData() {
				const length = this.data.length
				const diff = this.maxNum - length

				if (diff > 0) {
					return [...this.data, ...new Array(diff).fill({
						isPlaceholder: true
					})]
				}

				return this.data
			},
			scroll(){
				return {
					'scroll': this.data.length > this.maxNum
				}
			},
			wrapClass() {
				return {
					'sign-process--flex': this.data.length <= this.maxNum,
				}
			},
			itemClass() {
				return {
					'sign-process__item--flex': this.data.length <= this.maxNum,
					'sign-process__item--20': this.data.length > this.maxNum,
				}
			}
		},
		created() {},
		mounted() {},
		methods: {
            getAward(ev,id){
                console.log(id);
                Fetch('/housing/signin/receive',{
                    reward_id: parseInt(id)
                }).then(r=>{
                    this.$parent.init();
                })
            }
        }
	}
</script>

<style lang="less" scoped>
	ul,
	li {
		list-style: none;
		margin: 0px;
		padding: 0px;
	}

	.sign-process::-webkit-scrollbar {
		display: none;
	}
	.scroll{
		overflow-x: scroll !important;
	}

	.sign-process {
		font-size: 12px;
		padding: 0 14px;
		width: 100%;
		overflow-x: hidden;
		overflow-y: hidden;
		white-space: nowrap;
		height: 130px;

		&--flex {
			display: flex;
		}

		&__item {
			display: inline-flex;
			align-items: center;
			height: 100%;
			height: 18px;
			padding-top: 34px;
			&--flex {
				width: 72px;
				flex: 0 0 auto;
				// &:last-child {
				//     flex: 0 0 auto !important;
				// }
			}

			&--20 {
				width: 72px;

				&:last-child {
					width: auto;
				}
			}

			&__content {
				display: flex;
				flex-direction: column;
				align-items: center;
				position: relative;

				&__top {
					position: absolute;
					top: 19px;
					left: -14px;
					width: 48px;
					height: 79px;
					text-align: center;
					display: flex;
					flex-direction: column;
					align-items: center;

					span {
						position: absolute;
						top: 40px;
						text-align: center;
						line-height: 17px;
						font-size: 12px;
						color: #f12211;
						font-weight: bold;
					}

					img {
						position: absolute;
						top: -10px;
						left: -3px;
						width: 50px;
                        pointer-events: none;
					}
				}

				&__middle {
					border-radius: 50%;
					background: rgb(255, 228, 220);
					width: 18px;
					height: 18px;
					background-size: auto;
					overflow: hidden;
					background: url(../assets/images/basic.png) no-repeat center center;
					background-size: 100% 100%;
					&--active {
						width: 18px;
						height: 18px;
						background: url(../assets/images/cpmplete.png) no-repeat center center;
						background-size: 100% 100%;
					}
				}

				&__bottom {
					position: absolute;
					top: -20px;
					text-align: center;
				}
			}

			.tail {
				background: #FFE4DC;
				width: 100%;
				height: 3px;
			}
		}
	}
	.get_gift{
		width: 48px;
		height: 20px;
        font-size: 12px;
        background:url(../assets/images/get.png) no-repeat center center;
        background-size: 100% 100%;
        color: #FF1300;
        text-align: center;
        line-height: 20px;
		position: absolute;
		top: 59px;
		left: 0;
		&.over{
			background:url(../assets/images/over_get.png) no-repeat center center;
			background-size: 100% 100%;
			pointer-events: none;
		}
        &.no_get{
        	background:url(../assets/images/noget.png) no-repeat center center;
        	background-size: 100% 100%;
        	pointer-events: none;
        }
	}
</style>
