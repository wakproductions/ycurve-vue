<script>
  import { Line, mixins } from "vue-chartjs";

  const chartOptions = {
    responsive: true,
    spanGaps: true
  }

  export default {
    name: 'TreasuriesTimeSeriesChart',
    extends: Line,

    mixins: [mixins.reactiveProp],

    props: ["chartData"],
    methods: {
      // Need to force updates because this chart's automatic rendering on data update doesn't work so well.
      updateChart() {
        this.$data._chart.options = chartOptions;
        this.$data._chart.update();
      }
    },
    mounted() {
      this.renderChart(this.chartData, this.chartOptions);
    }
  };
</script>
