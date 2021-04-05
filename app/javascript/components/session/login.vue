<template>
  <div>
    <form accept-charset="UTF-8" @submit.prevent="validate">
      <div class="form-group">
        <label>Email address:</label>
        <input type="email" class="form-control" placeholder="Enter email" v-model="email" required>
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" class="form-control" placeholder="Password" v-model="password" required>
      </div>
      <button type="submit" class="btn btn-primary">Login</button>
    </form>
  </div>
</template>

<script>
import http from '../../common/http.js'
import { mapGetters, mapMutations } from 'vuex'
export default {
  data: function () {
    return {
      email: '',
      password: '',
    }
  },
  methods: {
    ...mapMutations(['setCurrentUser']),
    validate(){
      http
        .post('/api/v1/sessions.json', {email: this.email, password: this.password})
        .then((res)=>{
          console.log("Message", res.data.message);
          this.setCurrentUser(res.data.user);
          this.$router.push('/')
        })
        .catch((error)=>{
          console.log(error)
          this.$router.push('/login')
        });
    }
  },
  computed: {
    ...mapGetters(['currentUser']),
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
