<template>
  <div>
    <div class="container">
      <div class="row mt-5">
        <div class="col-2"></div>
        <div class="col-8">
          <button class="btn btn-primary" @click="createMovie">Create a movie</button>
        </div>
      </div>
      <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
          <table class="table">
            <thead>
              <tr>
                <th>Title</th>
                <th>Release Date</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="movie in movies">
                <td class="title" @click="showMovie(movie)">
                  {{movie.title}}
                </td>
                <td>
                  {{movie.releaseDate}}
                </td>
                <td>
                  <button @click="editMovie(movie)" class="btn btn-primary"> Edit </button>
                  <button @click="removeMovie(movie)" class="btn btn-danger"> Delete </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import http from '../../common/http'
import { mapGetters } from 'vuex'
export default {
  data: function () {
    return {
    }
  },
  mounted() {
    this.$store.dispatch('fetchMovies');
    this.$store.dispatch('fetchCurrentUser');
  },
  computed: {
    ...mapGetters(['movies'])
  },
  methods: {
    createMovie(){
      this.$router.push('/movies/new')
    },
    editMovie(movie){
      this.$router.push(`/movies/${movie.id}/edit`)
    },
    removeMovie(movie){
      http
      .delete(`/api/v1/movies/${movie.id}.json`)
      .then((res)=>{
        this.$store.dispatch('fetchMovies');
      })
      .catch((error)=>{
        console.log("Error: ", error)
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
