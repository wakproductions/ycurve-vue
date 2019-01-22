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
    <a href="" @click.prevent="newData">Click this link</a>
  </div>
</template>

<script>
  import { debounce } from 'lodash';
  import { formatDateAmerican, convertStringToDate, offsetDate } from "@/util/dateUtils";
  import store from '@/store/index';
  import { types } from '@/store/yieldCurve'
  import DateNavigation from './DateNavigation'
  import AlertMessages from './AlertMessages'
  import YieldCurveChart from './YieldCurveChart'

  export default {
    name: 'YieldCurveViewer',
    data() {
      return {
        chartOptions: {
          responsive: true,
        },
        viewerDate: ''
      }
    },
    created() {
      this.debouncedChangeCurrentDate = debounce(this.changeCurrentDate, 500)
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
        }
      },
    },
    methods: {
      changeCurrentDate(newDate, offset)  {
        store.dispatch(types.CHANGE_CHART_DATE, { newDate: newDate, offset: offset });
      },
      onDateNavigationChanged(newDate) {
        this.viewerDate = newDate
        this.debouncedChangeCurrentDate(newDate, 0)
      },
      onDateMoveUp(baseDate) {
        // console.log('up on basedate: ' + baseDate)
        this.changeCurrentDate(baseDate, 1)
      },
      onDateMoveDown(baseDate) {
        // console.log('down on basedate: ' + baseDate)
        this.changeCurrentDate(baseDate, -1)
        this.updateChart()
      },
      onPinYieldCurve() {
        store.dispatch(types.TEST_CHANGE_TOP_DATAPOINT)
        this.updateChart()
      },
      updateChart() {
        console.log('update chart from action triggered')
        this.$refs.yieldCurveChart.updateChart();
      }
    },
    watch: {
      chartData() {
        // When moving up and down in time the date we get back from the API is often a different date than what we
        // think it is because of weekends and holidays
        this.$refs.dateNavigation.setViewerDateText(this.chartData.datasets[0].date)
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
