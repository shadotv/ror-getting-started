<template>
  <div>
    <h1>Listing articles</h1>
    <tr>
      <td></td>
    </tr>
  </div>
</template>

<script>
export default {
  props: {
    articles: {
      type: Array,
      default: () => { return []}
    }
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