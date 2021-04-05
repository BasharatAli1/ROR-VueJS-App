<template>
  <div v-if="currentMovie != undefined">
    <movie-form :movie="currentMovie" :new-movie="false" @submit="updateMovie"></movie-form>
  </div>
</template>

<script>
import http from '../../common/http'
import { mapGetters, mapMutations } from 'vuex'
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
    this.fetchCurrentMovie(this.$route.params.id)
  },
  methods:{
    ...mapMutations(['setCurrentMovie']),
    updateMovie(){
      http
      .patch(`/api/v1/movies/${this.currentMovie.id}.json`, this.currentMovie)
      .then((res)=>{
        console.log("Message", res.data.message)
        this.setCurrentMovie(this.currentMovie);
        this.$router.push('/movies')
      })
      .catch((error)=>{
        console.log("Error", error);
        this.$router.push('/movies')
      });
    },
    fetchCurrentMovie(id){
      http
        .get(`/api/v1/movies/${id}.json`)
        .then((res)=>{
          this.setCurrentMovie(res.data.movie)
        })
        .catch((error)=>{
          console.log("Error: ", error)
        })
    },
  },
  computed: {
    ...mapGetters(['movies', 'newMovie', 'currentMovie'])
  }
}
</script>
