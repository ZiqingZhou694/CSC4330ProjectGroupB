import { createRouter, createWebHistory } from 'vue-router'
import {useUserStore} from "@/stores/user"
const modules = import.meta.glob('../views/*.vue')

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Layout',
      redirect: '/home',
      component: () => import('../layout/Layout.vue'),
      children: [
        { path: 'home', name: 'Home', component: () => import('../views/Home.vue') },
        { path: 'person', name: 'Person', component: () => import('../views/Person.vue') },
        { path: 'password', name: 'Password', component: () => import('../views/Password.vue') },
      ]
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('../views/Login.vue')
    },
    {
      path: '/register',
      name: 'Register',
      component: () => import('../views/Register.vue')
    },
    {
      path: '/404',
      name: '404',
      component: () => import('../views/404.vue')
    }
  ]
})

// Note: Refreshing the page causes the page route to be reset
export const setRoutes = (menus) => {
  if (!menus || !menus.length) {
    const manager = localStorage.getItem('manager')
    if (!manager) {
      return
    }
    menus = JSON.parse(manager).managerInfo.menus
  }

  if (menus.length) {
    // Start rendering; user-added routes
    menus.forEach(item => {   // All pages need to be routed, while directories do not need to set up routes
      if (item.path) {  // Set the route if and only if the path is not empty
        router.addRoute('Layout', { path: item.path, name: item.page, component: modules['../views/' + item.page + '.vue'] })
      } else {
        if (item.children && item.children.length) {
          item.children.forEach(sub => {
            if (sub.path) {
              router.addRoute('Layout', { path: sub.path, name: sub.page, component: modules['../views/' + sub.page + '.vue'] })
            }
          })
        }
      }
    })
  }
}

setRoutes()


// Route guard
router.beforeEach((to, from, next) => {
  const store = useUserStore()  // Get user object information
  const user = store.managerInfo.user
  const hasUser = user && user.id
  const noPermissionPaths = ['/login', '/register', '/404']   // Define routes that do not require login
  // 用户没登录,  假如你当前跳转login页面，然后login页面没有用户信息，这个时候你再去往 login页面跳转，就会发生无限循环跳转
  //The user is not logged in, so if you go to the login page right now, then the login page doesn't have the user information. At this time you go to the login page jump, there will be an infinite loop jump
  if (!hasUser && !noPermissionPaths.includes(to.path)) {
    // get cashed user data
    //  if to.path === '/login'    !noPermissionPaths.includes(to.path) return false，will not run next("/login")
    next("/login")
  } else {
    if (!to.matched.length) {
      next('/404')
    } else {
      next()
    }
  }
})

export default router
