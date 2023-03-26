<script setup>
import { nextTick, reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";


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
  form: {}
})

const valueHtml = ref('')  
// information

state.availabilityOptions = []
request.get('/availability').then(res => state.availabilityOptions = res.data)
state.userOptions = []
request.get('/user').then(res => state.userOptions = res.data)
// userStore.getUser.then(res => state.userOptions = res.data)

const multipleSelection = ref([])

// section deletion
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
      // refresh all data
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  request.get('/appointment/page', {
    params: {
      name: name.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
  })
}
load()  // use load method to get the backend data

const reset = () => {
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

// add
const handleAdd = () => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = {}
    valueHtml.value = ''  
    // information
  })
}

// Save
const save = () => {
  ruleFormRef.value.validate(valid => {   // valid is the result
    if (valid) {
      state.form.content = valueHtml.value  // save the information
      request.request({
        url: '/appointment',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('save success')
          dialogFormVisible.value = false
          load()  
          // refresh all data
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}

// edit
const handleEdit = (raw) => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = JSON.parse(JSON.stringify(raw))
    valueHtml.value = raw.content  
    // information
  })
}

// delete
const del = (id) => {
  request.delete('/appointment/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('Cancel Success')
      load()  
      // refresh all data
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// export
const exportData = () => {
  window.open(`http://${config.serverUrl}/appointment/export`)
}


const handleImportSuccess = () => {
  // refresh all data
  load()
  ElMessage.success("import success")
}

const handleFileUploadSuccess = (res) => {
  state.form.file = res.data
  ElMessage.success('upload success')
}
const handleImgUploadSuccess = (res) => {
  state.form.img = res.data
  ElMessage.success('image uplaod success')
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
      load()  
      //refresh all data
    } else {
      ElMessage.error(res.msg)
    }
  })
}

</script>

<template>
  <div>
    <div>
<!--      what kind key word for search not decide yet-->
      <el-input v-model="name" placeholder="enter key" class="w300" />
      <el-button type="primary" class="ml5" @click="load">
        <el-icon style="vertical-align: middle">
          <Search />
        </el-icon>  <span style="vertical-align: middle"> search </span>
      </el-button>
      <el-button type="warning" class="ml5" @click="reset">
        <el-icon style="vertical-align: middle">
          <RefreshLeft />
        </el-icon>  <span style="vertical-align: middle"> reset </span>
      </el-button>

    </div>

    <div style="margin: 10px 0">
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
    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id"></el-table-column>
      <el-table-column label="availability "><template #default="scope"><span v-if="scope.row.availabilityId">{{ state.availabilityOptions.find(v => v.id === scope.row.availabilityId) ? state.availabilityOptions.find(v => v.id === scope.row.availabilityId).name : '' }}</span></template></el-table-column>
        <el-table-column prop="time" label="appointment time"></el-table-column>
      <el-table-column label="user "><template #default="scope"><span v-if="scope.row.userId">{{ state.userOptions.find(v => v.id === scope.row.userId) ? state.userOptions.find(v => v.id === scope.row.userId).firstName + ' ' + state.userOptions.find(v => v.id === scope.row.userId).lastName: '' }}</span></template></el-table-column>
        <el-table-column prop="status" label="status" width="100"></el-table-column>
        <el-table-column label="Cancel" width="120" v-if="auths.includes('appointment.cancel')">
          <template #default="scope">
            <el-button type="danger" @click="del(scope.row.id)" v-if="auths.includes('appointment.cancel')">Cancel</el-button>
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
          :page-sizes="[2, 5, 10, 20]"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      />
    </div>

    <el-dialog v-model="dialogFormVisible" title="Appointment Info" width="40%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="80px" style="padding: 0 20px" status-icon>
        <el-form-item prop="availabilityId" label="availability ">
          <el-select clearable v-model="state.form.availabilityId" placeholder="pick"  style="width: 100%">
            <el-option v-for="item in state.availabilityOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="status" label="pending">
          <el-input v-model="state.form.status" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="time" label="appointment time">
          <el-date-picker style="width: 100%" v-model="state.form.time" type="datetime" value-format="YYYY-MM-DD HH:mm:ss" placeholder="Choose Datetime"></el-date-picker>
        </el-form-item>
        <el-form-item prop="userId" label="user ">
          <el-select clearable v-model="state.form.userId" placeholder="pick"  style="width: 100%">
            <el-option v-for="item in state.userOptions" :key="item.id" :label="item.name" :value="item.id"></el-option>
          </el-select>
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


  </div>
</template>
