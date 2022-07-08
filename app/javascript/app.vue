<script>
export default {
  data: function () {
    return {
      message: "Welcome to shado!" 
    }
  }
}
</script>

<template>
  <div id="app">
    <p>{{ message }}</p>
  
  </div>
</template>



<style lang="scss" scoped>
$font-size: 2rem;

p {
  font-size: $font-size;
  text-align: center;
}
</style>
