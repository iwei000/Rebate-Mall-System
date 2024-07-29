const header = {
  state: {
      show: false,
      info: "返回"
  },
  mutations: {
      showHeader(state, info = "返回") {
          state.show = true;
          state.info = info;
      },
      hideHeader(state) {
          state.show = false;
      }
  }
};

export default header;