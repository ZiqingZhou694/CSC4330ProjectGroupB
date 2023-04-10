<script setup>
import * as echarts from 'echarts'
import {onMounted} from "vue";

onMounted(() => {
  let option = {
    title: {
      text: "",
    },
    legend: {
      top: '5%',
      left: 'center'
    },
    xAxis: {
      type: 'category',
      data: ['1-1', '1-2', '1-3', '1-4', '1-5', '1-6', '1-7']
    },
    yAxis: {
      type: 'value'
    },
    grid: {
      top: '20%',
      height: '60%'
    },
    series: [
      {
        name: 'Starbuck',
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        type: 'line',
        smooth: true
      },
      {
        name: 'Luckin Coffee',
        data: [1002, 666, 555, 992, 490, 733, 1000],
        type: 'line',
        smooth: true
      }
    ]
  }
  let pieOption = {
    title: {
      text: "",
    },
    tooltip: {
      trigger: 'item'
    },
    legend: {
      top: '10%',
      left: 'center'
    },
    series: [
      {
        type: 'pie',
        radius: ['40%', '60%'],
        center: ['50%', '55%'],
        avoidLabelOverlap: false,
        label: {
          show: true,
        },
        data: [
          { value: 1048, name: 'Starbuck' },
          { value: 735, name: 'Luckin Coffee' },
          { value: 580, name: 'Come Wonka' },
          { value: 484, name: 'MXBC' },
          { value: 300, name: 'ChaBaiDao' }
        ]
      }
    ]
  }
  let myChart = echarts.init(document.getElementById("main"))
  let pieChart = echarts.init(document.getElementById("pie"))
  // Draw chart
  myChart.setOption(option)
  pieChart.setOption(pieOption)
})
</script>

<template>
  <div>
    <div>
      <el-row :gutter="10">
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">user amount</div>
            <div style="font-size: 24px; font-weight: bold">100</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">item amount</div>
            <div style="font-size: 24px; font-weight: bold">666666</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">order amount</div>
            <div style="font-size: 24px; font-weight: bold">9999</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">shop amount</div>
            <div style="font-size: 24px; font-weight: bold">888</div>
          </el-card>
        </el-col>
      </el-row>
    </div>

    <div style="margin: 20px 0">
      <el-row :gutter="10">
        <el-col :span="12">
          <div style="width:100%; height: 500px" id="main"></div>
        </el-col>

        <el-col :span="12">
          <div style="width:100%; height: 500px" id="pie"></div>
        </el-col>
      </el-row>
    </div>


  </div>
</template>
