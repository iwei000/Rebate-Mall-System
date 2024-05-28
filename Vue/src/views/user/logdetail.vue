<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.back()"></div>
            <div class="big_tit">物流中心</div>
        </div>
        <div class="order_tit" v-if="notlog">暂无物流信息</div>
        <div class="order_tit" v-else>{{data.state_name}}</div>
        <div class="remarks">备注：{{data.remarks}}</div>
        <div class="log_box" v-if="!notlog">
            <div class="tit">
                <p class="tips">{{data.courier_name}}：{{data.courier_id}}</p>
                <p class="time">{{data.addtime_date}}</p>
            </div>
            <div class="item_box">
                <div class="item" v-for="item,idx in data.courier_info">
                    <div class="time">
                        <span>{{dateMonth(item.time)}}</span>
                        <span>{{dateHour(item.time)}}</span>
                    </div>
                    <div class="right_detail">
                        <div class="icon">
                            <img src="../images/user/log2.png" v-if="item.status == '签收'" alt="">
                            <img src="../images/user/log10.png" v-else-if="item.status == '揽收'" alt="">
                            <img src="../images/user/log4.png" v-else-if="item.status == '派件'" alt="">
                            <img src="../images/user/log6.png" v-else-if="item.status == '在途' && (idx == 1 || idx == 2)" alt="">
                            <img src="../images/user/log7.png" v-else alt="">
                        </div>
                        <div class="status">{{item.status || '运输中'}}</div>
                        <div class="detail">{{item.context}}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    import Fetch from '../../utils/fetch'

    export default {
        name: "user",
        data() {
            return {
                data: {},
                notlog: true,
            };
        },
        created() {
            this.$parent.footer('user',false);
        },
        mounted() {
            Fetch('/user/logistics/query',{
                courier_id: this.$route.params.id
            }).then(r => {
                this.data = r.data;
                if(r.data.courier_info.length == 0){
                    this.notlog = true;
                }else{
                    this.notlog = false;
                }
                
            })
        },
        methods: {
            
            dateMonth(str){
                return str.slice(5,10)
            },
            dateHour(str){
                return str.slice(11,16)
            }
        }
    };
</script>
    

<style lang="less" scoped>
    .remarks{
        font-size: 12px;
        line-height: 17px;
        color: #56555B;
        margin-top: 10px;
        padding: 0 16px;
    }
    .red_top_bg {
        position: fixed;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        z-index: 10;
    }
    .order_tit {
        width: 375px;
        height: 42px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
        border-radius: 0px 0px 6px 6px;
        padding: 0 20px;
        font-size: 14px;
        color: #f12211;
        font-weight: bold;
        margin-top: 64px;
        line-height: 42px;
    }
    .log_box{
        width:375px;
        margin-top: 10px;
        padding: 0 16px;
        background:rgba(255,255,255,1);
        box-shadow:0px 2px 9px 2px rgba(160,160,160,0.15);
        border-radius:6px;
        .tit{
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 52px;
            line-height: 52px;
            border-bottom: 1px solid #ECECEC;
            .tips{
                font-size: 14px;
                line-height: 20px;
                color: rgba(0,0,0,.8);
                font-weight: bold;
            }
            .time{
                font-size: 12px;
                color: rgba(0,0,0,.6);
            }
        }
    }
    .item_box{
        padding-bottom: 15px;
        margin-top: 15px;
        .item:last-of-type .right_detail{
            border-left: none;
        }

        .item{
            min-height: 60px;
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }
        .right_detail{
            flex: 1;
            padding-left: 16px;
            border-left: 1px solid rgba(0,0,0,0.1);
            display: flex;
            justify-content: flex-start;
            position: relative;
        }
        .time{
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 65px;
            span:first-child{
                font-size: 14px;
                line-height: 20px;
            }
            span:last-child{
                font-size: 12px;
                margin-top: 5px;
                line-height: 14px;
            }
            
        }
        .icon{
            width: 24px;
            min-height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            left: -12px;
            top: 0;
            img{
                position: absolute;
                width: 20px;
                top: -2px;
                left: 2px;
            }
        }
        .status{
            width: 60px;
            min-height: 60px;
            font-size: 12px;
            color: #000;
            text-align: center;
            line-height: 25px;
        }
        .detail{
            flex: 1;
            min-height: 60px;
            font-size: 12px;
            line-height: 14px;
            transform: scale(0.85) translateX(-7%);
        }
    }
</style>
