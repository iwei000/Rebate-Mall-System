<template>
  <div class="basic_wrap">
    <bsHeader title="确认订单"></bsHeader>
    <div class="item_for" v-for="item in data.item_list" :key="item.item_id">
      <div class="item_wrap">
        <div class="top_detail">
          <div class="item_img">
            <img :src="item.img" alt />
          </div>
          <div class="detail_box">
            <p
              class="item_name van-multi-ellipsis--l2"
              @click="$router.push('/details/'+item.item_id)"
            >{{item.title}}</p>
            <div class="limit_box" v-if="item.num == 1">
              <div class="limit">限购：每人1单</div>
            </div>
            <p class="price" v-else>¥{{item.min}}</p>
          </div>
        </div>
        <div class="buy_details">
          <p class="del_tit">购买数量</p>
          <div class="cut_num">
            <div class="cut cut_del" @click="del(item)">-</div>
            <input type="number" :max="10" @input="inpChange(item)" v-model="item.number" />
            <div class="cut cut_add" @click="add(item)">+</div>
          </div>
        </div>

        <!-- 代金券 -->
        <!-- <div v-if="couponList.length > 0">
          <div class="buy_details" v-if="item.voucher.num > 0">
            <div class="del_tit">代金券</div>
            <div class="del_type">共使用 {{item.voucher.num}} 张代金券</div>
            <div class="del_money">- ￥{{item.voucher.total_money}}</div>
            <div class="look_more_tick" @click="chooseTickShow(item)"></div>
          </div>
          <div class="buy_details" v-if="couponShow(item)">
            <div class="del_tit">代金券</div>
            <div class="del_type">您还有代金券未使用</div>
            <div class="look_more_tick" @click="chooseTickShow(item)"></div>
          </div>
        </div> -->

        <!-- <div v-if="showCoupon">
          <div class="buy_details" v-if="item.voucher.num!=0">
            <div class="del_tit">代金券</div>
            <div class="del_type">共使用 {{item.voucher.num}} 张代金券</div>
            <div class="del_money">- ￥{{item.voucher.total_money}}</div>
            <div class="look_more_tick" @click="chooseTickShow(item.item_id)"></div>
          </div>
          <div class="buy_details" v-else>
            <div class="del_tit">代金券</div>
            <div class="del_type">您还有代金券未使用</div>
            <div class="look_more_tick" @click="chooseTickShow(item.item_id)"></div>
          </div>
        </div>-->

        <!-- <div class="buy_details" v-if="item.discount != 0">
          <div class="del_tit discount">可享受优惠卷金额：</div>
          <div class="del_type">￥{{item.coupons.money}} * {{item.coupons.num}}张</div>
          <div class="del_money">- {{item.discount}}元</div>
        </div> -->
        <div class="buy_details">
          <div class="del_tit" v-if="item.num==1">新人专享</div>
          <div class="del_tit" v-if="item.is_special==1">VIP折扣</div>
		  <div class="del_tit" v-if="item.discount > 0&&item.is_special==0">限时优惠</div>
          <div class="del_type" v-if="item.is_special==1" >{{item.vip_name}} 享{{item.user_vip_rebate}}折</div>
          <div class="del_money" v-if="item.is_special==1">- ￥{{$parent.numFilter(item.special_money+item.discount*item.number)}}</div>
		  <div class="del_money" v-else>- ￥{{item.discount*item.number}}</div>
        </div>
        <div class="hairline"></div>
        <div class="income">
          <div class="tit">订单收益</div>
          <div class="income_money">收益￥{{$parent.numFilter(item.apr_money*item.number)}} / {{item.day}}天</div>
        </div>
        <div class="income_msg">收益模式：{{item.type_name}}</div>
        <div class="income_msg" v-if="item.is_special==1">应付本金：{{$parent.numFilter((item.min-item.discount)*item.number-item.special_money)}}元</div>
		<div class="income_msg" v-else>应付本金：{{$parent.numFilter((item.min-item.discount)*item.number)}}元</div>
      </div>
      <div class="invest_tips">
        <i></i>
        <p>节假日照常收益</p>
      </div>
    </div>
	<div class="money_no" v-if="parseFloat(data.user_money)<parseFloat(data.actual_money)">
	  <p>
	    您的账户余额不足，请
	    <router-link to="/invest">立即充值</router-link>
	    <i></i>
	  </p>
	</div>
    <div class="pay_type">
      <p class="tit">支付方式</p>
      <div class="pay">
        <div class="pay_tip">支付余额（¥{{data.user_money}}）</div>
        <!-- <div class="look_more_tick"></div> -->
      </div>
    </div>
	<!-- 优惠券单元格 -->
	<van-coupon-cell
	  :coupons="coupons"
	  title="代金券"
	  :chosen-coupon="chosenCoupon"
	  @click="showList = true"
	  style="margin-bottom: 15px;"
	  v-if="data.is_coupon"
	/>
	<!-- 优惠券列表 -->
	<van-popup
	  v-model="showList"
	  round
	  position="bottom"
	  style="height: 80%; padding-top: 4px;"
	>
	  <van-coupon-list
		:coupons="coupons"
		:chosen-coupon="chosenCoupon"
		:disabled-coupons="disabledCoupons"
		:show-exchange-bar = "false"
		:show-close-button = "false"
		@change="onChange"
	  />
	</van-popup>
    <div class="shop_money_box">
      <p class="all_num">共{{itemNum}}件</p>
      <p class="tit">应付合计</p>
      <p class="all_money">¥{{parseFloat(data.actual_money-discount).toFixed(2)}}</p>
      <div
        class="sub_btn"
        :class="parseFloat(data.user_money)<parseFloat(data.actual_money)?'notouch':''"
        @click="write_psd = true"
      >立即支付</div>
    </div>
    <!-- 输入密码 -->
    <van-popup v-model="write_psd" closeable close-icon="close" round position="bottom">
      <div class="psw_box">
        <h5 class="write_tit">支付</h5>
        <div class="recharge_price">
          <span>¥</span>
          {{data.actual_money}}
        </div>
        <p class="tips">请输入支付密码</p>
        <van-password-input
          :value="psd_val"
          :mask="true"
          :focused="showKeyboard"
          @focus="showKeyboard = true"
        />
        <router-link tag="div" to="/setpaypwd?redirect=confirm" class="get_pwd">找回支付密码</router-link>
        <div class="keybord_box">
          <div class="keybord">
            <div class="key_item" v-for="i in 9" @click="onInput(i)" :key='i'>
              <div class="key_inner">{{i}}</div>
            </div>
            <div class="key_item no_bg">
              <div class="key_inner"></div>
            </div>
            <div class="key_item" @click="onInput(0)">
              <div class="key_inner">0</div>
            </div>
            <div class="key_item no_bg x" @click="onDelete">
              <div class="key_inner">x</div>
            </div>
          </div>
        </div>
      </div>
    </van-popup>
  </div>
