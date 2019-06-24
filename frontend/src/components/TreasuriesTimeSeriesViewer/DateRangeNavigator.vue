<template>
  <b-form inline id="date-range-navigator">
    <label>Date Range:</label>
    <b-form-group>
      <b-form-input id="dateSelectorStart" placeholder="Start Date" />
    </b-form-group>

    <label sm="auto">to</label>

    <b-form-group>
      <b-form-input id="dateSelectorEnd" placeholder="End Date" />
    </b-form-group>
  </b-form>
</template>

<script>
import datepicker from "js-datepicker";

export default {
  name: "DateRangeNavigator",
  components: {},
  created() {},
  data() {
    return {
      startDate: "",
      endDate: ""
    };
  },
  computed: {},
  methods: {},
  mounted() {
    this.$startDatePicker = datepicker("#dateSelectorStart", {
      onSelect: this.datepickerSelect,
      formatter: (instance, date) => {
        instance.value = date.toLocaleDateString();
      }
    });

    this.$endDatePicker = datepicker("#dateSelectorEnd", {
      onSelect: this.datepickerSelect,
      formatter: (instance, date) => {
        instance.value = date.toLocaleDateString();
      }
    });
  }
};
</script>

<style scoped lang="scss">
// The associated stylesheet is included in App.vue

#date-range-navigator {
  text-align: left;
}

input {
  margin: 3px;
}
</style>
