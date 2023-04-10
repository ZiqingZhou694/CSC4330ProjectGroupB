<script setup>
import { reactive, ref} from "vue"
import { User, Lock, Message } from '@element-plus/icons-vue'
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import router from "@/router";

  const RegisterData = reactive({})
  const checkpw = (rule, value,callback) =>{
    if (RegisterData.password !== RegisterData.confirmPassword) {
      callback(new Error("password don't match"));
    }else{
      callback();
    }
  }
  const rules = reactive({
    username: [
      { required: true, message: 'please enter your username', trigger: 'blur' },
    ],
    firstName: [
      { required: true, message: 'please enter your first name', trigger: 'blur' },
    ],
    lastName: [
      { required: true, message: 'please enter your last name', trigger: 'blur' },
    ],
    email: [
      { required: true, message: 'please enter your email', trigger: 'blur' },
      { pattern:/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[edu])+/, message: 'please enter your university email', trigger: 'blur' },
    ],
    password: [
      { required: true, message: 'please enter your password', trigger: 'blur' },
      { min: 3, max: 20, message: 'password length must between 3-20', trigger: 'blur' },
    ],
    confirmPassword: [
      { required: true, message: 'please confirm your password', trigger: 'blur' },
      { min: 3, max: 20, message: 'password length must between 3-20', trigger: 'blur' },
      { validator: checkpw, trigger: 'blur'}
    ],
  })

  const ruleFormRef = ref()
  const login = () => {
    ruleFormRef.value.validate(valid => {
      if (valid) {
          // Send form data to the backend
          request.post('/register', RegisterData).then(res => {
            if (res.code === '200') {
              ElMessage.success('register successfully')
              router.push('/login')
            } else {
              ElMessage.error(res.msg)
            }
          })

      }
    })
  }

</script>

<template>
  <div style="height: 100vh; overflow: hidden; background-color: aliceblue">
    <div style="width: 100%; background-color: rgba(65, 105, 225,.1);padding: 15px 30px; color: dodgerblue; font-size: 20px; position: absolute">Tutoring Center</div>
    <div style="display: flex; width: 50%; margin: 120px auto; background-color: white;
      box-shadow: 0 0 10px -2px rgba(65, 105, 225,.5); overflow: hidden; border-radius: 10px">
      <div style="padding:30px">
        <img src="../assets/bg1.png" alt="" style="width: 100%; margin-top: 100px">
      </div>
      <div>
        <div style="width: 400px; background-color: white; padding: 30px 40px;">
          <el-form
              ref="ruleFormRef"
              :model="RegisterData"
              :rules="rules"
              size="large"
              status-icon
          >
            <div style="text-align: center; color: dodgerblue; font-size: 30px; font-weight: bold; margin-bottom: 30px">Register</div>
            <el-form-item prop="username">
              <el-input v-model="RegisterData.username" placeholder="username"  :prefix-icon="User" />
            </el-form-item>
            <el-form-item prop="firstName">
              <el-input v-model="RegisterData.firstName" placeholder="firstName"  :prefix-icon="User" />
            </el-form-item>
            <el-form-item prop="lastName">
              <el-input v-model="RegisterData.lastName" placeholder="lastName"  :prefix-icon="User" />
            </el-form-item>
            <el-form-item prop="email">
              <el-input v-model="RegisterData.email" placeholder="email"  :prefix-icon="Message" />
            </el-form-item>
            <el-form-item prop="password">
              <el-input v-model="RegisterData.password" show-password placeholder="password" :prefix-icon="Lock" />
            </el-form-item>
            <el-form-item prop="confirmPassword">
              <el-input v-model="RegisterData.confirmPassword" show-password placeholder="confirm password" :prefix-icon="Lock" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" style="width: 100%" @click="login">register</el-button>
            </el-form-item>
            <div style="text-align: right"><a style="text-decoration: none; color: dodgerblue" href="/login">already have a account？Login</a></div>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>
