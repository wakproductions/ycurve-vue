<template>
  <div id="app" class="container-fluid">
    <heading-title/>
    <yield-curve-viewer/>
  </div>
</template>

<script>
import store from "./store"
import HeadingTitle from "./components/HeadingTitle.vue";
import SocialMediaLinks from "./components/SocialMediaLinks.vue";
import YieldCurveViewer from "./components/YieldCurveViewer.vue";

export default {
  name: "app",
  store: store,
  components: {
    YieldCurveViewer,
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
