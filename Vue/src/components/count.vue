<template>
    <div class="active_type" v-if="show_seckill">
        <div class="active_name">秒杀</div>
        <p class="count_tip" :class="status == 2? '':'count_tip2'">{{timer.hr}}:{{timer.min}}:{{timer.sec}}
            <slot></slot>
        </p>
    </div>
</template>

<script>
    export default {
        name: 'count',
        data() {
            return {
                timer: {
                    hr: '',
                    min: '',
                    sec: ''
                },
                msec: 0
            }
        },
        props: {
            show_seckill: {
                type: [Boolean],
                default: false
            },
            second: {
                type: [String, Number],
                default: 0
            },
            status: {
                type: [String, Number],
                default: 0
            },
            
        },
        mounted() {
            this.msec = this.second;
            this.start();
        },
        methods: {
            start() {
                if (this.msec >= 0) {
                    let hr = parseInt(this.msec / 60 / 60)
                    let min = parseInt(this.msec / 60 % 60)
                    let sec = parseInt(this.msec % 60)
                    this.timer.hr = hr > 9 ? hr : '0' + hr
                    this.timer.min = min > 9 ? min : '0' + min
                    this.timer.sec = sec > 9 ? sec : '0' + sec
                    
                    this.msec-=1;
                    setTimeout(this.start, 1000);
                }else{
                    this.$router.go(0);
                }
                
            },
        },
    }
</script>

<style lang="less" scoped>
    .active_type {
        height: 16px;
        line-height: 16px;
        margin-left: 24px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        margin-bottom: 8px;

        .active_name {
            background: rgba(241, 34, 17, 0.08);
            border-radius: 4px;
            color: #f12211;
            padding: 0 3px;
            text-align: center;
        }

        .count_tip {
            margin-left: 9px;
            color: #f12211;
            font-weight: bold;
        }

        .count_tip2 {
            margin-left: 9px;
            color: rbga(0,0,0,.6);
            font-weight: bold;
        }
    }
</style>
