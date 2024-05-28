<template>
  <div class="home_wrap">
    <van-swipe
      :autoplay="2500"
      class="swiper-container"
      @change="onChange"
    >
      <van-swipe-item
        v-for="(image, index) in banner"
        :key="index"
      >
        <router-link :to="image.url">
          <img :src="image.path">
        </router-link>
      </van-swipe-item>
      <div
        ref="dian"
        slot="indicator"
        class="custom-indicator"
      >
        <div
          v-for="(img, x) in banner"
          :key="x"
          :class="x===0?'selected':''"
        />
      </div>
    </van-swipe>
    <div
      v-show="loading"
      class="new_people_box"
    >
      <div class="lf_bg" />
      <div class="pt_bg" />
      <div
        class="xr_left"
        @click="$router.push('/newwalfare')"
      >
        <div class="content_img">
          <img
            src="../images/index/ico2.png"
            alt=""
          >
        </div>
        <p>新人福利</p>
      </div>
      <div
        class="xr_center"
        @click="$router.push('/newshop')"
      >
        <div class="content_img c1">
          <img
            :src="newimages[0]"
            alt=""
          >
        </div>
        <div class="content_img c2">
          <img
            :src="newimages[1]"
            alt=""
          >
        </div>
        <p>新人专享省钱计划</p>
      </div>
      <div
        class="xr_right"
        @click="$router.push('/newtask')"
      >
        <div class="content_img">
          <img
            src="../images/index/ico1.png"
            alt=""
          >
        </div>
        <p>新人任务</p>
      </div>
    </div>
    <div
      v-show="!loading"
      class="new_people_box"
    >
      <div class="query_box box1" />
      <div class="query_box box2" />
      <div class="query_box box3" />
    </div>
    <div
      v-show="loading"
      class="shop_box"
    >
      <div
        v-for="i in cats"
        class="item"
        @click="typeGo(i.id,i.name)"
      >
        <div class="item_img">
          <img
            :src="i.img1"
            alt=""
          >
        </div>
        <p class="item_title">
          {{ i.name }}
        </p>
      </div>
    </div>
    <div
      v-show="!loading"
      class="shop_box query"
    >
      <div
        v-for="i in 10"
        class="item"
      >
        <div class="item_img" />
        <p class="item_title" />
      </div>
    </div>
    <div
      v-if="activityData.show_activity > 0"
      class="sale_box"
    >
      <div
        v-show="!loading"
        class="query_box"
      >
        <div class="q q0" />
        <div class="q q1" />
        <div class="q q2" />
        <div class="q q3" />
        <div class="q q4" />
      </div>
      <div class="sale_bg">
        <img
          :src="activityData.image"
          alt=""
        >
      </div>
      <router-link
        :to="activityData.link"
        class="s0"
      />
      <router-link
        :to="activityData.fuli1"
        class="s1"
      />
      <router-link
        :to="activityData.fuli2"
        class="s2"
      />
      <router-link
        :to="activityData.fuli3"
        class="s3"
      />
      <router-link
        :to="activityData.fuli4"
        class="s4"
      />
    </div>
    <div
      v-if="seckillData.show_seckill"
      class="seckill_box"
    >
      <div class="kill_tit">
        <div class="kill_wrap">
          <div class="tit">
            商品秒杀
          </div>
          <!-- <div class="active_time">12点场</div> -->
        </div>
        <div
          v-show="showCount"
          class="kill_wrap"
        >
          <p
            v-if="stimeCountTime>0"
            class="count_tip"
          >
            <span class="advance" />距离本场开始
          </p>
          <p
            v-else
            class="count_tip"
          >
            </span>距离本场结束
          </p>
          <div class="count_time">
            <div class="count con1">
              {{ timer.hr }}
            </div>
            <span>:</span>
            <div class="count con2">
              {{ timer.min }}
            </div>
            <span>:</span>
            <div class="count con3">
              {{ timer.sec }}
            </div>
          </div>
        </div>
      </div>
      <div class="kill_list">
        <div
          v-for="item in seckillData.data.item"
          class="kill_item"
          @click="$router.push('/seckill')"
        >
          <img
            :src="item.thumb"
            alt=""
          >
          <p class="van-multi-ellipsis--l2">
            {{ item.title }}
          </p>
          <div
            class="kill_price numberFont"
            v-html="'<span>¥</span>'+$parent.bigNumeber(item.price)"
          />
          <div class="old_price">
            ¥{{ item.original_price }}
          </div>
        </div>
      </div>
    </div>
    <div
      v-if="memberDate.show_member_items"
      class="vip_box"
      @click="$router.push('/vipshop')"
    >
      <div class="vip_tit">
        会员专区
      </div>
      <div class="vip_tips">
        更多惊喜 更多优惠
      </div>
      <div class="vip_bg" />
      <div class="vip_shop">
        <div
          v-for="i in memberDate.list"
          class="vip_item"
        >
          <img
            :src="i.img"
            alt=""
          >
          <p class="item_tit">
            {{ i.title }}
          </p>
          <p class="vip_price">
            ¥{{ i.min }}
          </p>
        </div>
      </div>
    </div>
    <div
      v-if="recommend.show_recommend"
      class="recom_box"
    >
      <h5 class="item_tit">
        系统推荐
      </h5>
      <div class="recom_list colume1">
        <div
          v-for="i in recommend.list"
          :key="i.id"
          class="item"
          @click="$router.push('/details/'+i.id)"
        >
          <img
            :src="i.img"
            alt=""
          >
          <div class="item_wrap">
            <p class="recom_tit van-ellipsis">
              {{ i.title }}
            </p>
            <p
              class="recom_price van-ellipsis numberFont"
              v-html="'<span>¥</span>'+$parent.bigNumeber(i.min)"
            />
            <div class="item_time">
              <i />
              周期：{{ i.day }}
            </div>
            <p class="sy_day">
              每日收益<span v-html="$parent.numFilter(i.min*i.rate/100)" />元，合计<span v-html="$parent.numFilter(i.min*i.rate/100*i.day)" />元
            </p>
          </div>
        </div>
      </div>
    </div>
    <div
      v-if="hotData.show_high_sales_items"
      class="hot_box"
    >
      <div class="home_tit">
        <div class="line l1" />
        <h5>精选热卖</h5>
        <div class="line l2" />
      </div>
      <div class="hot_list">
        <div
          v-for="item in hotData.list"
          class="item"
          @click="$router.push('/details/'+item.id)"
        >
          <img
            :src="item.img"
            alt=""
          >
          <p class="hot_tit van-multi-ellipsis--l2">
            {{ item.title }}
          </p>
          <p
            class="hot_prize numberFont"
            v-html="'<span>¥</span>'+$parent.bigNumeber(item.min)"
          />
        </div>
      </div>
    </div>
    <div
      v-show="show_img"
      class="mask"
      @click="hideDown"
    >
      <div class="wrapper">
        <div
          class="close_ad"
          @click="hideDown"
        />
        <div
          class="icon"
          @click.stop="goToAdvert"
        >
          查看详情
        </div>
        <div
          class="block"
          @click.stop
        >
          <img
            :src="home_advert.activity_img"
            @click.stop="goToAdvert"
          >
        </div>
      </div>
    </div>
    <div
      v-if="msg_show"
      class="kefu"
      :class="show_kefu?'':'kefu_hide'"
      @click="kefu_to"
    >
      <img
        class="kefu_img"
        src="../images/index/kefu.png"
      >
    </div>
  </div>
