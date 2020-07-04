import Vue from 'vue';
import Router from 'vue-router';
import Connect from './components/Connect.vue';
import Agenda from './components/Agenda.vue';
import Student from './components/Student.vue';
import Asso from './components/Asso.vue';
import Habitant from './components/Habitant.vue';
import Index from './components/index.vue'

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'index',
      component: Index
    },
    {
      path: '/connect',
      name: 'connect',
      component: Connect
    },
    {
      path: '/agenda',
      name: 'agenda',
      component: Agenda
    },
    {
      path: '/student',
      name: 'student',
      component: Student
    },
    {
      path: '/asso',
      name: 'asso',
      component: Asso
    },
    {
      path: '/habitant',
      name: 'habitant',
      component: Habitant
    }
  ],
});
