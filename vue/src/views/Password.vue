<script setup>
import {reactive, ref} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";

const userStore = useUserStore()
const user = userStore.getUser

const state = reactive({
  form: {}
})
state.form.uid = user.uid
const save = () => {
  if (state.form.newPassword !== state.form.confirmPassword) {
    ElMessage.warning('Two passwords did not match. Try again.')
    return
  }
  if (state.form.newPassword === state.form.password) {
    ElMessage.warning('The new password cannot be the same as the old one')
    return
  }
  request.post("/password/change", state.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('Change successfully')
      userStore.logout()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const rules = reactive({
  password: [
    { required: true, message: 'Please enter your current password', trigger: 'blur' },
  ],
  newPassword: [
    { required: true, message: 'Please enter your new password', trigger: 'blur' },
  ],
  confirmPassword: [
    { required: true, message: 'Please confirm your new password', trigger: 'blur' },
  ],
})
const ruleFormRef = ref()
</script>

<template>
  <div>
    <el-card style="width: 40%; margin: 10px auto">
      <el-form style="width: 80%; margin: 0 auto" label-width="180px" :model="state.form" :rules="rules" ref="ruleFormRef">
        <el-form-item label="Current Password" prop="password">
          <el-input show-password v-model="state.form.password"></el-input>
        </el-form-item>
        <el-form-item label="New Password" prop="newPassword">
          <el-input show-password v-model="state.form.newPassword"></el-input>
        </el-form-item>
        <el-form-item label="Confirm New Password" prop="confirmPassword">
          <el-input show-password v-model="state.form.confirmPassword"></el-input>
        </el-form-item>
      </el-form>
      <div style="text-align: center; width: 100%">
        <el-button type="primary" @click="save">Save</el-button>
      </div>
    </el-card>
  </div>
</template>



