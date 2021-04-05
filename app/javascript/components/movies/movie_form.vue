<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-2"></div>
      <div class="col-8">  
        <h3 v-if="newMovie">Create a Movie</h3>
        <h3 v-else>Update a Movie</h3>
        <form accept-charset="UTF-8" class="form-horizontal m-5" @submit.prevent="updateMovie">
          <div class="form-group mt-3">
            <label class="control-label col-sm-2">Title:</label>
            <input class="control-label col-sm-8" type="text" name="title" required v-model="movie.title">
          </div>
          <div class="form-group mt-3">
            <label class="control-label col-sm-2">Date:</label>
            <input class="control-label col-sm-8" type="date" name="releaseDate" v-model="movie.releaseDate">
          </div>
          <div class="form-group mt-3">
            <button v-if="!newMovie" class="btn btn-primary" type="submit">Update</button>
            <button v-else class="btn btn-primary" type="submit">Create</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>  
  export default {
    props: ['movie', 'newMovie'],
    data(){
      return {
      }
    },
    methods: {
      updateMovie(){
        this.$emit('submit', this.movie)
      }
    }
  }
</script>
