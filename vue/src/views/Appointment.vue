<script setup>
import { nextTick, reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";


const subject = ref('')
const name = ref('')
const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)

const userStore = useUserStore()
const user = userStore.getUser
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const state = reactive({
  tableData: [],
  form: {},
  rating: {
    rate: 0,
    content:'',
    userId: user.id,
    username: user.username,
  },
  rate:[]
})

const valueHtml = ref('')

state.availabilityOptions = []
request.get('/availability').then(res => state.availabilityOptions = res.data)
state.userOptions = []
request.get('/user').then(res => state.userOptions = res.data)


const multipleSelection = ref([])


const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

const confirmDelBatch = () => {
  if (!multipleSelection.value || !multipleSelection.value.length) {
    ElMessage.warning("choose data")
    return
  }
  const idArr = multipleSelection.value.map(v => v.id)
  request.post('/appointment/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  request.get('/appointment/page', {
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
  subject.value = ''
  name.value = ''
  load()
}

const dialogFormVisible = ref(false)

const rules = reactive({
  name: [
    { required: true, message: 'enter name', trigger: 'blur' },
  ]
})
const ruleFormRef = ref()

const handleAdd = () => {
  dialogFormVisible.value = true
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
        url: '/appointment',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('save success')
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
  request.delete('/appointment/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('Cancel Success')
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const changeStatus = (row, status) =>{
  const formData = {...row}
  formData.status = status
  request.request({
    url: '/appointment',
    method: 'put',
    data: formData
  }).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}
//rating
const colors = ['#99A9BF', '#F7BA2A', '#FF9900']
const RateDialogVisible = ref(false)

//load rating
const loadRating = async (foreignId) => {
  try {
    const res = await request.get('/comment?foreignId=' + foreignId)
    state.rating.rate = res.rate
  } catch (error) {
    ElMessage.error('Failed to load rating data')
  }
}
const handleRating = (row) =>{
  RateDialogVisible.value = true
  state.rating.foreignId = row.tutorId
  loadRating(row.tutorId)
}
const handleRatingSubmit = () =>{

  RateDialogVisible.value = false
  request.request({
    url: '/comment',
    method:'post',
    data: state.rating
  }).then(res => {
    if (res.code === '200') {
      ElMessage.success('submit success')
      dialogFormVisible.value = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}


</script>

<template>
  <div>
    <div v-if="user.role ==='ADMIN' || (user.role === 'TUTOR')">
      <el-input v-model="subject" placeholder="enter suject" class="w300" />
      <el-button type="primary" class="ml5" @click="load">
        <el-icon style="vertical-align: middle">
          <Search />
        </el-icon>  <span style="vertical-align: middle"> search </span>
      </el-button>
      <el-button type="warning" class="ml5" @click="reset" >
        <el-icon style="vertical-align: middle">
          <RefreshLeft />
        </el-icon>  <span style="vertical-align: middle"> reset </span>
      </el-button>

    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id" ></el-table-column>
        <el-table-column prop="time" label="appointment time"></el-table-column>
      <el-table-column  label="Tutor" v-if="user.role ==='ADMIN'||user.role ==='STUDENT'">
        <template #default="scope">
          {{scope.row.availability.name}}
        </template></el-table-column>
      <el-table-column prop="subject" label="Subject"></el-table-column>
      <el-table-column label="Student " v-if="user.role ==='ADMIN'|| user.role ==='TUTOR'">
        <template #default="scope">
          {{scope.row.user.firstName}} {{scope.row.user.lastName}}
        </template></el-table-column>
        <el-table-column prop="status" label="status" width="100"></el-table-column>
        <el-table-column label="Action" width="120"  v-if="auths.includes('appointment.cancel')" >
          <template #default="scope">
            <el-button type="danger" @click="del(scope.row.id)" v-if="auths.includes('appointment.cancel')" v-show="scope.row.status !== 'Accepted'">Cancel</el-button>
            <el-button type="primary" @click="handleRating(scope.row)" v-show="scope.row.status === 'Accepted'" >Rating</el-button>
          </template>
        </el-table-column>

        <el-table-column label="Action" width="200" v-if="auths.includes('appointment.accept') ||auths.includes('appointment.decline')">
          <template #default="scope">
            <el-button type="primary" @click="changeStatus(scope.row, 'Accepted' )" v-if="auths.includes('appointment.accept')">Accept</el-button>
            <el-button type="danger" @click="changeStatus(scope.row, 'Declined')" v-if="auths.includes('appointment.decline')">Decline</el-button>
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

    <el-dialog v-model="RateDialogVisible" title="Rating" width="30%">
      <div style="margin: 20px 0">
        <el-rate
            v-model="state.rating.rate"
            :colors="colors"
            show-score
            allow-half
            text-color= "#ff9900"
            score-template="{value}">
        </el-rate>
        <div style="margin: 10px 0">
          <el-input type="textarea" v-model="state.rating.content"></el-input>
          <div style="text-align: right; margin: 10px 0">
            <el-button type="primary" @click="handleRatingSubmit">submit</el-button>
          </div>
        </div>
      </div>

    </el-dialog>



  </div>
</template>