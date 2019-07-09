<template>
  <b-form inline id="date-range-navigator">
    <label>Date Range:</label>
    <b-form-group>
      <b-form-input id="dateSelectorStart" v-model="_startDate" placeholder="Start Date" />
    </b-form-group>

    <label sm="auto">to</label>

    <b-form-group>
      <b-form-input id="dateSelectorEnd" v-model="_endDate" placeholder="End Date" />
    </b-form-group>
  </b-form>
</template>

<script>
import datepicker from "js-datepicker";
import { debounce } from "lodash";
import { DATA_LOWER_LIMIT_DATE } from "@/appCommon";
import { AMERICAN_DATE_REGEX, formatDateAmerican } from "@/util/dateUtils";

const EVENT_TYPES = {
  START_DATE_CHANGED: "start-date-changed",
  END_DATE_CHANGED: "end-date-changed"
};

function defaultStartDate() {
  var today = new Date();
  return new Date(today.setDate(today.getDate() - 365 * 3)); // 3 years ago
}

export default {
  name: "DateRangeNavigator",
  components: {},
  data() {
    return {
      startDate: formatDateAmerican(defaultStartDate()),
      endDate: formatDateAmerican(new Date())
    };
  },
  computed: {
    _startDate: {
      get() {
        return this.startDate;
      },
      set(newStartDate) {
        if (!(newStartDate instanceof Date) && !newStartDate.match(AMERICAN_DATE_REGEX)) return;
        this.startDate = formatDateAmerican(new Date(newStartDate));
        this.debouncedEmitStartDateChangedEvent(EVENT_TYPES.START_DATE_CHANGED, this.startDate);
      }
    },
    _endDate: {
      get() {
        return this.endDate;
      },
      set(newEndDate) {
        if (!(newEndDate instanceof Date) && !newEndDate.match(AMERICAN_DATE_REGEX)) return;
        this.endDate = formatDateAmerican(new Date(newEndDate));
        this.debouncedEmitEndDateChangedEvent(EVENT_TYPES.END_DATE_CHANGED, this.endDate);
      }
    }
  },
  created() {
    this.debouncedEmitStartDateChangedEvent = debounce(this.$emit, 500);
    this.debouncedEmitEndDateChangedEvent = debounce(this.$emit, 500);
  },
  methods: {
    onStartDateSelect(instance, date) {
      this._startDate = date;
    },
    onEndDateSelect(instance, date) {
      this._endDate = date;
    }
  },
  mounted() {
    this.$startDatePicker = datepicker("#dateSelectorStart", {
      formatter: (instance, date) => {
        instance.value = formatDateAmerican(date);
      },
      maxDate: new Date(),
      minDate: new Date(DATA_LOWER_LIMIT_DATE),
      onSelect: this.onStartDateSelect,
      startDate: defaultStartDate()
    });

    this.$endDatePicker = datepicker("#dateSelectorEnd", {
      formatter: (instance, date) => {
        instance.value = formatDateAmerican(date);
      },
      maxDate: new Date(),
      minDate: new Date(DATA_LOWER_LIMIT_DATE),
      onSelect: this.datepickerSelect
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