</template>

<script>
import Vue from "vue";
import Fetch from "../../utils/fetch";
import bsHeader from "../../components/bsHeader.vue";
import { Popup,CouponCell, CouponList } from "vant";
import { PasswordInput, NumberKeyboard } from "vant";

Vue.use(PasswordInput).use(NumberKeyboard).use(Popup).use(CouponCell).use(CouponList);

export default {
  name: "item",
  data() {
    return {
      data: {},
      psd_val: "",
	  chosenCoupon: -1,
	  discount:0,
	  coupon_id:0,
	  coupons: [],
	  disabledCoupons: [],
	  showList:false,
      showKeyboard: true,
      write_psd: false,
      openId: "",
      itemNum: 0,
    };
  },
  components: {
    bsHeader
  },
  created() {
    this.$parent.footer("item", false);
  },
  mounted() {
    if (location.href.indexOf("change") != -1) {
      var items = localStorage.getItem("cart");
      var pwd = sessionStorage.getItem("pwd");
      Fetch("/item/info/apply", {
        items: items,
        password: pwd
      }).then(r => {
        this.$router.replace("/order");
      });
    }

    this.start();
  },
  methods: {
	onChange(index) {
		this.showList = false;
		this.chosenCoupon = index;
		if(index>=0){
			this.discount = this.coupons[index].value/100;
			this.coupon_id = this.coupons[index].id;
		}else{
			this.discount = 0;
			this.coupon_id = 0;
		}
	},
    timer(t) {
      var time = new Date(t * 1000);
      return (
        time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate()
      );
    },
    getGoodsList(params = {}) {
      return new Promise((resolve, reject) => {
        Fetch("/index/item_check", params).then(res => {
          resolve(res.data || []);
		  this.itemNum = res.data.item_list.length;
        });
      });
    },
    start() {
      const selectedGoodsJsonStr = localStorage.getItem("cart");
	  Fetch('/user/coupon', {items: selectedGoodsJsonStr}).then(res => {
	  	this.coupons = res.data.coupons;
	  	this.disabledCoupons = res.data.disabledCoupons;
	  	this.user_money = res.data.user_money
	  })
      if (selectedGoodsJsonStr) {
        Promise.all([
          this.getGoodsList({
            items: selectedGoodsJsonStr
          }),
        ]).then(res => {
          const [goodsData] = res;
          const goodsList = [];
          goodsData.item_list.forEach(v => {
            const receiveIds = [];
            goodsList.push({
              item_id: v.item_id,
              num: v.number,
            });
          });
          localStorage.setItem("cart", JSON.stringify(goodsList));
          this.data = goodsData;
        });
      } else {
        this.$toast("无效进入");
        this.$router.replace("/cart");
      }
    },
    checkPrice(payload) {
      const goodsList = JSON.parse(localStorage.getItem("cart"));
      const goodsItem = goodsList.find(v => v.item_id == payload.item_id);
      if (goodsItem) {
        goodsItem.num = payload.number;
      }
      localStorage.setItem("cart", JSON.stringify(goodsList));
      this.start();
    },

    shopIndex(id) {
      var idx = 0;
      this.data.item_list.forEach((item, index) => {
        if (item.item_id == id) {
          idx = index;
        }
      });
      return idx;
    },
    add(payload) {
      if (
        (payload.num == 1 && payload.number >= payload.stock) ||
        payload.number >= payload.num
      ) {
        return;
      }
      payload.number = parseInt( payload.number )+1
      this.checkPrice(payload);
    },
    inpChange(payload) {
      if (payload.number >= payload.stock) {
        payload.number = payload.stock;
      } else if (payload.number >= payload.num) {
        payload.number = payload.num;
      } else if (payload.number <= 1) {
        payload.number = 1;
      }

      this.checkPrice(payload);
    },
    del(payload) {
      if (payload.number <= 1) {
        return;
      }
      payload.number -= 1;
      this.checkPrice(payload);
    },
    onInput(key) {
      this.psd_val = (this.psd_val + key).slice(0, 6);
      if (this.psd_val.length == 6) {
        var items = localStorage.getItem("cart");
        Fetch("/index/item_apply", {
          items: items,
          password: this.psd_val,
		  coupon_id:this.coupon_id,
        }).then(r => {
          this.$router.replace("/order");
        }).catch(err=>{
            this.psd_val = '';
        })
      }
    },
    onDelete() {
      this.psd_val = this.psd_val.slice(0, this.psd_val.length - 1);
    }
  }
};
</script>

