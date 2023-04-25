<script setup>
import { nextTick, reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";


const subject = ref('')
const name = ref('')
// const foreignId = ref()
const pageNum = ref(1)
const pageSize = ref(10)
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
    // foreignId: '',
  },
  rate:[]
})

const valueHtml = ref('')  // 富文本内容

state.availabilityOptions = []
request.get('/availability').then(res => state.availabilityOptions = res.data)
state.userOptions = []
request.get('/user').then(res => state.userOptions = res.data)
// userStore.getUser.then(res => state.userOptions = res.data)

const multipleSelection = ref([])

// 批量删除
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
      load()  // 刷新表格数据
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
load()  // 调用 load方法拿到后台数据

const reset = () => {
  subject.value = ''
  name.value = ''
  load()
}

const dialogFormVisible = ref(false)
const showLink = ref(false)

const rules = reactive({
  name: [
    { required: true, message: 'enter name', trigger: 'blur' },
  ]
})
const ruleFormRef = ref()

// 新增
const handleAdd = () => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = {}
    valueHtml.value = ''  // 富文本
  })
}

// 保存
const save = () => {
  ruleFormRef.value.validate(valid => {   // valid就是校验的结果
    if (valid) {
      state.form.content = valueHtml.value  // 富文本保存内容
      request.request({
        url: '/appointment',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('save success')
          dialogFormVisible.value = false
          load()  // 刷新表格数据
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}

// 编辑
const handleEdit = (raw) => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = JSON.parse(JSON.stringify(raw))
    valueHtml.value = raw.content  // 富文本
  })
}

// 删除
const del = (id) => {
  request.delete('/appointment/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('Cancel Success')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const formatTime = (time) => {
  const [hour, minute] = time.split(':');
  const hour24 = parseInt(hour, 10);
  const hour12 = hour24 % 12 || 12;
  const period = hour24 < 12 ? 'AM' : 'PM';
  return `${hour12.toString().padStart(2, '0')}:${minute} ${period}`;
}
// // 导出接口
// const exportData = () => {
//   window.open(`http://${config.serverUrl}/appointment/export`)
// }


// const handleImportSuccess = () => {
//   // 刷新表格
//   load()
//   ElMessage.success("import success")
// }
//
// const handleFileUploadSuccess = (res) => {
//   state.form.file = res.data
//   ElMessage.success('upload success')
// }
// const handleImgUploadSuccess = (res) => {
//   state.form.img = res.data
//   ElMessage.success('image uplaod success')
// }

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
// const value1 = ref(0)
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
// loadRating()
const handleRating = (row) =>{
  RateDialogVisible.value = true
  state.rating.foreignId = row.tutorId
  loadRating(row.tutorId)
  // state.rating.content = valueHtml.value  // 富文本保存内容
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
<!--      what kind key word for search not decide yet-->
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

<!--    <div style="margin: 10px 0">-->
<!--      <el-button type="success" @click="handleAdd" v-if="auths.includes('appointment.add')">-->
<!--        <el-icon style="vertical-align: middle">-->
<!--          <Plus />-->
<!--        </el-icon>  <span style="vertical-align: middle"> 新增 </span>-->
<!--      </el-button>-->
<!--      <el-upload-->
<!--          v-if="auths.includes('appointment.import')"-->
<!--          class="ml5"-->
<!--          :show-file-list="false"-->
<!--          style="display: inline-block; position: relative; top: 3px"-->
<!--          :action='`http://${config.serverUrl}/appointment/import`'-->
<!--          :on-success="handleImportSuccess"-->
<!--          :headers="{ Authorization: token}"-->
<!--      >-->
<!--        <el-button type="primary">-->
<!--          <el-icon style="vertical-align: middle">-->
<!--            <Bottom />-->
<!--          </el-icon>  <span style="vertical-align: middle"> 导入 </span>-->
<!--        </el-button>-->
<!--      </el-upload>-->
<!--      <el-button type="primary" @click="exportData" class="ml5" v-if="auths.includes('appointment.export')">-->
<!--        <el-icon style="vertical-align: middle">-->
<!--          <Top />-->
<!--        </el-icon>  <span style="vertical-align: middle"> 导出 </span>-->
<!--      </el-button>-->
<!--      <el-popconfirm title="您确定删除吗？" @confirm="confirmDelBatch" v-if="auths.includes('appointment.deleteBatch')">-->
<!--        <template #reference>-->
<!--          <el-button type="danger" style="margin-left: 5px">-->
<!--            <el-icon style="vertical-align: middle">-->
<!--              <Remove />-->
<!--            </el-icon>  <span style="vertical-align: middle"> 批量删除 </span>-->
<!--          </el-button>-->
<!--        </template>-->
<!--      </el-popconfirm>-->
<!--    </div>-->

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id" v-if="user.role ==='ADMIN'|| user.role ==='TUTOR'"></el-table-column>
        <el-table-column prop="time" label="schedule time" v-if="user.role ==='ADMIN'|| user.role ==='TUTOR'"></el-table-column>
        <el-table-column prop="time" label="appointment time">
          <template #default="scope">
            {{scope.row.availability.date}} {{formatTime(scope.row.availability.startTime)}}
          </template>
        </el-table-column>
      <el-table-column  label="Tutor" v-if="user.role ==='ADMIN'||user.role ==='STUDENT'">
        <template #default="scope">
<!--          <span v-if="scope.row.availabilityId">{{ state.availabilityOptions.find(v => v.id === scope.row.availabilityId) ? state.availabilityOptions.find(v => v.id === scope.row.availabilityId).name : '' }}</span>-->
          {{scope.row.availability.name}}
        </template></el-table-column>
      <el-table-column prop="subject" label="Subject"></el-table-column>
      <el-table-column label="Student " v-if="user.role ==='ADMIN'|| user.role ==='TUTOR'">
        <template #default="scope">
<!--          <span v-if="scope.row.userId">{{ state.userOptions.find(v => v.id === scope.row.userId) ? state.userOptions.find(v => v.id === scope.row.userId).firstName + ' ' + state.userOptions.find(v => v.id === scope.row.userId).lastName: '' }}</span>-->
          {{scope.row.user.firstName}} {{scope.row.user.lastName}}
        </template></el-table-column>
        <el-table-column prop="status" label="status" width="100">
          <template #default = "scope">
            <el-tag v-if="scope.row.status === 'Accepted'" type="success">Accepted</el-tag>
            <el-tag v-if="scope.row.status === 'Decline'" type="danger">Decline</el-tag>
            <el-tag v-if="scope.row.status === 'Pending'" type="warning">Pending</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="link">
          <template #default="scope">
            <el-tooltip
                class="link-tooltip"
                effect="light"
                :content="scope.row.availability.virtualLink"
                placement="top-start"
            >
              <el-link type="primary" :href="scope.row.availability.virtualLink" v-show="scope.row.status === 'Accepted'">
                {{scope.row.availability.virtualLink}}
              </el-link>
            </el-tooltip>
          </template>
        </el-table-column>
        <el-table-column label="Action" width="120"  v-if="auths.includes('appointment.cancel')" >
          <template #default="scope">
            <el-button type="danger" @click="del(scope.row.id)" v-if="auths.includes('appointment.cancel')" v-show="scope.row.status !== 'Accepted'">Cancel</el-button>
            <el-button type="primary" @click="handleRating(scope.row)" v-show="scope.row.status === 'Accepted'" >Rating</el-button>
          </template>
        </el-table-column>
<!--        <el-table-column label="Rating" width="120">-->
<!--          <template #default="scope">-->
<!--            <el-button type="primary" @click="handleRating(scope.row)" v-show="scope.row.status === 'Accepted'" >Rate</el-button>-->
<!--          </template>-->
<!--        </el-table-column>-->

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

<!--    <el-dialog v-model="dialogFormVisible" title="Appointment Info" width="40%">-->
<!--      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="80px" style="padding: 0 20px" status-icon>-->
<!--        <el-form-item prop="availabilityId" label="availability ">-->
<!--          <el-select clearable v-model="state.form.availabilityId" placeholder="pick"  style="width: 100%">-->
<!--            <el-option v-for="item in state.availabilityOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
<!--        <el-form-item prop="status" label="pending">-->
<!--          <el-input v-model="state.form.status" autocomplete="off"></el-input>-->
<!--        </el-form-item>-->
<!--        <el-form-item prop="time" label="appointment time">-->
<!--          <el-date-picker style="width: 100%" v-model="state.form.time" type="datetime" value-format="YYYY-MM-DD HH:mm:ss" placeholder="Choose Datetime"></el-date-picker>-->
<!--        </el-form-item>-->
<!--        <el-form-item prop="userId" label="user ">-->
<!--          <el-select clearable v-model="state.form.userId" placeholder="pick"  style="width: 100%">-->
<!--            <el-option v-for="item in state.userOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->

<!--      </el-form>-->
<!--      <template #footer>-->
<!--      <span class="dialog-footer">-->
<!--        <el-button @click="dialogFormVisible = false">Cancel</el-button>-->
<!--        <el-button type="primary" @click="save">-->
<!--          Save-->
<!--        </el-button>-->
<!--      </span>-->
<!--      </template>-->
<!--    </el-dialog>-->

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

<style>
.el-link {
  display: inline-block;
  max-width: 100%; /* 你可以根据需要设置最大宽度 */
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>