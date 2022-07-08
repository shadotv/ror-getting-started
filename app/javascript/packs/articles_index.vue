<template>
  <div>
    <h1>Listing articles with vue</h1>
    <tr v-for="article in articles">
      <td>{{article.title}}</td>
      <td>{{article.text}}</td>
      <td><a href=""></a></td>
    </tr>
  </div>
</template>

<script>
export default {
  props: {
    articles: {
      type: Array,
      default: () => { return []}
    },
    test:"ciao"
  },
  data() {
    return {};
  },
  mounted() {
    console.log(this.articles);
  }
};
</script>

<style lang="sss" scoped>

</style>