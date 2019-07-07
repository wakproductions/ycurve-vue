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
          @start-date-changed="onDateRangeNavigatorStartDateChanged"
          @end-date-changed="onDateRangeNavigatorEndDateChanged"
          ref="dateRangeNavigator"
        />
      </b-col>
    </b-row>
    <b-row class="justify-content-md-center">
      <b-col sm="10">
        <TreasuriesTimeSeriesChart
                :chartData="this.chartData"
                :height="600"
                :width="1200"
                ref="chartTreasuriesTimeSeries"
        />
      </b-col>
    </b-row>
    <b-row class="justify-content-md-center mt-md-2">
      <b-col sm="10" align-h="start">
        <TreasuriesTimeSeriesSelector
                @selection-changed="onTimeSeriesSelectionChanged"
                ref="treasuriesTimeSeriesSelector"
        />
      </b-col>
    </b-row>
  </div>
</template>

<script>
import DateRangeNavigator from "@/components/TreasuriesTimeSeriesViewer/DateRangeNavigator";
import TreasuriesTimeSeriesChart from "@/components/TreasuriesTimeSeriesViewer/TreasuriesTimeSeriesChart";
import store from "@/store/index";
import { types } from "@/store/treasuriesTimeSeries";
import { isValidDateString } from "@/util/dateUtils";
import TreasuriesTimeSeriesSelector from "../components/TreasuriesTimeSeriesViewer/TreasuriesTimeSeriesSelector";

export default {
  name: "ChartTreasuriesTimeSeriesView",
  data() {
    return {
      timeSeriesStartDate: null,
      timeSeriesEndDate: null,
    };
  },
  components: {
    TreasuriesTimeSeriesSelector,
    DateRangeNavigator,
    TreasuriesTimeSeriesChart
  },
  computed: {
    chartData() {
      return store.state.treasuriesTimeSeries.timeSeriesData;
    },
    selectedDatasets() {
      return this.$refs.treasuriesTimeSeriesSelector.selectedDatasets;
    }
  },
  methods: {
    onDateRangeNavigatorStartDateChanged(newStartDate) {
      this.timeSeriesStartDate = newStartDate;
      this.updateChartData();
    },
    onDateRangeNavigatorEndDateChanged(newEndDate) {
      this.timeSeriesEndDate = newEndDate;
      this.updateChartData();
    },
    onTimeSeriesSelectionChanged(newSelections) {
      this.updateChartData();
    },
    async updateChartData() {
      if (!this.validForm()) {
        return false;
      }

      console.log("pulling chart data " + this.selectedDatasets);
      await store.dispatch(types.FETCH_TIME_SERIES, {
        startDate: this.timeSeriesStartDate,
        endDate: this.timeSeriesEndDate,
        series: this.selectedDatasets
      });
      this.updateChart();
    },
    updateChart() {
      this.$refs.chartTreasuriesTimeSeries.updateChart();
    },
    validForm() {
      if (!isValidDateString(this.timeSeriesStartDate)) return false;
      if (!isValidDateString(this.timeSeriesEndDate)) return false;
      if (new Date(this.timeSeriesStartDate) >= new Date(this.timeSeriesEndDate)) return false;
      if (this.selectedDatasets.length < 1) return false;

      return true;
    }
  },
  mounted() {},
  watch: {}
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
