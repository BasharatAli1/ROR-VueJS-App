<template>
  <div>    
    <movie-form :movie="newMovie" :new-movie="true" @submit="addMovie"></movie-form>
  </div>
</template>

<script>
import http from '../../common/http'
import { mapGetters } from 'vuex'
import MovieForm from './movie_form.vue'
export default {
  data: function () {
    return {
    }
  },
  components:{
    MovieForm,
  },
  mounted() {
    this.$store.dispatch('fetchCurrentUser');
  },
  methods:{
    addMovie(){
      http
      .post('/api/v1/movies.json', this.newMovie)
      .then((res)=>{
        console.log("Message", res.data.message)
        this.$router.push('/movies')
      })
      .catch((error)=>{
        console.log("Error", error);
        this.$router.push('/movies/new')
      });
    }
  },
  computed: {
    ...mapGetters(['newMovie'])
  }
}
</script>