</template>

<script>

    import Vue from 'vue';
    import Fetch from '../../utils/fetch'
    import {Swipe, SwipeItem, NoticeBar, Overlay, Icon} from "vant";

    Vue.use(NoticeBar).use(Overlay).use(Icon);

    export default {
        name: "Index",
        components: {
            VanSwipe: Swipe,
            VanSwipeItem: SwipeItem,
        },
        data() {
            return {
                show_kefu:false,
                msg_show: true,
                banner: [],
                loading: false,
                showCount: true,
                icon: [],
                newimages:['',''],
                data: {},
                cats: [],
                islogin: false,
                show_img: false,
                newPeople: false,
                home_advert: {},
                activityData: {},
                memberDate:{},
                recommend:{},
                hotData:{},
                timer: {
                    hr:'',
                    min: '',
                    sec:''
                },
                countTime:'',
                stimeCountTime: '',
                seckillData:{}
            };
        },
        created() {
            this.$parent.footer('index');
        },
        mounted() {
            this.start();
            var that = this;
            document.body.addEventListener("scroll",function(){
                if(!that.show_kefu){
                    return;
                }
                that.show_kefu = false;
            },false);
            document.addEventListener('click',function(ev){
                if(ev.target.className != 'kefu_img'){
                    that.show_kefu = false;
                }
            },false);
        },
        methods: {
            kefu_to(){
            if(this.show_kefu){
                this.$router.push('/kefu');
            }
            this.show_kefu = !this.show_kefu;

            },
            hideDown() {
                this.show_img = false;
                this.$store.commit('setShowAdvert', false);
            },
            countdown: function () {
                if(this.seckillData.show_seckill){
                    
                    var msec;
                    if(this.stimeCountTime){
                        msec = this.stimeCountTime
                    }else{
                        msec = this.countTime;
                    }
                    if (msec >= 0 && msec <=360000) {
                        let hr = parseInt(msec / 60 / 60)
                        let min = parseInt(msec / 60 % 60)
                        let sec = parseInt(msec % 60)
                        this.timer.hr = hr > 9 ? hr : '0' + hr
                        this.timer.min = min > 9 ? min : '0' + min
                        this.timer.sec = sec > 9 ? sec : '0' + sec
                        
                        if(this.stimeCountTime){
                            this.stimeCountTime-=1;
                        }else{
                            this.countTime-=1;
                        }
                        const that = this
                        setTimeout(function () {
                            that.countdown()
                        }, 1000)
                    }else if(msec >360000){
                        this.showCount = false;
                    }else{
                        return;
                    }
                    
                }
            },
            start() {
                var show_advert = this.$store.state.home.show_advert;
                Fetch('/index/int').then((r) => {
                    this.data = r.data;
                    
                    this.loading = true;
                    
                    // 轮播
                    this.banner = r.data.banner;
                    
                    // 新人
                    this.newPeople = r.data.new_lottery;
                    if(r.data.new_lottery.data.length!=0){
                        this.newimages = r.data.new_lottery.data.images
                    }
                    
                    // 商品分类
                    this.cats = r.data.cats;
                    
                    // 活动入口
                    this.activityData = r.data.activity;
                    
                    // 会员专区
                    this.memberDate = r.data.member_items;
                    
                    // 系统推荐
                    this.recommend = r.data.recommend;
                    
                    // 精选热卖
                    this.hotData = r.data.high_sales_items;
                    
                    // 秒杀
                    this.seckillData = r.data.seckill;
                    this.countTime = this.seckillData.data.rest_second;
                    this.stimeCountTime = this.seckillData.data.stime_second;
                    this.countdown();
                    
                });
                Fetch("/index/webconfig").then((r) => {
                    this.home_advert = r.data.ad;
                    if (r.data.ad.activity_status && r.data.ad.activity_img) {
                        this.show_img = true;
                    }

                });

            },
            typeGo(id,one){
                this.$router.push({
                    path: 'type',
                    query: {
                        id: id,
                        type1:one,
                    },
                })
            },
            onChange(index) {
                let els = this.$refs.dian.querySelectorAll("div");
                for (let i = 0; i < els.length; i++) {
                    els[i].className = "";
                }
                els[index].className = "selected";
            },
            // to(id) {
            //     this.$router.push('/details/' + id);
            // },
            // iconTo(url) {
            //     this.$router.replace(url);
            // },
            goToAdvert() {
				if (this.home_advert.url) {
				    if (this.home_advert.url.indexOf("http") > -1) {
				      window.location.href = this.home_advert.url;
				    } else {
				      this.$router.push({ path: "/" + this.home_advert.url });
				    }
				}
            }
        }
    };
