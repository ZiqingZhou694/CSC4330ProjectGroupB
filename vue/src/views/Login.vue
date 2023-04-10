<script setup>
import {onMounted, reactive, ref} from "vue"
import {User, Lock} from '@element-plus/icons-vue'
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";
import router, {setRoutes} from "@/router";
// import SIdentify from '../components/Sidentify.vue';

// Captcha
// let identifyCodes = "1234567890"
// let identifyCode = ref('')
// const failCount = ref(0)
// const randomNum = (min, max) => {
//   return Math.floor(Math.random() * (max - min) + min)
// }
// const makeCode = (o, l) => {
//   for (let i = 0; i < l; i++) {
//     identifyCode.value += o[randomNum(0, o.length)];
//   }
// }
// const refreshCode = () => {
//   identifyCode.value = "";
//   makeCode(identifyCodes, 4);
// }
// // Generate verification code
// onMounted(() => {
//   identifyCode.value = "";
//   makeCode(identifyCodes, 4);
// })

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
    // if (valid) {
    //   // fail three time to trigger verification code
    //   if (failCount.value >= 3 && loginData.code !== identifyCode.value) {
    //     ElMessage.warning('incorrect verification code')
    //     return
    //   }
      // send chart to the back
      request.post('/login', loginData).then(res => {
        if (res.code === '200') {
          ElMessage.success('login success')
          const userStore = useUserStore()
          userStore.setManagerInfo(res.data)
          router.push('/')
        } else {
          ElMessage.error(res.msg)
          failCount.value ++  // fail count + 1
        }
      })
    // }
  })
}

</script>

<template>
  <div style="height: 100vh; overflow: hidden; background-color: aliceblue">
    <div style="width: 100%; background-color: rgba(65, 105, 225,.1);padding: 15px 30px; color: dodgerblue; font-size: 20px; position: absolute">Tutoring Center</div>
    <div style="display: flex; width: 50%; margin: 150px auto; background-color: white;
      box-shadow: 0 0 10px -2px rgba(30, 144, 255,.5); overflow: hidden; border-radius: 10px">
      <div style="padding:30px">
        <img src="../assets/bg2.png" alt="" style="width: 100%; margin-top: 50px">
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
<!--            <div style="display: flex; margin: 15px 0" v-if="failCount >= 3">-->
<!--              <div style="flex: 1">-->
<!--                <el-input v-model="loginData.code" placeholder="验证码"></el-input>-->
<!--              </div>-->
<!--              <div>-->
<!--                <div @click="refreshCode" style="margin-left: 5px">-->
<!--                  <SIdentify :identifyCode="identifyCode" />-->
<!--                </div>-->
<!--              </div>-->
<!--            </div>-->
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
