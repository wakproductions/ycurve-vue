import { fetchYieldCurveSnapshot } from "@/util/fetchApi";
import {
  COLORS,
  addDatapoint,
  buildDataStruct,
  changeTopDatapoint,
  nextColor,
  resetDataset
} from "@/util/buildDataStruct";

export const types = {
  PIN_DATA_FOR_DATE: "PIN_DATA_FOR_DATE",
  CHANGE_CHART_DATE: "CHANGE_CHART_DATE",
  RESET_CHART_DATA: "RESET_CHART_DATA",
  SET_CHART_DATA: "SET_CHART_DATA",
  CHANGE_TOP_DATAPOINT: "CHANGE_TOP_DATAPOINT"
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
      state.datasets = newChartData;
    }
  },
  actions: {
    [types.CHANGE_CHART_DATE]: async ({ commit, state }, args) => {
      var newDate = new Date(args.newDate);
      var offset = args.offset;

      await fetchYieldCurveSnapshot(newDate, offset).then(response => {
        var newDatasets = changeTopDatapoint(state.datasets, buildDataStruct(response.data, COLORS[0]));
        commit(types.SET_CHART_DATA, newDatasets);
      });
    },
    [types.PIN_DATA_FOR_DATE]: async ({ commit, state }, args) => {
      var dateToPin = new Date(args.date);

      await fetchYieldCurveSnapshot(dateToPin, 0).then(response => {
        var newData = buildDataStruct(response.data, nextColor(state.datasets));
        newData.label = `Interest Rate ${newData.date}`

        var newDatasets = addDatapoint(state.datasets, newData);
        commit(types.SET_CHART_DATA, newDatasets);
      });
    },
    [types.RESET_CHART_DATA]: ({ commit }) => {
      var currentDate = new Date();
      fetchYieldCurveSnapshot(currentDate).then(response => {
        var newDatasets = resetDataset(buildDataStruct(response.data, COLORS[0]));
        commit(types.SET_CHART_DATA, newDatasets);
      });
    },
    [types.CHANGE_TOP_DATAPOINT]: () => {
      // var newDatasets = changeTopDatapoint(state.datasets, args.newDatapoint);
      // commit(types.SET_CHART_DATA, newDatasets);
    }
  },
  getters: {},
  methods: {}
};
