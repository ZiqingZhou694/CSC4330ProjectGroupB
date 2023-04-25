<template>
<div>
  <div style="height: 60px; line-height: 60px; border-bottom: 1px solid #ccc; background-color: aliceblue">
    <div style="display: flex">
      <router-link to="/index" style="text-decoration: none">
        <div style="width: 200px; color: dodgerblue; font-weight: bold;  text-align: center; font-size: 20px">
          <img src="../assets/lsu.png" alt="" style="width: 40px; position: relative; top: 5px">
          Tutoring Center
        </div>
      </router-link>


      <div style="flex: 1; display: flex">
        <div style="flex: 1">
        </div>
        <div style="width: 300px; text-align: right; padding-right: 20px">
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

  <div >
    <el-carousel :autoplay="true">
      <el-carousel-item><img src="../assets/index1.png" class="carousel_image_type"></el-carousel-item>
      <el-carousel-item><img src="../assets/index2.png" class="carousel_image_type"></el-carousel-item>
      <el-carousel-item><img src="../assets/index3.png" class="carousel_image_type"></el-carousel-item>
      <el-carousel-item><img src="../assets/index4.png" class="carousel_image_type"></el-carousel-item>
    </el-carousel>
  </div>
</div>
  <div style="background-color: #f2f0ff; padding: 50px;">
  <div style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 50px">
    <h1 style="font-weight: bold; color: #666666 ">"Learn Smarter, Anytime, Together"</h1>
    <div style="width: 60%; padding: 50px; color: #666666 ">
      <h4> To develop an intuitive and user-friendly tutor app tailored for LSU students that seamlessly integrates into the university ecosystem,
        fostering a collaborative learning environment and promoting academic success across all courses and disciplines.</h4>
    </div>
  </div>
  </div>
  <div style="background-color: #ffffea; padding: 50px;">
  <div class="card-container">
    <el-card class="card-item" style="display: flex">
      <div style="display: flex">
        <div style="flex-grow: 0; width: auto;"><el-icon :size="100" style="margin-right: 10px; display: flex; align-items: center; justify-content: center"><EditPen /></el-icon></div>
        <div style="flex-grow: 1; width: 80%;">
          <h2 slot="header" class="card-title">Online Tutoring Center</h2>
          <div class="card-content">
            <p>Our online tutoring center is a platform designed to facilitate online tutoring for students. Our goal is to provide a simple and user-friendly tool that allows students to easily schedule appointments and arrange tutoring sessions to improve their academic performance.</p>
          </div>
        </div>
      </div>

    </el-card>


    <el-card class="card-item" style="display: flex">
      <h2 slot="header" class="card-title">Navigating the Platform</h2>
      <div style="display: flex">
        <div style="flex-grow: 0; width: auto; display: flex">
          <div class="card-content">
            <p>Students can see a list of available tutors with subject or availability details. Students can schedule tutoring appointments at any time and rate tutors after scheduled appointments have taken place, providing valuable feedback to improve their experience.</p>
          </div>
        </div>
        <div style="flex-grow: 1; width: auto;"><el-icon :size="100"><Calendar /></el-icon></div>
      </div>

    </el-card>

    <el-card class="card-item" style="display: flex">
      <div style="display: flex">
        <div style="flex-grow: 0; width: auto;"><el-icon :size="100" style="margin-right: 10px; display: flex; align-items: center; justify-content: center"><TrophyBase /></el-icon></div>
        <div style="flex-grow: 1; width: 80%;">
          <h2 slot="header" class="card-title">Benefits of Online Tutoring Center</h2>
          <div class="card-content">
            <p>Our online tutoring center is designed to provide an efficient, simple, and reliable tutoring tool for students to improve their academic performance and receive the support they need. With our platform, students can easily find a tutor who is available to assist them with a specific question and receive personalized support to help them achieve their academic goals.</p>
          </div>
        </div>
      </div>
    </el-card>
  </div>
  </div>

  <div style="background-color: #f2f0ff; padding: 50px;">
  <div style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 50px">
    <h1 style="font-weight: bold; color: #666666 ">Give Us Feedback</h1>
    <div style="display: flex; padding: 10px">
      <el-icon :size="30" style="margin-right: 10px; display: flex; align-items: center; justify-content: center" ><Message /></el-icon>
      <img src="../assets/discord.png" alt="Discord Icon" width="30" height="30" />
    </div>
  </div>
<div style="display: flex; justify-content: center; align-items: center; flex-direction: column; padding: 50px">
  <h1 style="font-weight: bold; color: #666666 ">Need Help?</h1>
  <div style="display: flex; padding: 10px">
    <el-icon :size="20" style="margin-right: 10px; display: flex; align-items: center; justify-content: center" ><Phone/></el-icon>
    <p style="padding-right: 10px"> Call (888) 888-8888</p>
  </div>
</div>
  </div>

  <footer>
    <p>@CSC 4330 Tutoring Center Develop by Group B</p>
  </footer>
</template>

<script setup>
import router from "@/router";
import {useUserStore} from "@/stores/user";
import { computed } from 'vue';


const userStore = useUserStore()
let user = userStore.getUser
const activePath = router.currentRoute.value.path.replace('/', '')

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
.el-carousel__item {
  height: 400px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%;
  display: flex;

}
.el-carousel {
  height: 400px;

}

.carousel_image_type{
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%!important;
  display: flex;
}

.el-carousel__item:nth-child(2n) {
  background-color: #282828;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #282828;
}
footer {
  color: rgb(69,142,247);
  background: rgb(241,248,254);
  height: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.card-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 50px;
}

.card-item {
  width: 60%;
  margin: 20px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  border: none;
}

.card-title {
  color: #666666;
  font-weight: bold;
  font-size: 24px;
}

.card-content {
  padding: 20px;
  color: #666666;
}
</style>