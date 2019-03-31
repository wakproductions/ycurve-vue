<template>
  <div id="app" class="container-fluid">
    <heading-title/>
    <yield-curve-viewer/>
  </div>
</template>

<script>
import store from "./store"
import HeadingTitle from "./components/HeadingTitle.vue";
// import SocialMediaLinks from "./components/SocialMediaLinks.vue";
import YieldCurveViewer from "./components/YieldCurveViewer.vue";

// This is a debug line to make sure API server environment variable is pointing to the right place
// console.log(process.env.VUE_APP_API_SERVER_URL)

export default {
  name: "app",
  store: store,
  components: {
    HeadingTitle,
    // SocialMediaLinks,
    YieldCurveViewer,
  }
};
</script>

<style lang="scss">
@import "stylesheets/bootstrap-includes.scss";
@import 'node_modules/js-datepicker/dist/datepicker.min';


#app {
  /*font-family: "Arial", Helvetica, Arial, sans-serif;*/
  /*-webkit-font-smoothing: antialiased;*/
  /*-moz-osx-font-smoothing: grayscale;*/
  text-align: center;
}

.action-button {
  border-radius: 4px;
  cursor: pointer;
  display: inline;
  padding: 5px;
}

.blue-bg {
  background: #35cef1;
}

.green-bg {
  background: #02d6a9;
}

.yellow-bg {
  background: #efedb1;
}
</style>
