import { fetchYieldCurveSnapshot } from "@/util/fetchApi";
import { buildDataStruct, resetDataset } from "@/util/buildDataStruct";

export const types = {
  SET_CHART_DATA: "SET_CHART_DATA",
  UPDATE_TOP_DATAPOINT: "UPDATE_TOP_DATAPOINT",

  MOVE_BACKWARDS: "MOVE_BACKWARDS",
  RESET_CHART_DATA: "RESET_CHART_DATA"
};

// export const fetch_states = {
//   PENDING: "PENDING",
//   READY: "READY"
// };

export default {
  state: {
    // fetch_state: fetch_states.READY,
    datasets: []
  },
  mutations: {
    [types.SET_CHART_DATA]: (state, newChartData) => {
      state.datasets = newChartData
    },
    [types.UPDATE_TOP_DATAPOINT]: (state, newChartData) => {
      state.datasets = newChartData
    }
    // [types.GET_YCURVE_REQUEST]: (state, for_date, offset = 0) => {
    //   // state.fetch_state = fetch_states.PENDING;
    //   fetchYieldCurveSnapshot(for_date).then(response => {
    //     var newData = response.data;
    //
    //     state.datasets = resetDataset(buildDataStruct(newData));
    //     // state.fetch_state = fetch_states.READY;
    //   });
    // }
  },
  actions: {
    [types.MOVE_BACKWARDS]: ({ commit }) => {
      // fetchYieldCurveSnapshot(currentDate).then(response => {
      //     var newDatasets = resetDataset(buildDataStruct(response.data));
      //     commit(types.SET_CHART_DATA, newDatasets)
    },
    [types.RESET_CHART_DATA]: ({ commit }) => {
      var currentDate = new Date;
      fetchYieldCurveSnapshot(currentDate).then(response => {
        var newDatasets = resetDataset(buildDataStruct(response.data));
        commit(types.SET_CHART_DATA, newDatasets)
      });
    },
  },
  getters: {},
  methods: {
    nextColor: () => {
      // TODO move this into a function
      return "#881111";
    }
  }
};
