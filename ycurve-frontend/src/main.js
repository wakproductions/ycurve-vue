import Vue from "vue";
import BootstrapVue from "bootstrap-vue";
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import App from "./App.vue";

Vue.config.productionTip = false;
Vue.use(BootstrapVue);

Vue.component('font-awesome-icon', 'FontAwesomeIcon')

new Vue({
  render: h => h(App),
}).$mount("#app");
