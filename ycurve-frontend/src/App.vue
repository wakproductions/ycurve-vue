<template>
  <div id="app" class="container-fluid">
    <HeadingTitle></HeadingTitle>
    <SocialMediaLinks></SocialMediaLinks>
  </div>
</template>

<script>
import HeadingTitle from "./components/HeadingTitle.vue";
import SocialMediaLinks from "./components/SocialMediaLinks.vue";

export default {
  name: "app",
  components: {
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
