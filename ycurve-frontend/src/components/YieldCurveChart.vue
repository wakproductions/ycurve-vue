<template>
  <div class="col-sm-12">
    This is inside the grid should be showing.
    <bar-chart :data="chartData" :options="chartOptions"></bar-chart>
  </div>
</template>

<script>
  import { Bar } from 'vue-chartjs'
  export default {
    name: "YieldCurveChart",
    props: ['data', 'options'],
    extends: Bar,
    data () {
      return {
        chartData: {
          labels: ['January', 'February'],
          datasets: [
            { label: 'Average Temperature', backgroundColor: '#f78979', data: [33, 27] }
          ]
        }
      }
    },
    options () {
      return {
        responsive: true
      }
    },
    mounted () {
      this.renderChart(this.data, this.options)
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
