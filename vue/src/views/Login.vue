<script setup>
import {onMounted, reactive, ref} from "vue"
import {User, Lock} from '@element-plus/icons-vue'
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";
import router, {setRoutes} from "@/router";


const loginData = reactive({})
const rules = reactive({
  username: [
    {required: true, message: 'Enter username', trigger: 'blur'},
  ],
  password: [
    {required: true, message: 'Enter password', trigger: 'blur'},
    {min: 3, max: 20, message: 'password must be at least 3', trigger: 'blur'},
  ],
})
const ruleFormRef = ref()
const login = () => {
  ruleFormRef.value.validate(valid => {
      request.post('/login', loginData).then(res => {
        if (res.code === '200') {
          ElMessage.success('login success')
          const userStore = useUserStore()
          userStore.setManagerInfo(res.data)
          router.push('/home')

        } else {
          ElMessage.error(res.msg)
        }
      })
    // }
  })
}

const Refresh = () => {
  router.push('/').then(() => {
    location.reload();
  })
}

</script>

<template>
  <div style="height: 100vh; overflow: hidden; background-color: aliceblue">
    <div style="width: 100%; background-color: rgba(65, 105, 225,.1);padding: 15px 30px; color: dodgerblue; font-size: 20px; position: absolute">
      <div style="width: 20px">
        <router-link to="/" style="text-decoration: none" @click="Refresh">
          <div style="width: 200px; color: dodgerblue; font-weight: bold;  text-align: center; font-size: 20px">
            <img src="../assets/lsu.png" alt="" style="width: 40px; position: relative; top: 5px;">
            Tutoring Center
          </div>
        </router-link>
      </div>
    </div>
    <div style="display: flex; width: 50%; margin: 150px auto; background-color: white;
      box-shadow: 0 0 10px -2px rgba(30, 144, 255,.5); overflow: hidden; border-radius: 10px">
      <div style="padding:30px">
        <img src="../assets/img_2.png" alt="" style="width: 100%; margin-top: 50px">
      </div>
      <div>
        <div style="width: 400px; background-color: white; padding: 30px 40px;">
          <el-form
              ref="ruleFormRef"
              :model="loginData"
              :rules="rules"
              size="large"
              status-icon
          >
            <div style="text-align: center; color: dodgerblue; font-size: 30px; font-weight: bold; margin-bottom: 30px">
              Login
            </div>
            <el-form-item prop="username">
              <el-input v-model="loginData.username" placeholder="username" :prefix-icon="User"/>
            </el-form-item>
            <el-form-item prop="password">
              <el-input v-model="loginData.password" show-password placeholder="password" :prefix-icon="Lock"/>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" style="width: 100%" @click="login">Login</el-button>
            </el-form-item>
          </el-form>
          <div style="text-align: right"><a style="text-decoration: none; color: dodgerblue"
                                            href="/register">Don't have a account? register</a></div>
        </div>
      </div>
    </div>

  </div>
</template>
