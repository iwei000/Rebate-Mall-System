const loading = {
	state: {
        show:false,
	},
	mutations: {
		showLoading (state) {
           
              state.show = true
           
        },
        hideLoading (state) {
            state.show = false
        },

	}
}

export default loading