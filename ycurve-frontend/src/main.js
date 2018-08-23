import Vue from "vue";
import BootstrapVue from "bootstrap-vue";
import App from "./App.vue";

Vue.config.productionTip = false;
Vue.use(BootstrapVue);

new Vue({
  render: h => h(App),
  data: {
    sample_message: "sample message textx"
  }
}).$mount("#app");
