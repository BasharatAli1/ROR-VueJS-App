<template>
  <div>
    <user-form :user="user" :new-user="false" @submit="updateUser"></user-form>
    <form accept-charset="UTF-8" @submit.prevent="createUser">
      <div class="form-group">
        <label >First Name:</label>
        <input type="text" class="form-control" placeholder="Enter First Name" v-model="firstName">
      </div>
      <div class="form-group">
        <label >Last Name:</label>
        <input type="text" class="form-control" placeholder="Enter Last Name" v-model="lastName">
      </div>
      <div class="form-group">
        <label for="exampleInputEmail1">Email address:</label>
        <input type="email" class="form-control" placeholder="Enter email" v-model="email" required>
      </div>
      <div class="form-group">
        <label>Password:</label>
        <input type="password" class="form-control" placeholder="Password" v-model="password" required>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>

  </div>
</template>

<script>
import http from '../../common/http.js'
import { mapGetters, mapMutations } from 'vuex'
import UserForm from './user_form.vue'
export default{
  data: function () {
    return {
      firstName: '',
      lastName: '',
      email: '',
      password: '',
    }
  },
  components:{
    UserForm,
  },
  methods: {
    createUser(){
      http
        .post('/api/v1/users.json', {first_name: this.firstName, last_name: this.lastName, email: this.email, password: this.password})
        .then((res)=>{
          console.log("Message", res.data.message);
          this.$router.push('/login')
        })
        .catch((error)=>{
          console.log("Error", error);
          this.$router.push('/users/new')
        });
    }
  }
}
</script>

<style>
</style>
