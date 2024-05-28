<template>
    <div class="basic_wrap">
        <div class="red_top_bg">
            <div class="back_left" @click="$router.back()"></div>
            <div class="big_tit">物流中心</div>
        </div>
        <div class="tabs">
            <div class="tab" :class="{cur:cut_tab == 1}" @click="start()">
                <p>全部物流</p>
            </div>
            <div class="tab" :class="{cur:cut_tab == 2}" @click="sort(2,'S')">
                <p>运输中</p>
            </div>
            <div class="tab" :class="{cur:cut_tab == 3}" @click="sort(3,'D')">
                <p>已签收</p>
            </div>
            <div class="bottom_line cut1" ref="line"></div>
        </div>
        <div class="log_wrap">
            <div class="item" v-for="item in data.list" @click="$router.push('/logistics/'+item.courier_id)">
                <div class="status" :class="item.status == 'S' ? 'limit' : 'gray_btn'">{{item.status_name}}</div>
                <p class="timer">{{item.addtime_date}}</p>
                <p class="ltd">{{item.courier_name}}: {{item.courier_id}}</p>
                <p class="last_log" v-if="item.courier_first.time">最近更新时间：{{item.courier_first.time}} {{item.courier_first.context}}</p>
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
                cut_tab: 1
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
                Fetch('/user/logistics').then(r => {
                    this.data = r.data
                }).then(r=>{
                    this.cut_tab = 1;
                    this.$refs.line.className = 'bottom_line cut1';
                })
            },
            sort(num,status){
                this.$refs.line.className = 'bottom_line cut'+num;
                Fetch('/user/logistics',{
                    status: status
                }).then(r => {
                    this.data = r.data
                }).then(r=>{
                    this.cut_tab = num;
                })
            }

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

    .tabs {
        height: 45px;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 2px 4px 0px rgba(102, 102, 102, 0.1);
        display: flex;
        align-items: center;
        justify-content: space-around;
        font-size: 15px;
        font-weight: 600;
        margin-top: 44px;
        position: relative;

        .bottom_line {
            width: 30px;
            height: 2px;
            background-color: #E33820;
            position: absolute;
            bottom: 0;
            left: 48px;
            transition: all 0.3s;
        }
        .cut1{
            left: 50px;
        }
        .cut2{
            left: 180px;
        }
        .cut3{
            left: 298px;
        }

        .tab {
            color: #0202027d;
            font-size: 15px;
            position: relative;
            height: 100%;
            line-height: 45px;

            &.cur {
                color: #E33820;

                i {
                    display: block;
                }
            }
        }
    }

    .log_wrap {
        width: 100%;

        .item {
            padding: 16px 16px 21px 16px;
            background: rgba(255, 255, 255, 1);
            box-shadow: 0px 2px 9px 2px rgba(160, 160, 160, 0.15);
            border-radius: 6px;
            position: relative;
            margin-top: 12px;

            .timer,
            .last_log {
                font-size: 12px;
                line-height: 14px;
                color: rgba(0,0,0,.6);
            }

            .ltd {
                height: 20px;
                font-size: 14px;
                line-height: 20px;
                font-weight: bold;
                margin-top: 14px;
            }

            .last_log {
                margin-top: 10px;
            }
        }
    }

    .status {
        position: absolute;
        top: 14px;
        right: 16px;
    }
</style>
