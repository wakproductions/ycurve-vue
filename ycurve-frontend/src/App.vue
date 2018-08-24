<template>
  <div id="app" class="container-fluid">
    <HeadingTitle></HeadingTitle>
    <SocialMediaLinks></SocialMediaLinks>
    <YieldCurveChart></YieldCurveChart>
  </div>
</template>

<script>
import HeadingTitle from "./components/HeadingTitle.vue";
import SocialMediaLinks from "./components/SocialMediaLinks.vue";
import YieldCurveChart from "./components/YieldCurveChart.vue";

export default {
  name: "app",
  components: {
    YieldCurveChart,
    HeadingTitle,
    SocialMediaLinks
  }
};
</script>

<style lang="scss">
@import "stylesheets/bootstrap-includes.scss";

#app {
  /*font-family: "Arial", Helvetica, Arial, sans-serif;*/
  /*-webkit-font-smoothing: antialiased;*/
  /*-moz-osx-font-smoothing: grayscale;*/
  text-align: center;
}
</style>
