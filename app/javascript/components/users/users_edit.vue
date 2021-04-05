<template>
  <div v-if="user != undefined">
    <user-form :user="user" :new-user="false" @submit="updateUser"></user-form>
  </div>
</template>

<script>
import http from '../../common/http'
import { mapGetters, mapMutations } from 'vuex'
import UserForm from './user_form.vue'
export default {
  data: function () {
    return {
    }
  },
  components:{
    UserForm,
  },
  mounted() {
    this.fetchUser(this.$route.params.id)
  },
  methods:{
    ...mapMutations(['setUser']),
    updateUser(){
      http
      .patch(`/api/v1/users/${this.user.id}.json`, this.user)
      .then((res)=>{
        console.log("Message", res.data.message)
        this.setUser(this.user);
        this.$router.push('/users')
      })
      .catch((error)=>{
        console.log("Error", error);
        this.$router.push('/users')
      });
    },
    fetchUser(id){
      http
        .get(`/api/v1/users/${id}.json`)
        .then((res)=>{
          this.setUser(res.data.user)
          console.log("Message: User returned", res.data.user)
        })
        .catch((error)=>{
          console.log("Error: ", error)
        })
    },
  },
  computed: {
    ...mapGetters(['users', 'user'])
  }
}
</script>