<style lang="less" scoped>
.item_for {
  margin-bottom: 10px;
}

.notouch {
  pointer-events: none;
  background: #999999;
}

.red_top_bg {
  position: fixed;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
}

.basic_wrap {
  position: relative;
}

.item_wrap {
  width: 375px;
  padding: 16px 16px 20px 16px;
  background: rgba(255, 255, 255, 1);
  box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
  border-radius: 6px;
  margin-bottom: 12px;

  .top_detail {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    margin-bottom: 17px;

    .item_img {
      width: 80px;
      height: 80px;

      img {
        width: 100%;
        height: 100%;
      }
    }

    .detail_box {
      flex: 1;
      margin-left: 18px;
      display: flex;
      flex-direction: column;

      .item_name {
        height: 40px;
        font-size: 14px;
        font-weight: 600;
        color: rgba(0,0,0,.8);
        line-height: 20px;
      }

      .limit_box {
        margin-top: 5px;
        height: 20px;

        .limit {
          display: inline-block;
          vertical-align: top;
        }
      }

      .price {
        height: 21px;
        font-size: 15px;
        font-weight: 600;
        color: #f12211;
        line-height: 21px;
        margin-top: 5px;
      }
    }
  }

  .cut_num {
    flex: 1;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-right: 5px;

    input {
      width: 39px;
      height: 21px;
      background: rgba(242, 242, 242, 1);
      font-size: 12px;
      color: rgba(0, 0, 0, 0.8);
      text-align: center;
      margin: 0 7px;
    }

    .cut {
      width: 11px;
      height: 21px;
      line-height: 21px;
      font-size: 20px;
      color: #757880;
      text-align: center;
    }
  }

  .buy_details {
    width: 100%;
    height: 14px;
    line-height: 14px;
    font-size: 12px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    margin-bottom: 20px;

    .del_tit {
      width: 69px;
      font-weight: bold;
    }
    .discount{
      flex: 1;
    }

    .del_type {
      width: 177px;
    }

    .del_money {
      width: 79px;
      text-align: right;
      color: #f12211;
      margin-left: auto;
    }

    .look_more_tick {
      width: 14px;
      height: 14px;
      background: url(../images/item/more.png) no-repeat center center;
      background-size: 100% 100%;
      margin-left: auto;
    }
  }

  .income,
  .income_msg {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 14px;
    line-height: 14px;
    margin-top: 16px;
    font-size: 12px;
    font-weight: bold;

    .income_money {
      color: #f12211;
      margin-right: 18px;
    }
  }
}

