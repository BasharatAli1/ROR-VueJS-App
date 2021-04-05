import Vue from 'vue'
import App from '../app.vue'
import router from '../routes/home.js'
import { store } from '../store/store.js'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
	store,
    router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
});
