import { fetchYieldCurveSnapshot } from "@/util/fetchApi";
import { buildDataStruct, changeTopDatapoint, resetDataset } from "@/util/buildDataStruct";

export const types = {
  SET_CHART_DATA: "SET_CHART_DATA",
  CHANGE_CHART_DATE: "CHANGE_CHART_DATE",
  UPDATE_TOP_DATAPOINT: 'UPDATE_TOP_DATAPOINT',
  RESET_CHART_DATA: "RESET_CHART_DATA"
};

// export const fetch_states = {
//   PENDING: "PENDING",
//   READY: "READY"
// };

export default {
  state: {
    // fetch_state: fetch_states.READY,
    datasets: [],
    currentViewerDate: ''
  },
  mutations: {
    [types.SET_CHART_DATA]: (state, newChartData) => {
      state.datasets = newChartData
      state.currentViewerDate = newChartData[0].label
    },
    [types.UPDATE_TOP_DATAPOINT]: (state, newChartData) => {
      state.datasets = newChartData
      state.currentViewerDate = newChartData[0].label
    }
  },
  actions: {
    [types.CHANGE_CHART_DATE]: ({ commit, state }, args) => {
      var updatedDate = new Date(args.newDate);
      fetchYieldCurveSnapshot(updatedDate, args.offset).then(response => {
        var newDatasets = changeTopDatapoint(state.datasets, buildDataStruct(response.data));
        commit(types.SET_CHART_DATA, newDatasets)
      })
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
