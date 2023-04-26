<script setup>
import {nextTick, reactive, ref} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";

const name = ref('')
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)

const state = reactive({
  tableData: [],
  form: {}
})
const multipleSelection = ref([])

const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

const confirmDelBatch = () => {
  if (!multipleSelection.value || !multipleSelection.value.length) {
    ElMessage.warning("please choose an data")
    return
  }
  const idArr = multipleSelection.value.map(v => v.id)
  request.post('/dict/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  request.get('/dict/page', {
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
load()

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

const handleAdd = () => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = {}
  })
}

const save = () => {
  ruleFormRef.value.validate(valid => {
    if (valid) {
      request.request({
        url: '/dict',
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
  })
}

const del = (id) => {
  request.delete('/dict/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}
const userStore = useUserStore()
const token = userStore.getBearerToken
const auths =  userStore.getAuths

</script>

<template>
  <div>
    <div>
      <el-input v-model="name" placeholder="Enter key" class="w300" />
      <el-button type="primary" class="ml5" @click="load">
        <el-icon style="vertical-align: middle">
          <Search />
        </el-icon>  <span style="vertical-align: middle"> Search </span>
      </el-button>
      <el-button type="warning" class="ml5" @click="reset">
        <el-icon style="vertical-align: middle">
          <RefreshLeft />
        </el-icon>  <span style="vertical-align: middle"> Reset </span>
      </el-button>

    </div>

    <div style="margin: 10px 0">
      <el-button type="success" @click="handleAdd" v-if="auths.includes('dict.add')">
        <el-icon style="vertical-align: middle">
          <Plus />
        </el-icon>  <span style="vertical-align: middle"> Add </span>
      </el-button>
      <el-popconfirm title="you want to delete this?" @confirm="confirmDelBatch" v-if="auths.includes('dict.deleteBatch')">
        <template #reference>
          <el-button type="danger" style="margin-left: 5px">
            <el-icon style="vertical-align: middle">
              <Remove />
            </el-icon>  <span style="vertical-align: middle"> DeleteBatch </span>
          </el-button>
        </template>
      </el-popconfirm>
    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id"></el-table-column>
        <el-table-column prop="code" label="code"></el-table-column>
        <el-table-column prop="value" label="value">
          <template #default="scope">
            <el-icon>
              <component :is="scope.row.value" />
            </el-icon>
          </template>
        </el-table-column>
        <el-table-column prop="type" label="Type"></el-table-column>

        <el-table-column label="Action" width="180">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)" v-if="auths.includes('dict.edit')">Edit</el-button>
            <el-popconfirm title="you want to delete this?" @confirm="del(scope.row.id)" v-if="auths.includes('dict.delete')">
              <template #reference>
                <el-button type="danger">Delete</el-button>
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

    <el-dialog v-model="dialogFormVisible" title="Info" width="40%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="80px" style="padding: 0 20px" status-icon>
        <el-form-item prop="code" label="code" >
          <el-input v-model="state.form.code" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="value" label="value" >
          <el-input v-model="state.form.value" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="type" label="type" >
          <el-select v-model="state.form.type" style="width: 100%">
            <el-option v-for="item in ['icon']" :key="item" :label="item" :value="item"></el-option>
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
