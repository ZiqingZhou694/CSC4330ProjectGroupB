<script setup>
import {nextTick, reactive, ref} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";

const lastName = ref('')
const address = ref('')
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)
const roles = ref([])

const state = reactive({
  tableData: [],
  form: {}
})
const multipleSelection = ref([])

// multiple deletion
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

const confirmDelBatch = () => {
  if (!multipleSelection.value || !multipleSelection.value.length) {
    ElMessage.warning("please choose an data")
    return
  }
  const idArr = multipleSelection.value.map(v => v.id)
  request.post('/user/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()  // Refresh the data of table
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  request.get('/user/page', {
    params: {
      lastName: lastName.value,
      address: address.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
  })

  request.get('/role').then(res => {
    roles.value = res.data
  })
}
load()  // Call load() to get the backend data

const reset = () => {
  lastName.value = ''
  address.value = ''
  load()
}

const dialogFormVisible = ref(false)

const rules = reactive({
  username: [
    { required: true, message: 'username', trigger: 'blur' },
    { min: 3, max: 20, message: 'length between 3-20', trigger: 'blur' },
  ],
  firstName: [
    { required: true, message: 'first name', trigger: 'blur' },
  ],
  lastName: [
    { required: true, message: 'last name', trigger: 'blur' },
  ],
  email: [
    { required: true, message: 'email: example@university.edu', trigger: 'blur' },
  ],
  address: [
    { required: true, message: 'address', trigger: 'blur' },
  ],
  role: [
    { required: true, message: 'role', trigger: 'blur' },
  ]
})
const ruleFormRef = ref()

// add
const handleAdd = () => {
  dialogFormVisible.value = true
  ruleFormRef.value.resetFields()
  state.form = {}
}

// save
const save = () => {
  ruleFormRef.value.validate(valid => {   // check if the result is valid
    if (valid) {
      request.request({
        url: '/user',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('save success')
          dialogFormVisible.value = false
          load()  // Refresh the data of table
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
  })
}

// delete
const del = (id) => {
  request.delete('/user/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()  // Refresh the data of table
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// Export the interface
const exportData = () => {
  window.open(`http://${config.serverUrl}/user/export`)
}

const userStore = useUserStore()
const token = userStore.getBearerToken
const auths = userStore.getAuths

const handleImportSuccess = () => {
  // Refresh table
  load()
  ElMessage.success("import success")
}



</script>

<template>
  <div>
    <div>
      <el-input v-model="lastName" placeholder="enter last name" class="w300" />
      <el-input v-model="address" placeholder="enter address" class="w300 ml5" />
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
      <el-button type="success" @click="handleAdd" v-if="auths.includes('user.add')">
        <el-icon style="vertical-align: middle">
          <Plus />
        </el-icon>  <span style="vertical-align: middle"> add </span>
      </el-button>
      <el-upload
          v-if="auths.includes('user.import')"
          class="ml5"
          :show-file-list="false"
          style="display: inline-block; position: relative; top: 3px"
          :action='`http://${config.serverUrl}/user/import`'
          :on-success="handleImportSuccess"
          :headers="{ Authorization: token}"
      >
        <el-button type="primary">
          <el-icon style="vertical-align: middle">
            <Bottom />
          </el-icon>  <span style="vertical-align: middle"> import </span>
        </el-button>
      </el-upload>
      <el-button type="primary" @click="exportData" class="ml5"  v-if="auths.includes('user.export')">
        <el-icon style="vertical-align: middle">
          <Top />
        </el-icon>  <span style="vertical-align: middle"> export </span>
      </el-button>
      <el-popconfirm width="15%" title="you want to delete this?" @confirm="confirmDelBatch" v-if="auths.includes('user.deleteBatch')">
        <template #reference>
          <el-button type="danger" style="margin-left: 5px">
            <el-icon style="vertical-align: middle">
              <Remove />
            </el-icon>  <span style="vertical-align: middle"> batch deletion </span>
          </el-button>
        </template>
      </el-popconfirm>
    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" v-if="auths.includes('user.deleteBatch')" />
        <el-table-column prop="username" label="username"></el-table-column>
        <el-table-column prop="firstName" label="firstname"></el-table-column>
        <el-table-column prop="lastName" label="lastname"></el-table-column>
        <el-table-column prop="address" label="address"></el-table-column>
        <el-table-column prop="email" label="email"></el-table-column>
        <el-table-column prop="role" label="role">
          <template #default="scope">
            <span v-if="roles.length">{{ roles.find(r => r.flag === scope.row.role) ? roles.find(r => r.flag === scope.row.role).name : '' }}</span>
          </template>
        </el-table-column>
        <el-table-column label="action" width="200">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)"  v-if="auths.includes('user.edit')">edit</el-button>
            <el-popconfirm width="15%" title="you want to delete this?" @confirm="del(scope.row.id)"  v-if="auths.includes('user.delete')">
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

    <el-dialog v-model="dialogFormVisible" title="userinfo" width="30%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="90px" style="padding: 0 20px" status-icon>
        <el-form-item prop="username" label="username" >
          <el-input v-model="state.form.username" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="firstName" label="firstname">
          <el-input v-model="state.form.firstName" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="lastName" label="lastname">
          <el-input v-model="state.form.lastName" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="role" label="role" >
          <el-select v-model="state.form.role" style="width: 100%">
            <el-option v-for="item in roles" :label="item.name" :value="item.flag" :key="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="email" label="email">
          <el-input v-model="state.form.email" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="address" label="address">
          <el-input type="textarea" v-model="state.form.address" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogFormVisible = false">cancel</el-button>
        <el-button type="primary" @click="save">
          save
        </el-button>
      </span>
      </template>
    </el-dialog>
  </div>
</template>
