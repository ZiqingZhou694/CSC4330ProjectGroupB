<script setup>
import { nextTick, reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";


const name = ref('')
const subject = ref('')
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)



const userStore = useUserStore()
let user = userStore.getUser
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const state = reactive({
  tableData: [],
  form: {},
  rating: {},
  comments: []
})
state.form = Object.assign({}, user)
const valueHtml = ref('')


state.userOptions = []
request.get('/user').then(res => state.userOptions = res.data)


const multipleSelection = ref([])


const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

const confirmDelBatch = () => {
  if (!multipleSelection.value || !multipleSelection.value.length) {
    ElMessage.warning("choose a data")
    return
  }
  const idArr = multipleSelection.value.map(v => v.id)
  request.post('/availability/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  const Search = `${name.value}|||${subject.value}`;
  request.get('/availability/page', {
    params: {
      name: name.value,
      subject: subject.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
  })
}
load()

const reset = () => {
  name.value = ''
  subject.value = ''
  load()
}

const dialogFormVisible = ref(false)
const Hidden = ref(false)

const rules = reactive({

  date: [
    { required: true, message: 'please enter a date', trigger: 'blur' },
  ],
  startTime: [
    { required: true, message: 'please enter a starting time', trigger: 'blur' },
  ],
  endTime: [
    { required: true, message: 'please enter a end time', trigger: 'blur' },
  ],
  subject: [
    { required: true, message: 'please enter subject', trigger: 'blur' },
  ],
  nums: [
    { required: true, message: 'please enter total schedule number', trigger: 'blur' },
  ],

})

const ruleFormRef = ref()


const handleAdd = () => {
  dialogFormVisible.value = true
  if(user.role ==="ADMIN"){
    Hidden.value = true
  }else{
    Hidden.value = false
  }
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = {}
    valueHtml.value = ''
  })
}


