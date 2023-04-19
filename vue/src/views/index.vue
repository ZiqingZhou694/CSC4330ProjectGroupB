<template>
<div>
  <div style="height: 60px; line-height: 60px; border-bottom: 1px solid #ccc; background-color: aliceblue">
    <div style="display: flex">
      <!--        改动-->
      <router-link to="/index" style="text-decoration: none">
        <div style="width: 200px; color: dodgerblue; font-weight: bold;  text-align: center; font-size: 20px">
          <img src="../assets/lsu.png" alt="" style="width: 40px; position: relative; top: 5px">
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
            <router-link to="/home" style="text-decoration: none">
            <el-avatar :size="40" :src="user.avatar" style="margin-top: 10px" />
            </router-link>
          </el-dropdown>
          <router-link v-else to="/login">Login</router-link>

        </div>
      </div>
    </div>
  </div>

  <div>
    <el-carousel :interval="5000" arrow="always">
      <el-carousel-item v-for="item in 4" :key="item">
        <h3>{{ item }}</h3>
      </el-carousel-item>
    </el-carousel>
  </div>
  <div>please edit in here or create a new div!</div>
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

<style>
.el-carousel__item h3 {
  color: #475669;
  font-size: 18px;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}
</style>
<!--<style scoped>-->

<!--</style>-->