import request from '@/utils/request.js'
import Cookies from "js-cookie";


const config = {
	state: {
        ssid:"",
        error:localStorage.getItem('error')||null,
        kefu_link: '',
	},
	mutations: {
		setConfig (state,data) {
            //console.log(data)
            state.ssid = data.data.ssid;
            state.error = data.data.error
            state.kefu_link = data.data.kefu_link
        }
    },
}

export default config
