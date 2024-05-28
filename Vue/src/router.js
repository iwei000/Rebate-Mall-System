import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
    //   mode: "history",
    mode: 'hash',
    base: process.env.BASE_URL,
    scrollBehavior(to, from, savedPosition) {
        if (savedPosition) {
            return savedPosition;
        } else {
            return {x: 0, y: 0};
        }
    },
    routes: [
        {
            path: "/index",
            name: "index",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/index/index.vue")
        },
        {
            path: "/",
            redirect: {
                name: "index"
            }
        },
        {
            path: "/user",
            name: "user",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/index.vue")
        },
		{
		    path: "/coupon",
		    name: "coupon",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/coupon.vue")
		},
		{
		    path: "/account",
		    name: "account",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/account.vue")
		},
		{
		    path: "/addcount",
		    name: "addcount",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/addcount.vue")
		},
		{
		    path: "/address",
		    name: "address",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/address.vue")
		},
		{
		    path: "/editaddress/:id?",
		    name: "editaddress",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/editaddress.vue")
		},
		{
		    path: "/moneybag",
		    name: "moneybag",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/moneybag.vue")
		},
		{
		    path: "/vipshop",
		    name: "vipshop",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/index/vipshop.vue")
		},
		{
		    path: "/newshop",
		    name: "newshop",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/index/newshop.vue")
		},
		{
		    path: "/newtask",
		    name: "newtask",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/index/newtask.vue")
		},
		{
		    path: "/newwalfare",
		    name: "newwalfare",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/index/newwalfare.vue")
		},
		{
		    path: "/logistics",
		    name: "logistics",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/logistics.vue")
		},
		{
		    path: "/logistics/:id",
		    name: "logisticsdetail",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/user/logdetail.vue")
		},
        {
            path: "/login",
            name: "login",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/login.vue")
        },
        {
            path: "/register",
            name: "register",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/register.vue")
        },
        {
            path: "/forgetpwd",
            name: "forgetpwd",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/forgetpwd.vue")
        },
        {
            path: "/invest",
            name: "invest",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/invest.vue")
        },
        {
            path: "/invest/alipay",
            name: "pay",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/alipay.vue")
        },
        {
            path: "/invest/wx",
            name: "wx",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/wx.vue")
        },
        {
            path: "/invest/bank",
            name: "bankpay",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/bankpay.vue")
        },
        {
            path: "/cash",
            name: "cash",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/cash.vue")
        },
        {
            path: "/safe",
            name: "safe",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/safe.vue")
        },
        {
            path: "/setpwd",
            name: "setpwd",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/setpwd.vue")
        },
        {
            path: "/setpaypwd",
            name: "setpaypwd",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/setpaypwd.vue")
        },
        {
            path: "/bank",
            name: "bank",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/bank.vue")
        },
        {
            path: "/order",
            name: "order",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/order.vue")
        },
        {
            path: "/order/:id",
            name: "orderinfo",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/orderinfo.vue")
        },
        {
            path: "/contract/:id",
            name: "contract",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/contract.vue")
        },
        {
            path: "/funds",
            name: "funds",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/funds.vue")
        },
        {
            path: "/share",
            name: "share",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/share.vue")
        },
        {
            path: "/proxy",
            name: "proxy",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/proxy.vue")
        },
        {
            path: "/notice",
            name: "notice",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/notice.vue")
        },
        {
            path: "/notice/:id",
            name: "noticeid",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/notice_article.vue")
        },
        {
            path: "/about",
            name: "about",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/about.vue")
        },
        {
            path: "/about/:code",
            name: "article",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/article.vue")
        },
        {
            path: "/item",
            name: "item",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/item/item.vue")
        },
		{
		    path: "/search",
		    name: "search",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/item/search.vue")
		},
		{
		    path: "/type",
		    name: "type",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/item/type.vue")
		},
		{
		    path: "/confirm",
		    name: "confirm",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/item/confirm.vue")
		},
		{
		    path: "/seckill",
		    name: "seckill",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/index/seckill.vue")
		},
        {
            path: "/details/:id",
            name: "details",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/item/details.vue")
        },
        {
            path: "/kefu",
            name: "kefu",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/kefu.vue")
        },
        {
            path: "/jz",
            name: "jz",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/jz/index.vue")
        },
        {
            path: "/sign",
            name: "sign",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/jz/sign.vue")
        },
        {
            path: "/jz/:id",
            name: "jzinfo",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/jz/info.vue")
        },
        {
            path: "/back",
            name: "back",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/back.vue")
        },
        {
            path: "/auth",
            name: "auth",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/auth.vue")
        },
	    {
            path: "/alipay",
            name: "alipay",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/alipayBind.vue")
        },
        {
            path: "/useragreement",
            name: "useragreement",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/useragreement.vue")
        },
        {
            path: "/privacyPolicy",
            name: "privacyPolicy",
            component: () =>
                import(/* webpackChunkName: "home" */ "./views/user/privacyPolicy.vue")
        },
		{
		    path: "/cart",
		    name: "cart",
		    component: () =>
		        import(/* webpackChunkName: "home" */ "./views/item/cart.vue")
		},
    ]
});
