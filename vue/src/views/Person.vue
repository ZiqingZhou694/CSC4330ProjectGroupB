<script setup>
import {reactive, defineEmits, ref} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";

const userStore = useUserStore()
const user = userStore.getUser
const token = userStore.getBearerToken

const Hidden = ref(true)
const state = reactive({
  form: {}
})
state.form = Object.assign({}, user)
const handleImportSuccess = (res) => {
  state.form.avatar = res.data
  ElMessage.success("avatar upload success")
}

let $myEmit = defineEmits(['getAvatar'])
const save = () => {
  // if(user.role ==="TUTOR"){
  //   Hidden.value = true
  // }else{
  //   Hidden.value = false
  // }
  request.put("/updateUser", state.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('update success')
      userStore.setUser(res.data)
      $myEmit('getAvatar', res.data.avatar)
    } else {
      ElMessage.error(res.msg)
    }

  })
}
</script>

<template>
  <div>
    <el-card style="width: 40%; margin: 10px auto">
      <el-form style="width: 80%; margin: 0 auto" label-width="60px">
        <div style="text-align: center">
          <el-upload
              class="avatar-uploader"
              :show-file-list="false"
              :action='`http://${config.serverUrl}/file/upload`'
              :on-success="handleImportSuccess"
              :headers="{ Authorization: token}"
          >
            <img v-if="state.form.avatar" :src="state.form.avatar" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
          </el-upload>
        </div>

        <el-form-item label="Username" style="margin-top: 20px" label-width="formLabelWidth">
          <el-input v-model="state.form.username" disabled></el-input>
        </el-form-item>
        <el-form-item label="First Name" label-width="formLabelWidth">
          <el-input v-model="state.form.firstName"></el-input>
        </el-form-item>
        <el-form-item label="Last Name" label-width="formLabelWidth">
          <el-input v-model="state.form.lastName"></el-input>
        </el-form-item>
        <el-form-item label="Email" label-width="formLabelWidth">
          <el-input v-model="state.form.email"></el-input>
        </el-form-item>
        <el-form-item label="Address" label-width="formLabelWidth">
          <el-input v-model="state.form.address"></el-input>
        </el-form-item>
        <el-form-item label="Content" label-width="formLabelWidth" v-show="user.role !== 'STUDENT'">
          <el-input type="textarea" v-model="state.form.content"  style=" height:120px ;"></el-input>
        </el-form-item>
      </el-form>
      <div style="text-align: center; width: 100%">
        <el-button type="primary" @click="save">Save</el-button>
      </div>
    </el-card>
  </div>
</template>

<style>
.avatar-uploader .avatar {
  width: 120px;
  height: 120px;
  display: block;
}
.avatar-uploader .el-upload {
  border: 1px dashed #ccc;
  border-radius: 50%;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #ccc;
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 120px;
  height: 120px;
  text-align: center;
}
</style>

