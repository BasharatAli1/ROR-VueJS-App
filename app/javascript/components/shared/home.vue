<template>
  <div>
    <div class='navigation-bar'>
      <a type="button" @click="goToHome" class="btn btn-secondary text text-light">Home</a>
      <a type="button" @click="goToUsers" class="btn btn-secondary text text-light">Users</a>
      <a type="button" @click="goToMovies" class="btn btn-secondary text text-light">Movies</a>
      <span v-if="currentUser == null">
        <a type="button" @click="goToLogin" class="btn btn-primary text text-light">Login</a>
        <a type="button" @click="goToSignUp" class="btn btn-success text text-light">Sign Up</a>
      </span>
      <span v-else>
        <a type="button" class="btn btn-secondary text text-light mr-2">{{this.currentUser.first_name}} {{this.currentUser.first_name}}</a>
        <a type="button" @click="goToLogOut" class="btn btn-danger text text-light">Log Out</a>
      </span>
    </div>
  </div>
</template>

<script>
  import http from '../../common/http.js'
  import { mapGetters, mapMutations } from 'vuex'
  export default {
    mounted() {
      this.$store.dispatch('fetchCurrentUser');
    },
    methods: {
      ...mapMutations(['clearCurrentUser']),
      goToHome(){
        this.$router.push('/')
      },
      goToMovies(){
        this.$router.push('/movies')
      },
      goToUsers(){
        this.$router.push('/users')
      },
      goToLogin(){
        this.$router.push('/login')
      },
      goToLogOut(){
        http
          .delete(`/api/v1/sessions/${this.currentUser.id}.json`)
          .then((res)=>{
            console.log("Message: ", res.data.message)
            this.clearCurrentUser();
          })
          .catch((error)=>{
            console.log("Error: ", error)
          })
      },
      goToSignUp(){
        this.$router.push('/users/new')
      }
    },
    computed: {
      ...mapGetters(['currentUser']),
    },
  }
</script>

<style scoped>
  /* This css applies *only* to this component */
  .navigation-bar {
    display: flex;
    justify-content: space-around;
    width: 100%;
    background-color: grey;
    padding: 10px 0;
  }

  .navigation-item {
    font-family:Arial, Helvetica, sans-serif;
    color: white;
    line-height: 1.6;
  }
  a{
    color: white;
  }
  a:hover{
    color: #D3D3D3;
  }
</style>
