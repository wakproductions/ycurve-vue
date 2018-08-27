<template>
  <div class="container-fluid">
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <yield-curve-chart :chartData="this.chartData" :chartOptions="this.chartOptions" :styles="yieldCurveChartStyle" />
      </div>
    </div>
    <div class="big">
      This is big
    </div>
  </div>
</template>

<script>
  import YieldCurveChart from './YieldCurveChart'

  const CHART_COLORS = {
    blue: 'rgb(54, 162, 235)',
    red: 'rgb(255, 99, 132)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    orange: 'rgb(255, 159, 64)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(201, 203, 207)'
  };

  export default {
    data() {
      return {
        chartData: {
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
          datasets: [
            {
              label: "12/30/2017",
              color: "#f78979",
              data: [1.28, 1.39, 1.53, 1.76, 1.89, 1.98, 2.2]
            }
          ]
        },
        chartOptions: {
          maintainAspectRatio: false,
          responsive: true
        }
      }
    },
    components: {YieldCurveChart},
    computed: {
      yieldCurveChartStyle() {
        return {
          height: `${this.height}px`,
          position: 'relative'
        }
      }
    }
    
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.big {
margin:600px;
color:orange;
}
</style>
