<template>
  <div class="col-sm-12">
    <bar-chart :data="chartData" :options="chartOptions"></bar-chart>
  </div>
</template>

<script>
  import { Bar } from 'vue-chartjs'
  export default {
    name: "YieldCurveChart",
    props: {},
    extends: Bar,
    mounted () {
      var data = {
        labels: ['January', 'February'],
        datasets: [
          { label: 'Average Temperature', backgroundColor: '#f78979', data: [33, 27] }
        ]
      }
      var options = {}
      this.renderChart(data, options)
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
