<template>
  <div class="container-fluid">
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <yield-curve-chart :chartData="this.chartData" :chartOptions="this.chartOptions" :height="400" :width="800"/>
      </div>
    </div>
    <a href="" @click.prevent="newData">Click this link</a>
  </div>
</template>

<script>
  import store from '@/store/index';
  import { types } from '@/store/yieldCurve'
  import YieldCurveChart from './YieldCurveChart'

  export default {
    data() {
      return {
        chartOptions: {
          responsive: true,
        }
      }
    },
    components: {YieldCurveChart},
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
      newData: () => {
        // store.dispatch(types.GET_INITIAL_YCURVE_REQUEST);
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
