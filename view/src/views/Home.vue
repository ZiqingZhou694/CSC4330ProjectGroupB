<script setup>
import {reactive} from "vue";
import request from "@/utils/request";

// const state = reactive({
//   notice: []
// })

// const load = () => {
//   request.get("/notice").then(res => {
//     state.notice = res.data
//   })
// }
// load()
</script>

<template>
  <div>
    <el-row :gutter="10">
      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div>
              <span> Don't know what to put yet maybe a calendar?
              </span>
            </div>
          </template>
          <div>
            calendar?
          </div>
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div>
              <span>message tag? </span>
            </div>
          </template>
          <div style="display: flex">
          message? remainder? or etc.?
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-divider />

  </div>
</template>
