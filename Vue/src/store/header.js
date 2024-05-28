const header = {
	state: {
        show:false,
        info:"返回"
	},
	mutations: {
		showHeader (state,info) {
           
              state.show = true
              state.info = info?info:"返回"
        },
        hideHeader (state) {
            state.show = false
        },

	}
}

export default header