<template>
  <div id="faq-view" class="container">
    <vue-markdown>{{pageHtml}}</vue-markdown>
  </div>
</template>

<script>
import VueMarkdown from "vue-markdown";
import FaqText from "./FrequentlyAskedQuestions/faq.md";

export default {
  name: "FrequentlyAskedQuestionsView",
  components: {
    VueMarkdown
  },
  data() {
    return {
      pageHtml: FaqText
    };
  },
  props: {}
};
</script>

<style scoped lang="scss">
#faq-view {
  text-align: left;
}
</style>
