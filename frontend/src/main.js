import Vue from "vue";
import router from "./router";
import App from "./App.vue";
import BootstrapVue from "bootstrap-vue";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

Vue.config.productionTip = false;
Vue.use(BootstrapVue);

Vue.component("font-awesome-icon", "FontAwesomeIcon");

new Vue({
  render: h => h(App),
  router
}).$mount("#app");
