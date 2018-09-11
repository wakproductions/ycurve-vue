import fetchApi from "@/util/fetchApi";
import buildDataStruct from "@/util/buildDataStruct";

export const types = {
  GET_INITIAL_YCURVE_REQUEST: "GET_INITIAL_YCURVE_REQUEST",
  GET_YCURVE_REQUEST: "GET_YCURVE_REQUEST",
  PIN_YCURVE: "PIN_YCURVE",
  SET_CURRENT_YCURVE: "SET_CURRENT_YCURVE",
  SET_FETCH_STATE_PENDING: "SET_FETCH_STATE_PENDING",
  SET_FETCH_STATE_READY: "SET_FETCH_STATE_READY"
};

export const fetch_states = {
  PENDING: "PENDING",
  READY: "READY"
};

export default {
  state: {
    fetch_state: fetch_states.READY,
    datasets: [
      // {
      //   borderColor: "#6600FF",
      //   data: [1.28, 1.39, 1.53, null, 1.76, 1.89, 1.98, 2.2],
      //   fill: false,
      //   label: "12/30/2017"
      // },
    ]
  },
  mutations: {
    [types.GET_YCURVE_REQUEST]: (state, for_date, offset = 0) => {
      state.fetch_state = fetch_states.PENDING;
      fetchApi(for_date).then(response => {
        var newData = response.data;

        state.datasets = [buildDataStruct(newData, for_date)];
        state.fetch_state = fetch_states.READY;
      });
    }
  },
  actions: {
    [types.GET_YCURVE_REQUEST]: ({ commit }) => {
      if (state.fetch_state != fetch_states.READY) return null;
      commit(types.GET_YCURVE_REQUEST);
    },
    [types.GET_INITIAL_YCURVE_REQUEST]: ({ commit }) => {
      var todaysDate = new Date(Date.now());
      commit(types.GET_YCURVE_REQUEST, todaysDate);
    }
  },
  getters: {
    // allCerts: state => {
    //   return state.list;
    // },
    // certNames: state => {
    //   return state.list.map(cert => cert.name);
    // },
    // certIssuers: state => {
    //   return removeDuplicates(state.list, 'issuer').map(cert => cert.issuer);
    // },
  },
  methods: {
    nextColor: () => {
      return "#881111";
    }
  }
};
