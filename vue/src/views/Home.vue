<script setup>
import {onMounted, reactive, ref,watchEffect, computed} from "vue";
import request from "@/utils/request";
import {useUserStore} from "@/stores/user";
import * as echarts from "echarts";


const subject = ref('')
const name = ref('')
const pageNum = ref(1)
const pageSize = ref(30)
const total = ref(0)

const userStore = useUserStore()
const user = userStore.getUser
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const state = reactive({
  showMessage: false,
  messageText: '',
  arr: [],
  tableDate: [],
  adminCount: 0,
  tutorCount: 0,
  studentCount: 0
})

const load = () => {
  request.get('/appointment/page', {
    params: {
      name: name.value,
      subject: subject.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.arr = res.data.records.map(record => ({
      date: record.availability.date,
      ADate: record.time,
      subject: record.subject,
      status: record.status,
      time: record.availability.startTime
    }))
    total.value = res.data.total
    drawPieChart();
  })
}
load()
const loadUser = () => {
  request.get('/user').then(res => {
    state.tableData = res.data;
    total.value = res.data.total;
    state.adminCount = res.data.filter(item => item.role === "ADMIN").length;
    state.tutorCount = res.data.filter(item => item.role === "TUTOR").length;
    state.studentCount = res.data.filter(item => item.role === "STUDENT").length;
    console.log('Admin:', state.adminCount);
    console.log('Tutor:', state.tutorCount);
    console.log('Student:', state.studentCount);
    drawPieChart();
  });
}
loadUser()


const uniqueSubjectsByTime = (arr, date) => {
  const acceptedAppointments = arr.filter(v => v.date === date && v.status === 'Accepted');
  const uniqueAppointments = [];

  acceptedAppointments.forEach(appointment => {
    if (!uniqueAppointments.some(uniqueAppt => uniqueAppt.time === appointment.time)) {
      uniqueAppointments.push(appointment);
    }
  });

  return uniqueAppointments;
};

const formatTime = (time) => {
  const [hour, minute] = time.split(':');
  const hour24 = parseInt(hour, 10);
  const hour12 = hour24 % 12 || 12;
  const period = hour24 < 12 ? 'AM' : 'PM';
  return `${hour12.toString().padStart(2, '0')}:${minute} ${period}`;
}

// Tag Type in diff days
const getTagType = (appointmentDateString) => {
  const today = new Date();
  const [year, month, day] = appointmentDateString.split('-');
  const appointmentDate = new Date(`${month}/${day}/${year}`);
  // console.log(appointmentDate); // output: Tue Apr 18 2023 00:00:00 GMT-0500 (Central Daylight Time)

  if (appointmentDate.toDateString() === today.toDateString()) {
    return 'warning';
  } else if (appointmentDate < today) {
    return 'danger';
  } else {
    return 'success';
  }
}

watchEffect(() => {
  const todayDate = new Date();
  const today = `${todayDate.getFullYear()}-${(todayDate.getMonth() + 1).toString().padStart(2, '0')}-${todayDate.getDate().toString().padStart(2, '0')}`;
  state.pendingCount = state.arr.filter(item => item.status === 'Pending').length;
  state.acceptedCount = state.arr.filter(item => {
    const itemDate = new Date(item.ADate);
    const itemDateString = `${itemDate.getFullYear()}-${(itemDate.getMonth() + 1).toString().padStart(2, '0')}-${itemDate.getDate().toString().padStart(2, '0')}`;
    return item.status === 'Accepted' && itemDateString === today;
  }).length;
  state.TodayAppointmentCount = state.arr.filter(item => {
    return item.status === 'Accepted' && item.date === today;
  }).length;
  state.declinedCount = state.arr.filter(item => {
    const itemDate = new Date(item.ADate);
    const itemDateString = `${itemDate.getFullYear()}-${(itemDate.getMonth() + 1).toString().padStart(2, '0')}-${itemDate.getDate().toString().padStart(2, '0')}`;
    return item.status === 'Declined' && itemDateString === today;
  }).length;
})

const TotalAdmin = computed(() =>
    state.tableData.filter(item => item.role === "ADMIN").length
)
const TotalTutor = computed(() =>
    state.tableData.filter(item => item.role === "TUTOR").length
)
const TotalStudent = computed(() =>
    state.tableData.filter(item => item.role === "STUDENT").length
)

function drawPieChart() {
  let pieOption = {
    title: {
      text: "User proportion chart",
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
          { value: state.studentCount, name: 'Student' },
          { value: state.tutorCount, name: 'Tutor' },
          { value: state.adminCount, name: 'Admin' }
        ]
      }
    ]
  }
  let pieChart = echarts.init(document.getElementById("pie"))
  // 绘制图表
  pieChart.setOption(pieOption)
}

const greetingTextByTime = () => {
  const currentHour = new Date().getHours();
  if (currentHour >= 5 && currentHour < 12) {
    return "Good morning";
  } else if (currentHour >= 12 && currentHour < 18) {
    return "Good afternoon";
  } else {
    return "Good evening";
  }
};

let sentenceIndex = Math.floor(Math.random() * 4);
const sentences = [
  "Welcome to the appointment system!",
  "Have a great day!",
  "Don't forget to check your appointments!",
  "Stay organized and plan your day!",
];
const randomSentences = () => {
  return sentences[sentenceIndex];
};
setInterval(() => {
  sentenceIndex = (sentenceIndex + 1) % 4;
}, 5 * 60 * 1000);