.hairline {
  border-bottom: 1px solid #ececec;
}

.basic_wrap {
  margin-top: 64px;
}

.invest_tips {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  line-height: 14px;
  height: 18px;
  font-size: 12px;
  margin-top: 16px;
  color: #f12211;
  padding: 0 15px;
  font-weight: bold;

  i {
    width: 14px;
    height: 14px;
    background: url(../images/item/icon.png) no-repeat center center;
    background-size: 100% 100%;
    margin-right: 5px;
  }

  p {
    height: 18px;
    line-height: 18px;
  }
}

.pay_type {
  width: 375px;
  height: 46px;
  background: rgba(255, 255, 255, 1);
  // box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
  border-radius: 6px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  line-height: 46px;
  font-size: 12px;
  padding: 20px;
  margin-top: 5px;
  margin-bottom: 5px;

  .tit {
    color: rgba(0,0,0,.8);
  }

  .pay {
    color: rgba(0,0,0,.6);
    display: flex;
    justify-content: flex-start;
    align-items: center;
  }

  .look_more_tick {
    width: 14px;
    height: 14px;
    background: url(../images/item/more.png) no-repeat center center;
    background-size: 100% 100%;
    margin-left: 4px;
  }
}

.money_no {
  width: 100%;
  padding: 0 15px;
  font-size: 12px;
  line-height: 14px;
  margin-top: 25px;
  margin-bottom: 10px;

  p {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    color: rgba(0,0,0,.6);

    a {
      color: #3d96ff;
    }

    i {
      width: 4px;
      height: 7px;
      background: url(../images/user/right2.png) no-repeat center center;
      background-size: 100% 100%;
      margin-left: 5px;
    }
  }
}

.shop_money_box {
  width: 375px;
  height: 52px;
  padding: 0 20px;
  background: rgba(255, 255, 255, 1);
  box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.2);
  position: fixed;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  font-weight: bold;

  .all_num {
    font-size: 12px;
    color: rgba(0,0,0,.8);
  }

  .tit {
    font-size: 15px;
    color: rgba(0,0,0,.8);
    margin: 0 4px 0 12px;
  }

  .all_money {
    font-size: 18px;
    color: #f12211;
  }

  .sub_btn {
    margin-left: auto;
  }
}

/deep/ .van-popup--bottom.van-popup--round {
  border-radius: 6px 6px 0 0;
  height: 531px;
  background: rgba(255, 255, 255, 1);
  box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
}

/deep/ .van-icon-close::before {
  content: "";
  width: 24px;
  height: 24px;
  background: url(../images/item/clear.png) no-repeat center center;
  background-size: 100% 100%;
}

