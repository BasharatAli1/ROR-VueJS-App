<template>
  <div id="app">
    <home></home>
    <router-view></router-view>
  </div>
</template>

<script>
import Home from './components/shared/home';

export default {
  components: {
    Home
  },
  mounted() {
    this.$store.dispatch('fetchCurrentUser');
  },
  data () {
    return {}
  },
}
</script>
