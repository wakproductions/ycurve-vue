<template>
  <div class="container-fluid">
    <date-navigation v-on:date-changed="onDateNavigationChanged" />
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <yield-curve-chart
          :chartData="this.chartData"
          :chartOptions="this.chartOptions"
          :height="400"
          :width="800"
        />
      </div>
    </div>
    <a href="" @click.prevent="newData">Click this link</a>
  </div>
</template>

<script>
  import { debounce } from 'lodash';
  import store from '@/store/index';
  import { types } from '@/store/yieldCurve'
  import DateNavigation from './DateNavigation'
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
    created: function () {
      this.debouncedChangeCurrentDate = debounce(this.changeCurrentDate, 500)
    },
    components: {
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
      changeCurrentDate: function (newDate)  {
        // console.log(newDate)
        store.dispatch(types.CHANGE_CHART_DATE, newDate);
      },
      onDateNavigationChanged: function (newDate) {
        this.debouncedChangeCurrentDate(newDate)
      },
      newData: () => {
      }
    },
    mounted: () => {
      store.dispatch(types.RESET_CHART_DATA);
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
