<template>
  <div id="app-navigation">
    <b-navbar toggleable="sm" type="light" variant="light">
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>

        <b-navbar-nav>
          <b-nav-item-dropdown text="Charts" left>
            <b-nav-item :to="{ name: 'yield-curve-chart' }">Yield Curve</b-nav-item>
            <b-nav-item :to="{ name: 'treasuries-time-series-chart' }">Treasuries Time Series</b-nav-item>
          </b-nav-item-dropdown>
          <b-nav-item :to="{ name: 'faq' }">FAQ</b-nav-item>
          <b-nav-item :to="{ name: 'contact' }">Contact</b-nav-item>
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
