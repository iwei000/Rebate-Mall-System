const user = {
    state: {
        status: 'init',
        data: null
    },
    mutations: {
        setLogin(state, data) {
            state.status = 'logined';
            state.data = data;
            return true;
        },
        setLogout(state) {
            state.status = 'logout';
            state.data = null
        },
    }
}

export default user
