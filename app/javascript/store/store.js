import Vue from 'vue'
import Vuex from 'vuex'
import http from '../common/http.js'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    users: [],
    currentUser: null,
    newUser: {
      first_name: '',
      last_name: '',
      email: '',
      password: '',
    },
    movies: [],
    newMovie: {
      title: '',
      releaseDate: ''
    },
    currentMovie: null,
    user: null,
  },
  mutations: {
    setUsers(state, data) {
      state.users = data
    },
    setUser(state, data) {
      state.user = data
    },
    setCurrentUser(state, data) {
      state.currentUser = data
    },
    setCurrentMovie(state, data) {
      state.currentMovie = data
    },
    clearCurrentUser(state) {
      state.currentUser = null
    },
    setMovies(state, data) {
      state.movies = data
    },
  },
  actions: {
    fetchUsers({commit, getters}) {
      http
      .get('/api/v1/users.json')
      .then( (res) => {
        commit('setUsers', res.data.users)   
      })
      .catch((error)=>{
        console.log('Error: ', error)
      })
    },
    fetchMovies({commit, getters}) {
      http
      .get('/api/v1/movies.json')
      .then( (res) => {
        commit('setMovies', res.data.movies)   
      })
      .catch((error)=>{
        console.log('Error: ', error)
      })
    },
    fetchCurrentUser({commit, getters}){
      http
        .get('/api/v1/sessions.json')
        .then((res)=>{
          commit('setCurrentUser', res.data.user)
          // console.log("Message: ", res.data.message)
        })
        .catch((error)=>{
          console.log("Error: ", error)
        })
    },
  },
  getters: {
    users: state => state.users,
    user: state => state.user,
    currentUser: state => state.currentUser,
    movies: state => state.movies,
    newMovie: state => state.newMovie,
    currentMovie: state => state.currentMovie,
  }
});
