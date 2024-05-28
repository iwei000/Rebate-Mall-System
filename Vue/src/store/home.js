const home = {
    state: {
        phoneId: '',
        step: 0,
        show_advert:true,
        home_advert:{},
    },
    mutations: {
        setPhoneId(state, i) {
            state.phoneId = i
        },
        setStep(state, s) {
            state.step = s
        },
        showAdvert(state, a) {
		    state.home_advert = a;
        },
        setShowAdvert(state, a){
            state.show_advert = a;
        }

    }
}

export default home
