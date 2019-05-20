<template>
  <div id="app-navigation">
    <b-navbar toggleable="sm" type="light" variant="light">
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>

        <b-navbar-nav>
          <b-nav-item href="/">Chart</b-nav-item>
          <!--<b-nav-item href="#">FAQ</b-nav-item>-->
          <b-nav-item href="/contact">Contact</b-nav-item>
        </b-navbar-nav>

      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
export default {
  name: "AppNavigation",
  props: {}
};
</script>

<style scoped lang="scss">
#app-navigation {
  margin-bottom: 12px;
}
</style>
