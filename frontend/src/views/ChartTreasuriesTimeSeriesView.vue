<template>
  <div>
    <h1>US Treasuries Time Series</h1>
    <div class="row justify-content-md-center">
      <div class="col-sm-8">
        <!--<alert-messages placeholder></alert-messages placeholder>-->
      </div>
    </div>
    <b-row class="justify-content-md-center">
      <b-col sm="10">
        <DateRangeNavigator
                ref="dateRangeNavigator"
        />
      </b-col>
    </b-row>
    <b-row class="justify-content-md-center">
      <b-col sm="10">
        <TreasuriesTimeSeriesChart
                :chartData="this.timeSeriesData"
                :height="600"
                :width="1200"
                ref="chartTreasuriesTimeSeries"
        />
      </b-col>
    </b-row>
  </div>
</template>

<script>
import DateRangeNavigator from "@/components/TreasuriesTimeSeriesViewer/DateRangeNavigator";
import TreasuriesTimeSeriesChart from "@/components/TreasuriesTimeSeriesViewer/TreasuriesTimeSeriesChart";

function dates() {
  var startDate = new Date(2017,0,1)
  var endDate = new Date(2019,2,30)
  var currentDate = startDate
  var result = new Array();
  while (currentDate <= endDate) {
    result.push(`${currentDate.getMonth()+1}/${currentDate.getDay()+1}/${currentDate.getFullYear()}`);
    currentDate.setDate(currentDate.getDate() + 1)
  }
  return result;
}

export default {
  name: "ChartTreasuriesTimeSeriesView",
  data() {
    return {
      timeSeriesData: {
        // labels: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21],
        datasets: [
          {
            backgroundColor: "#000000",
            borderColor: "#000000",
            data: [1.2,1.2,1.24,1.24,1.3,1.3,1.3,1.3,1.3,1.4,1.5,1.6,1.75,1.64,1.6,1.65,1.7,1.77,1.8,1.8,1.8],
            fill: false,
            label: "Interest Rate Time Series"
          }
        ],
        labels: dates()
      }
    };
  },
  components: {
    DateRangeNavigator,
    TreasuriesTimeSeriesChart
  },
  computed: {
  },
  methods: {
    async changeDateRange(newLabels) {
      // Get new date range
      // await store.dispatch(types.CHANGE_CHART_DATE, {
      //   newDate: newBaseDate,
      //   offset: offset
      // });
      console.log(newLabels);
      this.updateViewerDateText();
      this.updateChart();
    },
    updateChart() {
      this.$refs.chartTreasuriesTimeSeries.updateChart();
    }
  },
  watch: {
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
