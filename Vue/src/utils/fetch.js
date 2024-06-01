import axios from 'axios'
import qs from "qs"
import {Toast} from 'vant'
import router from '@/router'
//import {Notify} from 'vant'
import {Dialog} from 'vant';

let loadingCount = 0;  // 确保loadingCount变量在合适的作用域内被初始化和声明

export const showLoading = () => {
    // 仅在loadingCount为0或更小时启动加载指示，这避免了重复触发loading状态
    if (loadingCount === 0) {
        Toast.loading({
            // mask: true,  // 如果需要阻止用户操作可以取消此行注释
            duration: 20000  // 设置加载提示持续的时间（20秒）
        });
    }
    loadingCount++;  // 增加loading计数，跟踪当前活跃的loading请求数
}

export const hideLoading = () => {
    if (loadingCount > 0) {
        loadingCount--;  // 仅当loadingCount大于0时减少计数
    }

    // 当没有活跃的加载请求时，清除加载提示
    if (loadingCount <= 0) {
        Toast.clear();  // 清除加载提示
        loadingCount = 0;  // 确保loadingCount不会变成负数
    }
};

let ssid = localStorage.getItem('ssid');

export default async (url, data, opt, isLoad = true) => {


    if (isLoad) {
        showLoading();
    }

	url = "/api"+url;
    const set = {method: 'post', ...opt};
    var token = localStorage.getItem('token');
    return (set.method === 'post' ? axios.post(url, {...data,token}) : axios.get(url + '?' + qs.stringify({
        ...data,
        token
    }))).then(r => {

        if (isLoad) {
            hideLoading();
        }

        if (r.status === 200 && r.data.code) {
            return r.data;
        }
		
		if (r.data.code === 0) {
		    return r.data;
		}

        throw {msg: '网络错误，请稍后重试'};

    }).then(r => {

        if (r.code === 1) {
            return r
        } else {

			if (r.code === 0) {
			    throw {msg: r.info}
			}
			
            if (!r.code) {
                throw {msg: '网络错误，请稍后重试！'}
            }

            if (r.code === 406) {
                router.push('/setpaypwd');
            }
            
            if (r.code === 405) {
                const current = {...router.currentRoute};
                router.push('/auth?redirect=' + current.path);
            }
			
			if (r.code === 410) {
				router.push('/setpaypwd');
			}

            if (r.code === 403 || r.code === 401) {

                if (r.code === 401) {
                    localStorage.setItem('reset_time', 0);
                }

                const current = {...router.currentRoute};
                if (current && current.path !== '/' && !(['/', '/reg', '/forgetpwd'].includes(current.path))) {
                    if (current.path !== '/login') {
                        router.replace('/login??redirect=' + current.path)
                    }
                }
            }
        }

        throw r;

    }).catch(r => {

        if (isLoad) {
            hideLoading();
        }

        var message = '网络错误，请稍后或更换网络重试！';
		
		if (r.info) {
		    message = r.info;
		}
		
        if (r.msg) {
            message = r.msg;
        }

        if(isLoad){
            Dialog.alert({
                title: '提示',
                message: message
            });
        }
        //Notify(message);

        throw '';
    })
}
