import { fetchYieldCurveSnapshot } from "@/util/fetchApi";
import { COLORS, buildDataStruct, changeTopDatapoint, nextColor, resetDataset } from "@/util/buildDataStruct";

export const types = {
  SET_CHART_DATA: "SET_CHART_DATA",
  CHANGE_CHART_DATE: "CHANGE_CHART_DATE",
  UPDATE_TOP_DATAPOINT: 'UPDATE_TOP_DATAPOINT',
  RESET_CHART_DATA: "RESET_CHART_DATA",
  TEST_CHANGE_TOP_DATAPOINT: "TEST_CHANGE_TOP_DATAPOINT"
};

// export const fetch_states = {
//   PENDING: "PENDING",
//   READY: "READY"
// };

export default {
  state: {
    // fetch_state: fetch_states.READY,
    datasets: [],
    // currentViewerDate: ''
  },
  mutations: {
    [types.SET_CHART_DATA]: (state, newChartData) => {
      state.datasets = newChartData
      // if(state.datasets.length == 0) {
      //   state.datasets = newChartData
      // } else {
      //   state.datasets[0].data[0] = 2.85
      //   state.datasets[0].data[1] = 2.8
      //   state.datasets[0].data[2] = 2.75
      //   state.datasets[0].data[3] = 2.7
      //   state.datasets[0].data[4] = 2.65
      //   state.datasets[0].data[5] = 2.6
      //   state.datasets[0].data[6] = 2.55
      //   state.datasets[0].data[7] = 2.5
      // }
      // state.currentViewerDate = newChartData[0].label
    },
    [types.UPDATE_TOP_DATAPOINT]: (state, newChartData) => {
      state.datasets = newChartData
      // state.currentViewerDate = newChartData[0].label
    },
    [types.TEST_CHANGE_TOP_DATAPOINT]: (state) => {
      console.log('changing top datapoint')
      // state.datasets[0].data[5] = 4.3
      var newData = [
        2.21,
        2.36,
        2.52,
        2.73,
        2.94,
        3.01,
        // 3.05,
        4.3,
        3.13,
        3.19,
        3.32,
        3.4
      ]
      state.datasets = [{
        borderColor: undefined,
        data: newData,
        fill: true,
        label: state.datasets[0].label
      }]
    }
  },
  actions: {
    [types.CHANGE_CHART_DATE]: ({ commit, state }, args) => {
      var updatedDate = new Date(args.newDate);
      var offset = args.offset;
      fetchYieldCurveSnapshot(updatedDate, offset).then(response => {
        console.log('color' +  nextColor(state.datasets))
        var newDatasets = changeTopDatapoint(state.datasets, buildDataStruct(response.data, COLORS[0]));
        commit(types.SET_CHART_DATA, newDatasets)
      })
    },
    [types.RESET_CHART_DATA]: ({ commit }) => {
      var currentDate = new Date;
      fetchYieldCurveSnapshot(currentDate).then(response => {
        var newDatasets = resetDataset(buildDataStruct(response.data, COLORS[0]));
        commit(types.SET_CHART_DATA, newDatasets)
      });
    },
    [types.TEST_CHANGE_TOP_DATAPOINT]: ({ commit }) => {
      commit(types.TEST_CHANGE_TOP_DATAPOINT)
    }
  },
  getters: {},
  methods: {
    nextColor() {
      // TODO move this into a function
      // return "#881111";

    }
  }
};