const save = () => {
  ruleFormRef.value.validate(valid => {
    if (valid) {
      state.form.content = valueHtml.value
      request.request({
        url: '/availability',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('Save Success')
          dialogFormVisible.value = false
          load()
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}


const handleEdit = (raw) => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = JSON.parse(JSON.stringify(raw))
    valueHtml.value = raw.content
  })
}


const del = (id) => {
  request.delete('/availability/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}
// format Time
const formatTime = (time) => {
  const [hour, minute] = time.split(':');
  const hour24 = parseInt(hour, 10);
  const hour12 = hour24 % 12 || 12;
  const period = hour24 < 12 ? 'AM' : 'PM';
  return `${hour12.toString().padStart(2, '0')}:${minute} ${period}`;
}

const handleScheduleSave = (row) =>{
  // scheduleDialogVisible.value = false
  request.post('/appointment', {availabilityId: row.id}).then(res => {
    if(res.code === '200'){
      ElMessage.success('success')
      load()
    }else{
      ElMessage.error((res.msg))
    }
  })
}

// view
const viewDialogVisible = ref(false)
const handleView = (row) =>{
  viewDialogVisible.value = true
  nextTick(() => {
    state.form = JSON.parse(JSON.stringify(row))
    valueHtml.value = row.content
    load()
    loadRating(row.tutorId)
    state.userOptions = []
    request.get('/user').then(res => state.userOptions = res.data)
  })
}
//comment dialog
const commentDialogVisible =ref(false)
const handleComment = (row) =>{
  commentDialogVisible .value = true
}

//rating
const colors = ['#99A9BF', '#F7BA2A', '#FF9900']
const loadRating = async (foreignId) => {
  try {
    const res = await request.get('/comment?foreignId=' + foreignId)
    state.rating.rate = res.rate
    state.comments = res.comments
  } catch (error) {
    ElMessage.error('Failed to load rating data')
  }
}

// show weeks
const getDayOfWeek = (dateString) => {
  const date = new Date(dateString);
  const days = ['Monday',  'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday'];
  return days[date.getDay()];
};


</script>

<template>
  <div>
    <div>
      <el-input v-model="subject" placeholder="Subject" class="w300" />
      <el-input v-model="name" placeholder="Tutor" class="w300" />
      <el-button type="primary" class="ml5" @click="load">
        <el-icon style="vertical-align: middle">
          <Search />
        </el-icon>  <span style="vertical-align: middle"> Search </span>
      </el-button>
      <el-button type="warning" class="ml5" @click="reset">
        <el-icon style="vertical-align: middle">
          <RefreshLeft />
        </el-icon>  <span style="vertical-align: middle"> reset </span>
      </el-button>

    </div>

    <div style="margin: 10px 0">
      <el-button type="success" @click="handleAdd" v-if="auths.includes('availability.add')">
        <el-icon style="vertical-align: middle">
          <Plus />
        </el-icon>  <span style="vertical-align: middle"> Add </span>
      </el-button>

    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id" v-if="user.role ==='ADMIN'"></el-table-column>
        <el-table-column label="date">
          <template #default="scope">
            {{ scope.row.date }}
            {{ getDayOfWeek(scope.row.date) }}
          </template>
        </el-table-column>
        <el-table-column width="150" prop="name" label="tutor name"></el-table-column>
        <el-table-column prop="subject" label="subject"></el-table-column>
        <el-table-column prop="startTime" label="start time">
          <template #default="scope">
            {{ formatTime(scope.row.startTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="endTime" label="end time">
          <template #default="scope">
            {{ formatTime(scope.row.endTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="tutorId" label="Tutor Id" v-if="user.role ==='ADMIN' || (user.role === 'TUTOR')"  ></el-table-column>
      <el-table-column prop="virtualLink" label="link" v-if="user.role ==='ADMIN' || (user.role === 'TUTOR')">
        <template #default="scope">
          <el-tooltip
              class="link-tooltip"
              effect="light"
              :content="scope.row.virtualLink"
              placement="top-start"
          >
            <el-link type="primary" :href="scope.row.virtualLink" >
              {{scope.row.virtualLink}}
            </el-link>
          </el-tooltip>
        </template>
      </el-table-column>

        <el-table-column  width="70" label="nums">
          <template #default = "scope">
            {{scope.row.numsLeft}} / {{scope.row.nums}}
          </template>
        </el-table-column>
        <el-table-column prop="status" label="status" v-if="auths.includes('availability.status')" width="100">
          <template #default = "scope">
            <el-tag v-if="scope.row.status === 'Available'" type="success">Available</el-tag>
            <el-tag v-if="scope.row.status === 'Expired'" type="danger">Expired</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="View Tutor" width="120" v-if="auths.includes('availability.schedule')">
          <template #default="scope">
            <el-button type="primary" @click="handleView(scope.row)" >view</el-button>
          </template>
        </el-table-column>
        <el-table-column label="Appointment" width="120"  v-if="auths.includes('availability.schedule')">
          <template #default="scope">
            <el-button type="primary" @click="handleScheduleSave(scope.row)" >schedule</el-button>
          </template>
        </el-table-column>
        <el-table-column label="action" width="180" v-if="auths.includes('availability.action')">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)" v-if="auths.includes('availability.edit')">edit</el-button>
            <el-popconfirm title="you want to delete this?" @confirm="del(scope.row.id)" v-if="auths.includes('availability.delete')">
              <template #reference>
                <el-button type="danger">delete</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div style="margin: 10px 0">
      <el-pagination
          @current-change="load"
          @size-change="load"
          v-model:current-page="pageNum"
          v-model:page-size="pageSize"
          background
          :page-sizes="10"
          layout="total, prev, pager, next, jumper"
          :total="total"
      />
    </div>

    <el-dialog v-model="dialogFormVisible" title="Availability Info" width="40%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="120px" style="padding: 0 20px" status-icon>
        <el-form-item prop="name" label="Tutor Name" v-show="Hidden">
          <el-input v-model="state.form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="date" label="Date">
          <el-date-picker style="width: 100%" v-model="state.form.date" type="date" value-format="YYYY-MM-DD" placeholder="Choose Datetime"></el-date-picker>
        </el-form-item>
        <el-form-item prop="startTime" label="Start Time">
          <el-time-select style="width: 100%"  start='00:00' step="01:00" end="23:59" format="HH:mm:ss"
                          v-model="state.form.startTime" type="datetime" value-format="YYYY-MM-DD HH:mm" placeholder="Choose Datetime"></el-time-select>
        </el-form-item>
        <el-form-item prop="endTime" label="End Time">
          <el-time-select style="width: 100%" start='00:00' step="01:00" end="23:59" format="HH:mm:ss"
                          v-model="state.form.endTime" type="datetime" value-format="YYYY-MM-DD HH:mm" placeholder="Choose Datetime"></el-time-select>
        </el-form-item>
        <el-form-item prop="subject" label="Subject">
          <el-input v-model="state.form.subject" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="tutorId" label="Tutor ID"  v-show="Hidden" >
          <el-input v-model="state.form.tutorId" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="nums" label="nums">
          <el-input v-model="state.form.nums" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="numsLeft" label="nums left" v-if="state.form.id">
          <el-input v-model="state.form.numsLeft" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="virtualLink" label="Link">
          <el-input v-model="state.form.virtualLink" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>

      <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="save">
          Save
        </el-button>
      </span>
      </template>
    </el-dialog>

    <el-dialog v-model="viewDialogVisible" title="Tutor Info" width="30%">
      <el-form :model="state.form" label-width="120px" style="padding: 0 20px">

        <div style="text-align: center; display: flex; justify-content: center; align-items: center; margin-bottom: 20px">
          <img v-if="state.form.tutorId && (state.userOptions.find(v => v.id === state.form.tutorId) || {}).avatar" :src="(state.userOptions.find(v => v.id === state.form.tutorId) || {}).avatar" class="avatar" />

        </div>
        <el-form-item label="Tutor Name">
          <el-input v-model="state.form.name" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="Subject">
          <el-input v-model="state.form.subject" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="Email">
          <el-input v-if="state.form.tutorId && (state.userOptions.find(v => v.id === state.form.tutorId) || {}).email" v-model="state.userOptions.find(v => v.id === state.form.tutorId).email" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="About">
          <el-input type="textarea" v-if="state.form.tutorId && (state.userOptions.find(v => v.id === state.form.tutorId) || {}).content" v-model="state.userOptions.find(v => v.id === state.form.tutorId).content" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="Rating">
          <el-rate
              v-model="state.rating.rate"
              :colors="colors"
              disabled
              show-score
              text-color = "#FF9900"
              score-template="{value}">
          </el-rate>
          <el-button type="primary" style="margin-left: 20px;" @click="handleComment">Comment</el-button>
        </el-form-item>

      </el-form>
    </el-dialog>

    <el-dialog v-model="commentDialogVisible" width="800px">
      <div style="margin: 10px 0; font-size: 24px; padding: 10px 0; border-bottom: 1px solid #ccc;">Comment</div>
      <div style="margin: 20px 0; text-align: left;  max-height: 400px; overflow-y: auto;">
        <div style="padding: 10px 0; display: flex;" v-for=" item in state.comments" :key="item.id">
          <div style="width: 60px"><el-avatar :size="50" :src="(state.userOptions.find(v => v.id === item.userId) || {}).avatar"></el-avatar></div>
          <div style="flex: 1">
            <div style="font-weight: bold;">
              {{ item.username }}
              <el-rate
                  v-model="item.rate"
                  :colors="colors"
                  disabled>
              </el-rate></div>
            <div style="margin-top: 5px; color: #666">{{ item.content }}</div>
          </div>
        </div>
      </div>
    </el-dialog>



  </div>
</template>
<style>
.avatar {
  width: 120px;
  height: 120px;
  display: block;
  border: 1px dashed #ccc;
  border-radius: 50%;
  cursor: pointer;
  position: relative;
}

 .el-link {
   display: inline-block;
   max-width: 200px;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
 }


</style>