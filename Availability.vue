<script setup>
import { nextTick, reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";


const name = ref('')
const subject = ref('')
const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)

const userStore = useUserStore()
let user = userStore.getUser
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const state = reactive({
  tableData: [],
  form: {}
})
state.form = Object.assign({}, user)
const valueHtml = ref('')  
// information

// state.tutorOptions = []
// request.get('/tutor').then(res => state.tutorOptions = res.data)


const multipleSelection = ref([])

// deletion
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
      // refresh all data
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
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
load()  // 调用 load方法拿到后台数据

const reset = () => {
  name.value = ''
  subject.value = ''
  load()
}

const dialogFormVisible = ref(false)
const Hidden = ref(false)

const rules = reactive({

  // name: [
  //   { required: true, message: "please enter the tutor's name", trigger: 'blur' },
  // ],
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
  // tutorId: [
  //   { required: true, message: "please enter the tutor's Id", trigger: 'blur' },
  //   // { required: true, message: "please enter number only", type: 'number'}
  // ]
})

const ruleFormRef = ref()

// 新增
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
    valueHtml.value = ''  // 富文本
  })
}

// 保存
const save = () => {
  ruleFormRef.value.validate(valid => {   // valid就是校验的结果
    if (valid) {
      state.form.content = valueHtml.value  // 富文本保存内容
      request.request({
        url: '/availability',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('保存成功')
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
  request.delete('/availability/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 导出接口 这些没必要
// const exportData = () => {
//   window.open(`http://${config.serverUrl}/availability/export`)
// }
//
//
// const handleImportSuccess = () => {
//   // 刷新表格
//   load()
//   ElMessage.success("Import success")
// }
//
// const handleFileUploadSuccess = (res) => {
//   state.form.file = res.data
//   ElMessage.success('upload success')
// }

// 如果 view 想显示tutor头像可以用 或者用其他方法
//方法还没确定
const handleImgUploadSuccess = (res) => {
  state.form.img = res.data
  ElMessage.success('image upload success')
}
// 这里是 schedule弹窗的脚本
const scheduleDialogVisible = ref(false)
const handleSchedule = (row) =>{
  scheduleDialogVisible.value = true
  state.form.startTime = row.startTime
  state.form.endTime = row.endTime

}
const handleScheduleSave = (row) =>{
  scheduleDialogVisible.value = false
  request.post('/appointment', {availabilityId: row.id}).then(res => {
    if(res.code === '200'){
      ElMessage.success('success')
      load()
    }else{
      ElMessage.error((res.msg))
    }
  })
}
// view 的弹窗脚本
const viewDialogVisible = ref(false)
// 这个handle 要有不然弹窗打不开
const handleView = (row) =>{
  viewDialogVisible.value = true
}


</script>

<template>
  <div>
    <div>
      <el-input v-model="subject" placeholder="Subject" class="w300" />
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
<!--      <el-upload-->
<!--          v-if="auths.includes('availability.import')"-->
<!--          class="ml5"-->
<!--          :show-file-list="false"-->
<!--          style="display: inline-block; position: relative; top: 3px"-->
<!--          :action='`http://${config.serverUrl}/availability/import`'-->
<!--          :on-success="handleImportSuccess"-->
<!--          :headers="{ Authorization: token}"-->
<!--      >-->
<!--        <el-button type="primary">-->
<!--          <el-icon style="vertical-align: middle">-->
<!--            <Bottom />-->
<!--          </el-icon>  <span style="vertical-align: middle"> 导入 </span>-->
<!--        </el-button>-->
<!--      </el-upload>-->
<!--      <el-button type="primary" @click="exportData" class="ml5" v-if="auths.includes('availability.export')">-->
<!--        <el-icon style="vertical-align: middle">-->
<!--          <Top />-->
<!--        </el-icon>  <span style="vertical-align: middle"> 导出 </span>-->
<!--      </el-button>-->
<!--      <el-popconfirm title="您确定删除吗？" @confirm="confirmDelBatch" v-if="auths.includes('availability.deleteBatch')">-->
<!--        <template #reference>-->
<!--          <el-button type="danger" style="margin-left: 5px">-->
<!--            <el-icon style="vertical-align: middle">-->
<!--              <Remove />-->
<!--            </el-icon>  <span style="vertical-align: middle"> 批量删除 </span>-->
<!--          </el-button>-->
<!--        </template>-->
<!--      </el-popconfirm>-->
    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id"></el-table-column>
        <el-table-column prop="date" label="date"></el-table-column>
        <el-table-column width="180" prop="name" label="tutor name"></el-table-column>
        <el-table-column prop="subject" label="subject"></el-table-column>
        <el-table-column prop="startTime" label="start time"></el-table-column>
        <el-table-column prop="endTime" label="end time"></el-table-column>
        <el-table-column prop="tutorId" label="Tutor Id"></el-table-column>
<!--        <el-table-column label="tutor "><template #default="scope"><span v-if="scope.row.tutorId">{{ state.tutorOptions.find(v => v.id === scope.row.tutorId) ? state.tutorOptions.find(v => v.id === scope.row.tutorId).name : '' }}</span></template></el-table-column>-->
      <el-table-column prop="virtualLink" label="link"></el-table-column>
        <el-table-column prop="status" label="status" v-if="auths.includes('availability.status')"></el-table-column>
        <el-table-column label="View Tutor" width="120" v-if="auths.includes('availability.schedule')">
          <template #default="scope">
            <el-button type="primary" @click="handleView(scope.row)" >view</el-button>
          </template>
        </el-table-column>
        <el-table-column label="Appointment" width="120"  v-if="auths.includes('availability.schedule')">
          <template #default="scope">
            <el-button type="primary" @click="handleSchedule(scope.row)" >schedule</el-button>
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
          :page-sizes="[2, 5, 10, 20]"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      />
    </div>

    <el-dialog v-model="dialogFormVisible" title="Availability Info" width="40%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="120px" style="padding: 0 20px" status-icon>
        <el-form-item prop="name" label="Tutor Name" v-show="Hidden">
          <el-input v-model="state.form.name" autocomplete="off"></el-input>
<!--          <el-input v-model="state.form.username" disabled></el-input>-->
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
<!--          <el-select clearable v-model="state.form.tutorId" placeholder="pick"  style="width: 100%">-->
<!--            <el-option v-for="item in state.tutorOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>-->
<!--          </el-select>-->
          <el-input v-model="state.form.tutorId" autocomplete="off"></el-input>
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

    <!--schedule-->
    <el-dialog v-model="scheduleDialogVisible" title="Schedule" width="30%">
      <!-- do schedule pop dialog in here -->
      <el-form>
<!--        <el-form-item label="Date" prop="date">-->
<!--          <el-date-picker v-model="scheduleForm.date" type="date" placeholder="Pick a date"></el-date-picker>-->
<!--        </el-form-item>-->
        <el-form-item label="Start Time" prop="startTime">
          <el-time-select v-model="state.form.startTime" start="06:00" step="01:00" end="23:59" :max-time="state.form.endTime" :min-time="state.form.startTime" placeholder="Pick a time"></el-time-select>
        </el-form-item>
        <el-form-item label="End Time" prop="endTime">
          <el-time-select v-model="state.form.endTime"  start="06:00" step="01:00" end="23:59" :max-time="state.form.endTime" :min-time="state.form.startTime" placeholder="Pick a time"></el-time-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="scheduleDialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="handleScheduleSave">Save</el-button>
      </template>
      <!--      -->
    </el-dialog>


    <!--view -->
    <el-dialog v-model="viewDialogVisible" title="Tutor Info" width="30%">
<!--      do view pop dialog in here       -->
<!--      include the rating here also      -->
<!--      rating may content backend and database-->
<!--      <template #footer>-->
<!--        <el-button @click="viewDialogVisible = false">close</el-button>-->
<!--        <el-button type="primary" @click="handleView">Save</el-button>-->
<!--      </template>-->
      <!--      -->
    </el-dialog>



  </div>
</template>