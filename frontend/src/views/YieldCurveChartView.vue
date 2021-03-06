<template>
  <div class="container-fluid">
    <heading-title/>
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <!--<alert-messages></alert-messages>-->
      </div>
    </div>
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <date-navigation
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
import store from "@/store/index";
import { types } from "@/store/yieldCurve";
import DateNavigation from "@/components/YieldCurveViewer/DateNavigation";
import HeadingTitle from "@/components/YieldCurveViewer/HeadingTitle";
import YieldCurveChart from "@/components/YieldCurveViewer/YieldCurveChart";

export default {
  name: "YieldCurveChartView",
  data() {
    return {
      chartOptions: {
        responsive: true,
        spanGaps: true
      },
    };
  },
  created() {
    this.debouncedChangeCurrentDate = debounce(this.changeCurrentDate, 500);
  },
  components: {
    DateNavigation,
    HeadingTitle,
    YieldCurveChart
  },
  computed: {
    chartData() {
      return {
        labels: ["1M", "3M", "6M", "1Y", "2Y", "3Y", "5Y", "7Y", "10Y", "20Y", "30Y"],
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
      // console.log('setting viewer text (from updateViewerDateText()) to ' + this.chartData.datasets[0].date)
      this.$refs.dateNavigation.setViewerDateText(this.chartData.datasets[0].date);
    }
  },
  watch: {
    chartData() {
      // This mainly gets triggered upon initial load of the component with the first load of data. Subsequent
      // date navigator updates are performed by directly calling updateViewerDateText()
      //
      // I can't call updateViewerDateText() directly from this function
      // https://stackoverflow.com/questions/35755027/how-to-call-function-from-watch
      //
      this.$refs.dateNavigation.setViewerDateText(this.chartData.datasets[0].date);
    }
  },
  mounted() {
    store.dispatch(types.RESET_CHART_DATA);
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
