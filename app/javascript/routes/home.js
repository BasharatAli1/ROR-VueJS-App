import Vue from 'vue';
import VueRouter from 'vue-router';
import Movies from '../components/movies/movies_index.vue'
import MoviesNew from '../components/movies/movies_new.vue'
import MoviesEdit from '../components/movies/movies_edit.vue'
import Users from '../components/users/users_index.vue'
import UsersEdit from '../components/users/users_edit.vue'
import Login from '../components/session/login.vue'
import SignUp from '../components/users/user_signup.vue'

Vue.use(VueRouter);

const router = new VueRouter({
  routes: [
    {
      name: Users,
      path: '/users',
      component: Users
    },
    {
      name: UsersEdit,
      path: '/users/:id/edit',
      component: UsersEdit
    },
    {
      name: Movies,
      path: '/movies',
      component: Movies
    },
    {
      name: MoviesNew,
      path: '/movies/new',
      component: MoviesNew
    },
    {
      name: Login,
      path: '/login',
      component: Login
    },
    {
      name: SignUp,
      path: '/users/new',
      component: SignUp
    },
    {
      name: MoviesEdit,
      path: '/movies/:id/edit',
      component: MoviesEdit
    },
  ],
  hashbang: false,
  mode: 'history',
  base: '/'
});

export default router
