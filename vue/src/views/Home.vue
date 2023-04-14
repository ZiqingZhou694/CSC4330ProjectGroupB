<script setup>
import {reactive} from "vue";
import request from "@/utils/request";


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
            <el-calendar>
              <template #dateCell="{ date, data }">
                <p :class="data.isSelected ? 'is-selected' : ''">
                  {{ data.day.split('-')[2] }}
                  {{ data.isSelected ? '✔️' : '' }}
                </p>
              </template>
            </el-calendar>
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

<style>

.is-selected {
  color: #1989FA;
}
</style>