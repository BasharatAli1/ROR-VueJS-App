<template>
  <div>
    <div class="container">
      <div class="row mt-5">
        <div class="col-2"></div>
        <div class="col-8">
        </div>
      </div>
      <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
          <table class="table">
            <thead>
              <tr>
                <th>Name</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in users">
                <td class="title" @click="showUser()">
                  {{user.first_name}} {{user.last_name}}
                </td>
                <td>
                  <button @click="editUser(user)" class="btn btn-primary"> Edit </button>
                  <button @click="removeUser(user)" class="btn btn-danger"> Delete </button>
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
import { mapGetters } from 'vuex'
import http from '../../common/http'
export default {
  data: function () {
    return {
    }
  },
  mounted() {
    this.$store.dispatch('fetchUsers');
    // this.$store.dispatch('fetchCurrentUser');
    this.fetchUser(this.$route.params.id)
  },
  computed: {
    ...mapGetters(['users'])
  },
  methods: {
    editUser(user){
      this.$router.push(`/users/${user.id}/edit`)
    },
    removeUser(user){
      http
      .delete(`/api/v1/users/${user.id}.json`)
      .then((res)=>{
        this.$store.dispatch('fetchUsers');
      })
      .catch((error)=>{
        console.log("Error: ", error)
      })
    },
    fetchUser(id){
      http
        .get(`/api/v1/users/${id}.json`)
        .then((res)=>{
          commit('setUser', res.data.user)
          console.log("Message: User returned", res.data.user)
        })
        .catch((error)=>{
          console.log("Error: ", error)
        })
    },
    showUser(){
      this.$router.push('/')
    }
  }
}
</script>
