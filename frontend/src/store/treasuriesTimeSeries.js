import { fetchTreasuriesTimeSeries } from "@/util/fetchApi";
import { buildTimeSeriesDataStruct } from "@/util/buildDataStruct";

export const types = {
  FETCH_TIME_SERIES: "FETCH_TIME_SERIES",
  SET_CHART_DATA: "SET_CHART_DATA"
};

// Used to generate a list of successive dates - move to dateUtil.js?
//
// function dates() {
//   var startDate = new Date(2017, 0, 1);
//   var endDate = new Date(2017, 2, 30);
//   var currentDate = startDate;
//   var result = new Array();
//   while (currentDate <= endDate) {
//     result.push(`${currentDate.getMonth() + 1}/${currentDate.getDay() + 1}/${currentDate.getFullYear()}`);
//     currentDate.setDate(currentDate.getDate() + 1);
//   }
//   return result;
// }

export default {
  state: {
    timeSeriesData: {
      datasets: [
        // {
        //   backgroundColor: "#000000",
        //   borderColor: "#000000",
        //   data: [
        //     1.2,
        //     1.2,
        //     1.24,
        //     1.24,
        //     1.3,
        //     1.3,
        //     1.3,
        //     1.3,
        //     1.3,
        //     1.4,
        //     1.5,
        //     1.6,
        //     1.75,
        //     1.64,
        //     1.6,
        //     1.65,
        //     1.7,
        //     1.77,
        //     1.8,
        //     1.8,
        //     1.8
        //   ],
        //   fill: false,
        //   label: "Interest Rate Time Series"
        // }
      ],
      labels: [] //dates()
    }
  },
  mutations: {
    [types.SET_CHART_DATA]: (state, newChartData) => {
      state.timeSeriesData = newChartData;
    }
  },
  actions: {
    [types.FETCH_TIME_SERIES]: async ({ commit }, args) => {
      var startDate = args.startDate;
      var endDate = args.endDate;
      var series = args.series;

      await fetchTreasuriesTimeSeries(startDate, endDate, series).then(response => {
        var newTimeSeriesData = buildTimeSeriesDataStruct(response.data);
        commit(types.SET_CHART_DATA, newTimeSeriesData);
      });
    }
  },
  getters: {},
  methods: {}
};
