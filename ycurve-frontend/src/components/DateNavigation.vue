<template>
  <div id="date-navigation">
    <div class="action-button yellow-bg" @click="dateMoveDown()"><font-awesome-icon icon="angle-left" /></div>
    <input id="dateSelector" type="text" v-model="_viewerDate" />
    <div class="action-button yellow-bg" @click="dateMoveUp()"><font-awesome-icon icon="angle-right" /></div>
    <div id="pin-yield-curve-button" class="action-button blue-bg" @click="pinYieldCurve()">
      <font-awesome-icon icon="paperclip" />
    </div>
  </div>
</template>

<script>
import datepicker from "js-datepicker";
import { debounce } from "lodash";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faAngleLeft } from "@fortawesome/free-solid-svg-icons";
import { faAngleRight } from "@fortawesome/free-solid-svg-icons";
import { faPaperclip } from "@fortawesome/free-solid-svg-icons";
import { AMERICAN_DATE_REGEX, formatDateAmerican, convertStringToDate, offsetDate } from "@/util/dateUtils";

library.add(faAngleLeft);
library.add(faAngleRight);
library.add(faPaperclip);

const EVENT_TYPES = {
  DATE_CHANGED: "date-changed",
  DATE_MOVE_UP: "date-move-up",
  DATE_MOVE_DOWN: "date-move-down",
  PIN_YIELD_CURVE: "pin-yield-curve"
};

const LOWER_DATE_LIMIT = new Date("1/1/1934");

export default {
  name: "DateNavigation",
  components: {
    FontAwesomeIcon
  },
  created() {
    this.debouncedChangeDateEvent = debounce(this.emitChangeDateEvent, 800);
  },
  data() {
    return {
      viewerDate: formatDateAmerican(new Date())
    };
  },
  computed: {
    _viewerDate: {
      get() {
        return this.viewerDate;
      },
      set(newDate) {
        if (!newDate.match(AMERICAN_DATE_REGEX)) {
          return;
        }

        var parsedDate = new Date(newDate);
        if (parsedDate >= LOWER_DATE_LIMIT && parsedDate <= new Date()) {
          this.viewerDate = formatDateAmerican(parsedDate);
          this.$emit("date-changed", this.viewerDate);
        } // TODO else display an error message that the date being entered is invalid
      }
    }
  },
  methods: {
    emitChangeDateEvent(eventType, baseDate) {
      this.$emit(eventType, baseDate);
    },
    dateMoveUp() {
      this.debouncedChangeDateEvent(EVENT_TYPES.DATE_MOVE_UP, this.viewerDate);
      // console.log('Anticipating date: ' + formatDateAmerican(offsetDate(convertStringToDate(this.viewerDate), 1)) + ' (current date='+ this.viewerDate  + ')')
      this.viewerDate = formatDateAmerican(offsetDate(convertStringToDate(this.viewerDate), 1));
    },
    dateMoveDown() {
      this.debouncedChangeDateEvent(EVENT_TYPES.DATE_MOVE_DOWN, this.viewerDate);
      // console.log('Anticipating date: ' + formatDateAmerican(offsetDate(convertStringToDate(this.viewerDate), -1)))
      this.viewerDate = formatDateAmerican(offsetDate(convertStringToDate(this.viewerDate), -1));
    },
    datepickerSelect(instance, date) {
      this._viewerDate = date.toLocaleDateString();
    },
    pinYieldCurve() {
      this.$emit(EVENT_TYPES.PIN_YIELD_CURVE);
    },
    setViewerDateText(newDate) {
      this.viewerDate = newDate;
      this.$jsdatepicker.setDate(new Date(newDate), true)
    }
  },
  mounted() {
    this.$jsdatepicker = datepicker("#dateSelector", {
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

#date-navigation {
  text-align: left;
}

#pin-yield-curve-button {
  margin-left: 20px;
}

input {
  margin: 3px 3px;
}
</style>
