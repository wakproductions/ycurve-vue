<script>
import { Line, mixins } from "vue-chartjs";
export default {
  name: 'YieldCurveChart',
  extends: Line,
  mixins: [mixins.reactiveProp],
  props: ["chartData", "chartOptions"],
  mounted() {
    this.renderChart(this.chartData, this.chartOptions);
  }
};
</script>
