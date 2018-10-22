<template>
  <div id="date-navigation" class="row justify-content-center">
    <div class="col-md-8">
      <div class="action-button yellow-bg" @click="dateDown()"><font-awesome-icon icon="angle-left" /></div>
      <input v-model="_viewerDate" />
      <div class="action-button yellow-bg" @click="dateUp()"><font-awesome-icon icon="angle-right" /></div>
    </div>
  </div>
</template>

<script>
  import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
  import { library } from '@fortawesome/fontawesome-svg-core';
  import { faAngleLeft } from '@fortawesome/free-solid-svg-icons'
  import { faAngleRight } from '@fortawesome/free-solid-svg-icons'
  import { formatDateAmerican } from '@/util/parseDate'

  library.add(faAngleLeft);
  library.add(faAngleRight);

  const LOWER_DATE_LIMIT=new Date('1/31/1990')

  export default {
    name: "DateNavigation",
    components: {
      FontAwesomeIcon
    },
    model: {
      event: 'date-changed'
    },
    data() {
      return {
        viewerDate: formatDateAmerican(new Date())
      }
    },
    computed: {
      _viewerDate: {
        get() {
          return this.viewerDate
        },
        set(newDate) {
          if (!newDate.match(/\d{1,2}\/\d{1,2}\/\d\d\d\d/)) { return }

          var parsedDate = new Date(newDate)
          if ((parsedDate >= LOWER_DATE_LIMIT) && (parsedDate <= new Date)) {
            this.viewerDate = formatDateAmerican(parsedDate)
            this.$emit('date-changed')
          } // TODO else display an error message
        }
      }
    },
    methods: {
      dateUp() {
        var currentDate = new Date(this.viewerDate)
        var newDate = new Date(Date.parse(currentDate) + 60 * 60 * 24 * 1000)
        this._viewerDate = formatDateAmerican(newDate)
      },
      dateDown() {
        var currentDate = new Date(this.viewerDate)
        var newDate = new Date(Date.parse(currentDate) - 60 * 60 * 24 * 1000)
        this._viewerDate = formatDateAmerican(newDate)
      },
    }
  };
</script>

<style scoped lang="scss">
#date-navigation {
  text-align: left;
}

input {
  margin: 3px 3px;
}
</style>
