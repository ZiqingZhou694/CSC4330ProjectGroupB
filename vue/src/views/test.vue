<template>
  <div class="time-picker">
    <el-button @click="showDialog">选择时间</el-button>
    <el-dialog v-model="dialogVisible" title="选择时间" width="30%" >
      <div>
        <el-button
            v-for="time in timeSlots"
            :key="time"
            :disabled="isDisabled(time)"
            @click="selectTime(time)"
            class="el-button"
        >
          {{ time }}
        </el-button>
      </div>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="confirm">确定</el-button>
      </span>
      </template>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialogVisible: false,
      showModal: false,
      timeSlots: [],
      selectedTimes: [],
      startTime: "09:00",
      endTime: "17:00",
    };
  },
  mounted() {
    this.generateTimeSlots(this.startTime, this.endTime);
  },
  methods: {
    showDialog() {
      this.dialogVisible = true;
    },
    closeDialog() {
      this.dialogVisible = false;
    },
    cancel() {
      this.showModal = false;
      this.selectedTimes = [];
    },
    confirm() {
      this.showModal = false;
    },
    generateTimeSlots(start, end) {
      let startTime = new Date(`1970-01-01T${start}:00`);
      let endTime = new Date(`1970-01-01T${end}:00`);

      while (startTime < endTime) {
        this.timeSlots.push(this.formatTime(startTime));
        startTime.setMinutes(startTime.getMinutes() + 60);
      }
    },
    formatTime(date) {
      let hours = date.getHours();
      let minutes = date.getMinutes();
      return `${hours.toString().padStart(2, "0")}:${minutes
          .toString()
          .padStart(2, "0")}`;
    },
    selectTime(time) {
      if (this.selectedTimes.length < 1) {
        this.selectedTimes.push(time);
      } else {
        this.selectedTimes[0] = time;
      }
    },
    isDisabled(time) {
      return this.selectedTimes.includes(time);
    },
  },
};
</script>

<style>

.el-button {
  margin-bottom: 20px;
}

</style>
