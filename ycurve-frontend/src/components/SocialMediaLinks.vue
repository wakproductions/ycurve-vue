<template>
  <div class="col-sm-12">
    <a href="https://twitter.com/share" class="twitter-share-button" data-via="GreenspudTrades" data-show-count="false">Tweet</a>
  </div>
</template>

<script>
  export default {
    name: "SocialMediaLinks",
    props: {
      msg: String
    },
    mounted: function() {
      // TODO this thing aint working
      let twitterScript = document.createElement('script');
      twitterScript.async=true
      twitterScript.setAttribute('src', "//platform.twitter.com/widgets.js")
      twitterScript.setAttribute('charset', "utf-8")
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  h3 {
    margin: 40px 0 0;
  }
  ul {
    list-style-type: none;
    padding: 0;
  }
  li {
    display: inline-block;
    margin: 0 10px;
  }
  a {
    color: #42b983;
  }
</style>
