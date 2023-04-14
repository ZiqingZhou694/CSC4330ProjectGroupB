<template>
<div>
  <div style="height: 60px; line-height: 60px; border-bottom: 1px solid #ccc; background-color: aliceblue">
    <div style="display: flex">
      <!--        改动-->
      <router-link to="/index" style="text-decoration: none">
        <div style="width: 200px; color: dodgerblue; font-weight: bold;  text-align: center; font-size: 20px">
          <img src="../assets/icon.png" alt="" style="width: 40px; position: relative; top: 12px">
          Tutoring Center
        </div>
        <!--          改动 -->
      </router-link>


      <div style="flex: 1; display: flex">
        <div style="flex: 1">
        </div>
        <div style="width: 300px; text-align: right; padding-right: 20px">
<!--          <span style="margin-right: 5px; color: dodgerblue">welcome</span>-->
          <el-dropdown v-if="isLoggedIn">
            <el-avatar :size="40" :src="user.avatar" style="margin-top: 10px" />
          </el-dropdown>
          <router-link v-else to="/login">Login</router-link>

        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script setup>
import { RouterView } from 'vue-router'
import router from "@/router";
import {useUserStore} from "@/stores/user";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import { computed } from 'vue'; // Add this line


const userStore = useUserStore()
let user = userStore.getUser
const activePath = router.currentRoute.value.path.replace('/', '')

// const menus = userStore.getMenus


const getAvatarHandler = (avatar) => {
  user.avatar = avatar
}
const isLoggedIn = computed(() => !!user.avatar)

</script>

<style scoped>

</style>