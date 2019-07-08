<script>
// import { Line, mixins } from "vue-chartjs";
import { Line, mixins } from "vue-chartjs";

export default {
  name: "YieldCurveChart",
  extends: Line,

  // Not using the reactiveProp feature because it renders unpredictably. Sometimes it smoothly changes the chart
  // data, other times it redraws the chart lines completely.
  mixins: [mixins.reactiveProp],

  props: ["chartData", "chartOptions"],
  methods: {
    // Need to force updates because this chart's automatic rendering on data update doesn't work so well.
    updateChart() {
      this.$data._chart.options = this.chartOptions;
      this.$data._chart.update();
    }
  },
  mounted() {
    this.renderChart(this.chartData, this.chartOptions);
  }
};
</script>