</script>

<template>
  <div>
    <el-row :gutter="10">
      <el-col :span="16">
        <el-card shadow="hover">
          <template #header>
            <div style="display: flex">
              <div style="width: auto; height: 32px; overflow: hidden; padding: 4px;margin-right: 5px;">
                <div class="greeting" style=" margin-left: 10px; margin-right: 10px">{{ greetingTextByTime() }}  :</div>
              </div>
              <div style="width: 80%; height: 32px; overflow: hidden; border: 1px solid #ccc; border-radius: 4px; padding: 4px;">
                <div class="scrolling-text">{{ randomSentences() }}</div>
              </div>

            </div>
          </template>
          <div>
            <el-calendar>
              <template #dateCell="{ date, data }">
                <div :class="data.isSelected ? 'is-selected' : ''">
                  <div>{{ data.day.split('-')[2] }} </div>
                  <div v-if="uniqueSubjectsByTime(state.arr, data.day).length > 0">
                    <div v-for="item in uniqueSubjectsByTime(state.arr, data.day)" :key="item.subject">
                      <el-tag :type="getTagType(item.date)">{{ item.subject }} {{ formatTime(item.time) }}</el-tag>

                    </div>
                  </div>

                </div>
              </template>
            </el-calendar>
          </div>
        </el-card>
      </el-col>

      <el-col :span="8">
        <el-card shadow="hover">
          <template #header>
            <div>
              <span style="font-weight: bold; font-size: large">Message</span>
              <el-divider></el-divider>
              <div v-if="user.role ==='TUTOR'">
                <template v-if="state.pendingCount > 0 || state.acceptedCount > 0 || state.TodayAppointmentCount > 0">
                  <template v-if="state.pendingCount > 0">
                    <el-alert type="warning" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 220px;">You have ({{ state.pendingCount }}) pending appointment(s)!</span>
                    </el-alert>
                  </template>
                  <template v-if="state.acceptedCount > 0">
                    <el-alert type="success" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">You accepted ({{ state.acceptedCount }}) appointment(s)!</span>
                    </el-alert>
                  </template>
                  <template v-if="state.acceptedCount > 0">
                    <el-alert type="info" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">You have ({{ state.TodayAppointmentCount }}) appointment(s) Today!</span>
                    </el-alert>
                  </template>
                </template>
                <template v-else>
                  <div style="display: flex; justify-content: center; align-items: center; color: #bbb;">No Message</div>
                </template>
              </div>
              <div v-if="user.role ==='ADMIN'">
                <!-- Same as above -->
                <template v-if="state.pendingCount > 0 || state.acceptedCount > 0 || state.TodayAppointmentCount > 0 ||state.declinedCount > 0">
                  <template v-if="state.pendingCount > 0">
                    <el-alert type="warning" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 220px;">There are ({{ state.pendingCount }}) pending appointment(s)!</span>
                    </el-alert>
                  </template>
                  <template v-if="state.acceptedCount > 0">
                    <el-alert type="success" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">There are ({{ state.acceptedCount }}) appointment(s) been accepted Today!</span>
                    </el-alert>
                  </template>
                  <template v-if="state.acceptedCount > 0">
                    <el-alert type="info" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">There are ({{ state.TodayAppointmentCount }}) appointment(s) Today!</span>
                    </el-alert>
                  </template>
                  <template v-if="state.declinedCount > 0">
                    <el-alert type="error" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">There are ({{ state.declinedCount }}) appointment(s) been Declined Today!</span>
                    </el-alert>
                  </template>
                </template>
                <template v-else>
                  <div style="display: flex; justify-content: center; align-items: center; color: #bbb;">No Message</div>
                </template>
              </div>

              <div v-if="user.role ==='STUDENT'">
                <template v-if="state.pendingCount > 0 || state.acceptedCount > 0 || state.TodayAppointmentCount > 0 ||state.declinedCount > 0">
                  <template v-if="state.acceptedCount > 0">
                    <el-alert type="success" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">Your appointment(s) been accepted!</span>
                    </el-alert>
                  </template>
                  <template v-if="state.declinedCount > 0">
                    <el-alert type="error" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">You have ({{ state.declinedCount }}) appointment(s) been Declined!</span>
                    </el-alert>
                  </template>
                  <template v-if="state.acceptedCount > 0 && state.TodayAppointmentCount !==0">
                    <el-alert type="info" show-icon :closable="true" style="display: flex; align-items: center;">
                      <span style="margin-right: 200px;">You have ({{ state.TodayAppointmentCount }}) appointment(s) Today!</span>
                    </el-alert>
                  </template>
                </template>
                <template v-else>
                  <div style="display: flex; justify-content: center; align-items: center; color: #bbb;">No Message</div>
                </template>
              </div>


            </div>
          </template>
          <div style="display: flex">
            <div style="width:100%; height: 500px;display: flex " id="pie"></div>
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
.greeting{
  font-family: "Helvetica Neue",Helvetica,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif;font-weight:bold;
  font-size: large;
  color: #FFB900;
}
.scrolling-text {
  display: inline-block;
  overflow: hidden;
  white-space: nowrap;
  animation: scrolling 20s linear infinite;
  align-items: flex-start;
  width: 100%;
  color: rebeccapurple;
}

@keyframes scrolling {
  0% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(100%);
  }
}
</style>