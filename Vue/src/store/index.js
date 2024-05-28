import Vue from 'vue'
import Vuex from 'vuex'
import header from './header'
import loading from './loading'
import config from './config'
import step from './step'
import home from './home'
import user from './user'

Vue.use(Vuex)

export default new Vuex.Store({
	modules:{
    header,
    loading,
    config,
    step,
    home,
    user,
	}
})
