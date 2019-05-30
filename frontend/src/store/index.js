import Vue from 'vue';
import Vuex from 'vuex';
import yieldCurve from './yieldCurve'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    yieldCurve
  },
});
