const step = {
	state: {
        phoneId:"",
        step:'',
        km:"",
        kll:""
	},
	mutations: {
		setPhoneId (state,i) {
            state.phoneId = i
        },
        setStep (state,param) {
            state.step = param.today_step;
            state.km = param.today_km;
            state.kll = param.today_kll;
        },
	}
}

export default step