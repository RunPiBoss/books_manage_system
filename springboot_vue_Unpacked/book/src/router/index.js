import Vue from 'vue'
import Router from 'vue-router'
import Main from '../view/Main.vue'
import Welcome from "../view/Welcome.vue";
import Category from "../view/Category.vue";
import Book from "../view/Book.vue";
import User from "../view/User.vue";
import Logs from "../view/Logs.vue";

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Main',
      component: Main,
      redirect: '/welcome',
      children: [
        {
          path: "/welcome",
          name: 'Main',
          component: Welcome
        },
        {
          path: "/category",
          name: 'category',
          component: Category
        }, {
          path: "/book",
          name: 'book',
          component: Book
        }, {
          path: "/user",
          name: 'user',
          component: User
        },{
          path: "/logs",
          name: 'logs',
          component: Logs
        },
      ]
    }
  ]
})
