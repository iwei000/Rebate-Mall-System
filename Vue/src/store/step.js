const step = {
  state: {
      phoneId: "",
      step: "",
      km: "",
      kll: ""
  },
  mutations: {
      setPhoneId(state, phoneId) {
          state.phoneId = phoneId;
      },
      setStep(state, { today_step = "", today_km = "", today_kll = "" }) {
          state.step = today_step;
          state.km = today_km;
          state.kll = today_kll;
      },
  }
};

export default step;