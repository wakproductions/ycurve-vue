<template>
  <b-container class="time-series-selector">
    <h4>Time Series to Display</h4>
    <b-form-group label="Select the constant maturity treasury yield to display:">
      <b-form-checkbox-group v-model="selectedDatasets" stacked>
        <b-row>
          <b-col>
            <b-form-checkbox value="1M">1-month</b-form-checkbox>
            <b-form-checkbox value="3M">3-month</b-form-checkbox>
            <b-form-checkbox value="6M">6-month</b-form-checkbox>
            <b-form-checkbox value="1Y">1-year</b-form-checkbox>
            <b-form-checkbox value="2Y">2-year</b-form-checkbox>
            <b-form-checkbox value="3Y">3-year</b-form-checkbox>
            <b-form-checkbox value="5Y">5-year</b-form-checkbox>
            <b-form-checkbox value="7Y">7-year</b-form-checkbox>
            <b-form-checkbox value="10Y">10-year</b-form-checkbox>
            <b-form-checkbox value="20Y">20-year</b-form-checkbox>
            <b-form-checkbox value="30Y">30-year bond</b-form-checkbox>
          </b-col>
          <b-col>
            * Data for 1-month T-Bill only available as far back as July 2001
            <b-form-checkbox value="3M-1M">3-month - 1-month</b-form-checkbox>
            <b-form-checkbox value="6M-1M">6-month - 1-month</b-form-checkbox>
            <b-form-checkbox value="1Y-1M">1-year - 1-month</b-form-checkbox>
            <b-form-checkbox value="3Y-1M">3-year - 1-month</b-form-checkbox>
            <b-form-checkbox value="5Y-1M">5-year - 1-month</b-form-checkbox>
            <b-form-checkbox value="7Y-1M">7-year - 1-month</b-form-checkbox>
            <b-form-checkbox value="10Y-1M">10-year - 1-month</b-form-checkbox>
            <b-form-checkbox value="20Y-1M">20-year - 1-month</b-form-checkbox>
            <b-form-checkbox value="30Y-1M">30-year - 1-month</b-form-checkbox>
            <div class="mt-3"></div>
            * Data for 3-month available as far back as 1934
            <b-form-checkbox value="3M-3M">3-month - 3-month</b-form-checkbox>
            <b-form-checkbox value="6M-3M">6-month - 3-month</b-form-checkbox>
            <b-form-checkbox value="1Y-3M">1-year - 3-month</b-form-checkbox>
            <b-form-checkbox value="3Y-3M">3-year - 3-month</b-form-checkbox>
            <b-form-checkbox value="5Y-3M">5-year - 3-month</b-form-checkbox>
            <b-form-checkbox value="7Y-3M">7-year - 3-month</b-form-checkbox>
            <b-form-checkbox value="10Y-3M">10-year - 3-month</b-form-checkbox>
            <b-form-checkbox value="20Y-3M">20-year - 3-month</b-form-checkbox>
            <b-form-checkbox value="30Y-3M">30-year - 3-month</b-form-checkbox>
          </b-col>
        </b-row>
      </b-form-checkbox-group>
    </b-form-group>
  </b-container>
</template>

<script>
const EVENT_TYPES = {
  SELECTION_CHANGED: "selection-changed",
};

export default {
  name: "TreasuriesTimeSeriesSelector",
  components: {},
  data() {
    return {
      selectedDatasets: ['1M', '10Y'],
    };
  },
  computed: {},
  created() {},
  methods: {},
  mounted() {},
  watch: {
    selectedDatasets() {
      this.$emit(EVENT_TYPES.SELECTION_CHANGED, this.selectedDatasets)
    }
  }
};
</script>

<style scoped lang="scss">
.time-series-selector {
  text-align: left;
}
</style>
