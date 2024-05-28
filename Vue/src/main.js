import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store/'
import './registerServiceWorker'
import '@/assets/styles/reset.scss'
import { Notify, Dialog } from 'vant'
import vueTouch from "vue-plugin-touch"
import 'lib-flexible'
import 'vant/lib/index.css';
Vue.use(Notify).use(Dialog).use(vueTouch)
// const ua = navigator.userAgent

// if(ua.indexOf("bsl") >= 0 ) {

//   // alert("mainjs")
//   var x = 1;

//   function appFinishiLoad() {
//     BSL.PhoneID('id');
//   }

// function id(i) {
//     if(i.indexOf('-') < 0){
//         BSL.OpenStep();
//     }
//     alert(i)
//     setInterval(function () {
//       BSL.GetStepCount('step');
//       x++;
//     }, 1000);
//   }

//   function step(s) {
//     alert(s)
//     //document.body.innerHTML = '��' + x + '�λ�ò���Ϊ' + s;
//   }
//   BSL.PhoneID('id');

// }
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
