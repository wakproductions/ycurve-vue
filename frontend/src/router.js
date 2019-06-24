import Vue from "vue";
import VueRouter from "vue-router";
import ContactView from "@/views/ContactView";
import FrequentlyAskedQuestionsView from "@/views/FrequentlyAskedQuestionsView";
import YieldCurveChartView from "@/views/YieldCurveChartView";
import ChartTreasuriesTimeSeriesView from "@/views/ChartTreasuriesTimeSeriesView";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    alias: "/charts/yield-curve",
    name: "yield-curve-chart",
    component: YieldCurveChartView
  },
  {
    path: "/charts/treasuries-time-series",
    name: "treasuries-time-series-chart",
    component: ChartTreasuriesTimeSeriesView
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