</script>

<style lang="less" scoped>
    .home_wrap{
        width: 100%;
        min-height: 100vh;
        background-color: #F6F6F6;
    }
    .custom-indicator {
        position: absolute;
        height: 4px;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        bottom: 11px;
        left: 0;
        div{
            width:10px;
            height:4px;
            background:rgba(255,255,255,1);
            border-radius:2px;
            opacity:0.5;
            margin: 0 2px;
            float: left;
            transition: all 0.3s;
        }
        div.selected{
            width:17px;
            height:4px;
            background:rgba(255,255,255,1);
            border-radius:2px;
            opacity: 1;
        }
    }
    .swiper-container{
        width: 100%;
        height: 154px;
        .van-swipe-item{
            overflow: hidden;
        }
        a{
            float: left;
            width: 100%;
            height: 100%;
        }
        img{
            height: 100%;
            width: 100%;
        }
    }
    .new_people_box{
        width: 100%;
        height: 139px;
        background:linear-gradient(180deg,rgba(233,75,66,1) 0%,rgba(213,21,21,0) 100%);
        position: relative;
        .lf_bg{
            width: 100%;
            height: 122px;
            background: url(../images/index/lf.png) no-repeat center center;
            background-size: 100% 100%;
            position: absolute;
            top: 17px;
            left: 0;
            z-index: 1;
        }
        .pt_bg{
            width: 351px;
            height: 34px;
            background: url(../images/index/pt.png) no-repeat center center;
            background-size: 100% 100%;
            position: absolute;
            bottom: 0px;
            left: 12px;
            z-index: 2;
        }
        .xr_left,.xr_right{
            width: 75px;
            height: 75px;
            position: absolute;
            bottom: 19px;
            z-index: 3;
            p{
                width: 100%;
                font-size: 12px;
                line-height: 17px;
                color: #FFFFFF;
                text-align: center;
                position: absolute;
                left: 0;
                bottom: 1px;
            }
            .content_img{
                width: 36px;
                height: 39px;
                position: absolute;
                left: 20px;
                top: 10px;
                img{
                    width: 100%;
                    height: 100%;
                }
            }
        }
        
        .xr_right .content_img{
            width: 46px;
            height: 41px;
            position: absolute;
            left: 16px;
            top: 9px;
        }
        .xr_left{
            left: 22px;
            background: url(../images/index/xr_left.png) no-repeat center center;
            background-size: 100% 100%;
        }
        .xr_right{
            right: 22px;
            background: url(../images/index/xr_right.png) no-repeat center center;
            background-size: 100% 100%;
        }
        .xr_center{
            width: 168px;
            height: 123px;
            background: url(../images/index/xr_center.png) no-repeat center center;
            background-size: 100% 100%;
            position: absolute;
            bottom: 3px;
            left: 104px;
            z-index: 3;
            p{
                line-height: 21px;
                font-size: 15px;
                font-weight: bold;
                position: absolute;
                left: 12px;
                bottom: 7px;
                color: #FFFFFF;
            }
            .content_img{
                width: 58px;
                height: 58px;
                position: absolute;
                top: 28px;
                &.c1{
                    left: 18px;
                }
                &.c2{
                    right: 18px;
                }
                img{
                    width: 100%;
                    height: 100%;
                }
            }
        }
    }
    .shop_box{
        width: 351px;
        margin: 9px auto 0 auto;
        background:rgba(255,255,255,1);
        border-radius:16px;
        padding: 17px 8px 4px 8px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        .item{
            width: 44px;
            height: 64px;
            margin: 0 11px 12px 11px;
            .item_img{
                width: 44px;
                height: 44px;
                border-radius: 5px;
                overflow: hidden;
                img{
                    width: 100%;
                    height: 100%;
                }
            }
            .item_title{
                width: 180%;
                margin-left: -40%;
                line-height: 14px;
                font-size: 12px;
                color: #333333;
                margin-top: 8px;
                text-align: center;
                transform: scale(0.85);
            }
        }
    }
    .shop_box.query{
        .item{
            
            .item_img{
                border-radius: 5px;
                background: #f0f0f0;
            }
            .item_title{
                width: 100%;
                height: 14px;
                margin-left: 0;
                background: #f0f0f0;
            }
        }
        
    }
    .vip_box{
        width:351px;
        height:103px;
        background:rgba(255,255,255,1);
        border-radius:13px;
        margin: 10px auto 0 auto;
        position: relative;
        padding-right: 10px;
        display: flex;
        justify-content: flex-end;
        .vip_tit{
            height:22px;
            font-size:16px;
            font-weight:600;
            color:rgba(138,85,45,1);
            line-height:22px;
            position: absolute;
            top: 10px;
            left: 14px;
        }
        .vip_tips{
            height:14px;
            font-size:12px;
            color:rgba(160,141,119,1);
            line-height:14px;
            position: absolute;
            top: 30px;
            left: 14px;
            transform: scale(0.85) translateX(-6px);
        }
        .vip_bg{
            width: 78px;
            height: 63px;
            background: url(../images/index/vipbg.png) no-repeat center center;
            background-size: 100% 100%;
            position: absolute;
            left: 0;
            bottom: 0;
        }
        .vip_shop{
            display: flex;
            justify-content: space-between;
            align-items: center;
            .vip_item{
                width: 71px;
                height: 96px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                margin-left: 5px;
                img{
                    width: 71px;
                    height: 64px;
                }
                .item_tit{
                    width: 100%;
                    height:16px;
                    line-height: 16px;
                    font-size: 12px;
                    background:rgba(248,238,212,1);
                    border-radius:0px 0px 4px 4px;
                    text-align: center;
                    color: #A07E55;
                    overflow: hidden;
                }
                .vip_price{
                    line-height: 14px;
                    text-align: center;
                    font-size: 12px;
                    color: #333333;
                    margin-top: 4px;
                }
            }
        }
    }
    .sale_box{
        width: 375px;
        height: 343px;
        margin-top: 9px;
        position: relative;
        .sale_bg{
            position: absolute;
            top: 0;
            right: 0;
            z-index: 1;
            img{
                width: 100%;
                height: 100%;
            }
        }
        .s0,.q0{
            width: 348px;
            height: 88px;
            position: absolute;
            top: 91px;
            left: 14px;
            z-index: 3;
            img{
                width: 100%;
                height: 100%;
            }
        }
        .s1,.s2,.s3,.s4,.q1,.q2,.q3,.q4{
            width: 171px;
            height: 72px;
            position: absolute;
            z-index: 3;
            img{
                width: 100%;
                height: 100%;
            }
        }
        .q{
            background: #f0f0f0;
        }
        .s1,.q1{
            top: 182px;
            left: 14px;
        }
        .s2,.q2{
            top: 182px;
            left: 189px;
        }
        .s3,.q3{
            top: 258px;
            left: 14px;
        }
        .s4,.q4{
            top: 258px;
            left: 189px;
        }
        
        .query_box{
            position: absolute;
            z-index: 5;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: #f6f6f6;
        }
    }
    
    
    .seckill_box{
        width:351px;
        padding: 11px 13px 0px 13px;
        background:rgba(255,255,255,1);
        border-radius:13px;
        margin: 12px auto 0 auto;
        .kill_tit{
            display: flex;
            justify-content: space-between;
            align-items: center;
            .kill_wrap{
                display: flex;
                justify-content: flex-start;
                align-items: center;
            }
            .tit{
                font-size: 16px;
                font-weight:600;
                color:rgba(0,0,0,.8);
                line-height:22px;
            }
            .active_time{
                height: 21px;
                line-height: 21px;
                padding: 0 5px;
                color: #FF1300;
                font-size: 12px;
                font-weight: 400;
                border-radius:11px;
                border:1px solid rgba(241,34,17,1);
                background-color: #FEEEEC;
                margin-left: 5px;
            }
            .count_tip{
                height:18px;
                font-size:12px;
                color:rgba(86,85,91,1);
                line-height:18px;
                display: flex;
                align-items: center;
                justify-content: flex-start;
            }
            .count_time{
                display: flex;
                justify-content: space-between;
                font-size: 12px;
                text-align: center;
                margin-left: 8px;
                .count{
                    width:20px;
                    height:18px;
                    line-height:18px;
                    background:rgba(65,64,70,1);
                    border-radius:3px;
                    color: #FFFFFF;
                }
                span{
                    width: 6px;
                    height: 18px;
                    line-height: 18px;
                    color: #414046;
                }
            }
        }
        .kill_list{
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 10px;
            .kill_item{
                width: 100px;
                display: flex;
                flex-direction: column;
                margin-bottom: 8px;
                img{
                    width: 100px;
                    height: 100px;
                }
                p{
                    line-height: 20px;
                    height: 40px;
                    color: #414046;
                    font-size:12px;
                    margin-top: 6px;
                }
                .kill_price{
                    display: flex;
                    justify-content: flex-start;
                    align-items: baseline;
                    height: 21px;
                    line-height: 21px;
                    margin-top: 0px;
                    white-space: nowrap;
                    font-size: 15px;
                    font-weight: bold;
                    color:#f12211;
                }
                .old_price{
                    font-size: 12px;
                    line-height: 17px;
                    margin-top: -2px;
                    color:#B3B3B3;
                    text-decoration: line-through;
                }
            }
        }
    }
    
    .scroll_wrap::-webkit-scrollbar {
        display: none;
    }
    .recom_box{
        width:351px;
        background:rgba(255,255,255,1);
        border-radius:13px;
        margin: 10px auto 0 auto;
        .item_tit{
            height: 44px;
            line-height: 44px;
            font-size: 16px;
            color: rgba(0,0,0,.8);
            border-bottom: 1px solid #F7F7F7;
            padding: 0 14px;
        }
		.colume1.recom_list{
			.item{
				width: 100%;
				padding: 8px 4px;
				&:last-of-type{
					border-bottom: none;
				}
				img{
					width: 80px;
					height: 80px;
					margin-left: 0;
					border-radius: 13px;
				}
				.item_wrap{
					margin-left: 13px;
					width: 249px;
					height: 100%;
					position: relative;
					.recom_tit{
						width: 249px;
						height: auto;
					}
					.sy_day{
						margin-top: 15px;
						font-size: 12px;
						color: rgba(0, 0, 0, 0.6);
						span{
							font-weight: bold;
							color: #f12211;
							margin: 0 3px;
						}
					}
					
					.item_time{
						position: absolute;
						height: 14px;
						line-height: 14px;
						font-size: 12px;
						color: rgba(0, 0, 0, 0.6);
						display: flex;
						align-items: center;
						right: 11px;
						top: 27px;
						i{
							display: inline-block;
							width: 14px;
							height: 14px;
							background: url(../images/index/time.png) no-repeat center center;
							background-size: 100% 100%;
							margin-right: 5px;
						}
					}
				}
			}
		}
        .recom_list{
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            .item{
                width: 50%;
                height: 90px;
                padding: 0 6px 0 10px;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                border-bottom: 1px solid #F7F7F7;
                &:nth-of-type(odd){
                    border-right: 1px solid #F7F7F7;
                }
                .item_wrap{
                    flex: 1;
                    .recom_tit {
                        font-size: 13px;
                        line-height: 18px;
                        height: 36px;
                        color: rgba(0,0,0,.8);
                        font-weight: bold;
                    }
                    .recom_price{
                        line-height: 18px;
                        margin-top: 3px;
                        font-size: 13px;
                        font-weight: bold;
                        color: #F03041;
                    }
                }
                img{
                    width: 60px;
                    height: 60px;
                    margin-left: 7px;
                }
            }
        }
    }
    .hot_box{
        margin-top: 16px;
        .hot_list{
            width: 100%;
            background:linear-gradient(180deg,rgba(255,255,255,1) 0%,rgba(255,255,255,0.02) 100%);
            border-radius:18px;
            padding: 14px 12px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 12px;
            .item{
                width: 172px;
                padding-bottom: 10px;
                background-color: #FFFFFF;
                border-radius: 6px;
                margin-bottom: 6px;
                overflow: hidden;
                img{
                    display: block;
                    width: 100%;
                    height: 172px;
                }
                .hot_tit{
                    width: 144px;
                    margin: 9px auto 0 auto;
                    color:#455A64;
                    font-size:12px;
                    line-height: 17px;
                }
                .hot_prize{
                    width: 144px;
                    margin: 7px auto 0 auto;
                    height:18px;
                    font-size:13px;
                    font-weight:600;
                    color:rgba(240,48,65,1);
                    line-height:18px;
                }
            }
        }
    }
    .advance{
        width: 35px;
        height: 16px;
        background: url(../images/index/ad.png) no-repeat center center;
        background-size: 100% 100%;
        margin-right: 4px;
    }
    .new_people_box{
        position: relative;
        .box1,.box3{
            width: 75px;
            height: 75px;
            top: 45px;
        }
        .box1{
            left: 22px;
        }
        .box3{
            right: 22px;
        }
        .box2{
            width: 154px;
            height: 123px;
            top: 13px;
            left: 111px;
        }
    }
    .query_box{
        background: #F0F0F0;
        border-radius: 10px;
        position: absolute;
    }
    .mask{
        position: fixed;
        z-index: 100;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.6);
        .wrapper{
            width: 262px;
            height: 418px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -209px;
            margin-left: -131px;
        }
        .close_ad{
            width: 24px;
            height: 24px;
            background: url(../images/index/close.png) no-repeat center center;
            background-size: 100% 100%;
            position: absolute;
            right: 20px;
            top: 22px;
            z-index: 15;
        }
        .block{
            width: 235px;
            height: 340px;
            position: absolute;
            top: 25px;
            left: 14px;
            img{
                width: 100%;
            }
        }
        .icon{
            width: 126px;
            height: 34px;
            background: #f9481a;
            text-align: center;
            line-height: 34px;
            color: #ffffff;
            font-size: 15px;
            border-radius: 17px;
            position: absolute;
            z-index: 3;
            left: 66px;
            bottom: 20px;
            box-shadow: 0px 2px 10px rgba(240,48,65,1);
        }
    }
</style>