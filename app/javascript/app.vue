<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Benvenuto in SHADO!"
    }
  }
}
</script>

<style lang="scss" scoped>
$font-size: 2rem;

p {
  font-size: $font-size;
  text-align: center;
}
</style>