.item_box {
  width: 100%;
  height: 100%;

  .tick_top {
    height: 103px;
    padding-top: 20px;

    .tit {
      height: 20px;
      font-size: 18px;
      font-weight: 600;
      line-height: 20px;
      color: rgba(0,0,0,.8);
      text-align: center;
    }

    .no_sale {
      margin-top: 6px;
      height: 14px;
      font-size: 12px;
      line-height: 14px;
      color: #3d96ff;
      margin-left: 16px;
    }

    .tick_num {
      margin-top: 16px;
      height: 14px;
      font-size: 12px;
      line-height: 14px;
      color: rgba(0,0,0,.8);
      margin-left: 16px;
    }
  }

  .tick_box {
    width: 100%;
    height: 375px;
    background-color: #f0f0f0;
    overflow-y: scroll;
    -webkit-overflow-scrolling: touch;

    .coupon_box {
      width: 354px;
      height: 92px;
      position: relative;
      margin: 12px auto;
      display: flex;
      justify-content: flex-start;

      .left_money {
        width: 114px;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        color: #ffffff;

        .tick_money {
          height: 42px;
          line-height: 42px;
          font-size: 37px;
          font-weight: bold;

          span {
            font-size: 18px;
          }
        }

        .tit {
          font-size: 12px;
          margin-top: 4px;
          line-height: 17px;
        }
      }

      .right_content {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        font-size: 12px;
        margin-left: 10px;

        p {
          color: rgba(0,0,0,.8);
          line-height: 14px;
        }

        .tick_tit {
          margin-top: 10px;
        }

        .tick_time {
          margin-top: 9px;
        }

        .tick_tips {
          margin-top: 19px;
          color: rgba(0,0,0,.6);
        }
      }
    }
  }
}

.tick_bg1 {
  background: url(../images/item/tick_bg1.png) no-repeat center center;
  background-size: 100% 100%;
}

.tick_bg2 {
  background: url(../images/item/tick_bg2.png) no-repeat center center;
  background-size: 100% 100%;
}

.tick_bg3 {
  background: url(../images/item/tick_bg3.png) no-repeat center center;
  background-size: 100% 100%;
}

.check_coupon {
  width: 22px;
  height: 22px;
  position: absolute;
  top: 29px;
  right: 9px;
  background: url(../images/item/check.png) no-repeat center center;
  background-size: 100% 100%;
  z-index: 3;

  &.checked {
    background: url(../images/item/ischeck.png) no-repeat center center;
    background-size: 100% 100%;
  }
}

.define {
  width: 336px;
  height: 35px;
  background: linear-gradient(123deg,#e3382e,#ff4d15);
  border-radius: 18px;
  line-height: 35px;
  font-size: 12px;
  margin: 7px auto 0 auto;
  font-weight: 600;
  color: rgba(255, 255, 255, 1);
  text-align: center;
}

.psw_box {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;

  .write_tit {
    height: 25px;
    line-height: 25px;
    font-size: 18px;
    color: rgba(0,0,0,.6);
    text-align: center;
    margin-top: 20px;
  }

  .recharge_price {
    height: 28px;
    line-height: 28px;
    font-size: 26px;
    color: #f12211;
    text-align: center;
    margin-top: 30px;
    font-weight: 600;

    span {
      font-size: 14px;
      margin-right: 5px;
    }
  }

  .tips {
    width: 319px;
    margin: 28px auto 0 auto;
    font-size: 14px;
    line-height: 20px;
    height: 20px;
    color: rgba(0,0,0,.8);
  }

  .get_pwd {
    width: 319px;
    margin: 20px auto 0 auto;
    line-height: 14px;
    font-size: 12px;
    color: #3d96ff;
    text-align: right;
  }
}

/deep/ .van-password-input {
  margin: 12px 28px 0 28px;
}

/deep/ .van-hairline--left::after {
  border: 1px solid #ececec;
}

.van-password-input .van-password-input__security::after {
  border-radius: 0;
}

.keybord_box {
  height: 250px;
  background-color: #f0f0f0;
  margin-top: 35px;
  padding: 24px 12px 0 12px;

  .keybord {
    width: 361px;
    margin: 24px auto 0 atuo;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    text-align: center;

    .key_item {
      width: 115px;
      height: 44px;
      line-height: 44px;
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 6px;
      background: rgba(255, 255, 255, 1);
      border-radius: 3px;

      &.no_bg {
        background: none;
      }

      &.x {
        color: #757880;
        font-weight: bold;
      }
    }
  }
}
</style>
