<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-2"></div>
      <div class="col-8">  
        <h3 v-if="newUser">Sign Up</h3>
        <h3 v-else>Update a User</h3>
        <form accept-charset="UTF-8" class="form-horizontal m-5" @submit.prevent="updateUser">
          <div class="form-group mt-3">
            <label class="control-label col-sm-2">First Name:</label>
            <input class="control-label col-sm-8" type="text" required v-model="user.first_name">
          </div>
          <div class="form-group mt-3">
            <label class="control-label col-sm-2">Last Name:</label>
            <input class="control-label col-sm-8" type="text" required v-model="user.last_name">
          </div>
          <div class="form-group mt-3">
            <label class="control-label col-sm-2">E-mail:</label>
            <input class="control-label col-sm-8" type="email" required v-model="user.email">
          </div>
          <div class="form-group mt-3">
            <label class="control-label col-sm-2">Password:</label>
            <input class="control-label col-sm-8" type="password" required v-model="user.password">
          </div>
          <div class="form-group mt-3">
            <button v-if="!newUser" class="btn btn-primary" type="submit">Update</button>
            <button v-else class="btn btn-primary" type="submit">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>  
  export default {
    props: ['user', 'newUser'],
    data(){
      return {
      }
    },
    methods: {
      updateUser(){
        this.$emit('submit', this.user)
      }
    }
  }
</script>
