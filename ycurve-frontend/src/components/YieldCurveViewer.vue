<template>
  <div class="container-fluid">
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <!--<alert-messages></alert-messages>-->
      </div>
    </div>
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <date-navigation
          :setDate="this.viewerDate"
          v-on:date-changed="onDateNavigationChanged"
          v-on:date-move-up="onDateMoveUp"
          v-on:date-move-down="onDateMoveDown"
          v-on:pin-yield-curve="onPinYieldCurve"
          ref="dateNavigation"
        />
      </div>
    </div>
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <yield-curve-chart
          :chartData="this.chartData"
          :chartOptions="this.chartOptions"
          :height="400"
          :width="800"
          ref="yieldCurveChart"
        />
      </div>
    </div>
  </div>
</template>

<script>
import { debounce } from "lodash";
import {
  formatDateAmerican,
  convertStringToDate,
  offsetDate
} from "@/util/dateUtils";
import store from "@/store/index";
import { types } from "@/store/yieldCurve";
import DateNavigation from "./DateNavigation";
import AlertMessages from "./AlertMessages";
import YieldCurveChart from "./YieldCurveChart";

export default {
  name: "YieldCurveViewer",
  data() {
    return {
      chartOptions: {
        responsive: true
      },
      viewerDate: ""
    };
  },
  created() {
    this.debouncedChangeCurrentDate = debounce(this.changeCurrentDate, 500);
  },
  components: {
    AlertMessages,
    DateNavigation,
    YieldCurveChart
  },
  computed: {
    chartData() {
      return {
        labels: [
          "1M",
          "3M",
          "6M",
          "1Y",
          "2Y",
          "3Y",
          "5Y",
          "7Y",
          "10Y",
          "20Y",
          "30Y"
        ],
        datasets: store.state.yieldCurve.datasets
      };
    }
  },
  methods: {
    async changeCurrentDate(newBaseDate, offset) {
      await store.dispatch(types.CHANGE_CHART_DATE, {
        newDate: newBaseDate,
        offset: offset
      });
      // console.log(
      //   `Anticipated Date: ${newBaseDate} (${offset}) ` +
      //   `Received Date: ${this.chartData.datasets[0].date}`
      // );
      this.updateViewerDateText();
      this.updateChart();
    },
    onDateNavigationChanged(newDate) {
      this.viewerDate = newDate;
      this.debouncedChangeCurrentDate(newDate, 0);
    },
    onDateMoveUp(baseDate) {
      this.changeCurrentDate(baseDate, 1);
    },
    onDateMoveDown(baseDate) {
      this.changeCurrentDate(baseDate, -1);
    },
    onPinYieldCurve() {
      store.dispatch(types.PIN_DATA_FOR_DATE, { date: this.navigationViewerDate() });
      this.updateChart();
    },
    navigationViewerDate() {
      return this.$refs.dateNavigation.viewerDate;
    },
    updateChart() {
      this.$refs.yieldCurveChart.updateChart();
    },
    updateViewerDateText() {
      // console.log('setting viewer text to ' + this.chartData.datasets[0].date)
      this.$refs.dateNavigation.setViewerDateText(
        this.chartData.datasets[0].date
      );
    }
  },
  watch: {
    chartData() {
      // When moving up and down in time the date we get back from the API is often a different date than what we
      // think it is because of weekends and holidays
      // console.log("setting viewer text to " + this.chartData.datasets[0].date);
      this.$refs.dateNavigation.setViewerDateText(
        this.chartData.datasets[0].date
      );
    }
  },
  mounted() {
    store.dispatch(types.RESET_CHART_DATA);
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
