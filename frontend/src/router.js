import Vue from "vue";
import VueRouter from "vue-router";
import ContactView from "@/views/ContactView";
import FrequentlyAskedQuestionsView from "@/views/FrequentlyAskedQuestionsView";
import YieldCurveChartView from "@/views/YieldCurveChartView";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "yield-curve-chart",
    component: YieldCurveChartView
  },
  {
    path: "/faq",
    name: "faq",
    component: FrequentlyAskedQuestionsView
  },
  {
    path: "/contact",
    name: "contact",
    component: ContactView
  }

];

const router = new VueRouter({
  mode: "history",
  routes
});

export default router;
