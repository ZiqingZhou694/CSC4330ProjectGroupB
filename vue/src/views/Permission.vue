<script setup>
import {nextTick, reactive, ref} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";

const state = reactive({
  tableData: [],
  form: {}
})
const multipleSelection = ref([])

// 批量删除
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

const confirmDelBatch = () => {
  if (!multipleSelection.value || !multipleSelection.value.length) {
    ElMessage.warning("Please Select Data")
    return
  }
  const idArr = multipleSelection.value.map(v => v.id)
  request.post('/permission/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('Success')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  request.get('/permission/tree').then(res => {
    state.tableData = res.data
  })
}
load()  // 调用 load方法拿到后台数据

const dialogFormVisible = ref(false)

const rules = reactive({
  name: [
    { required: true, message: 'Name', trigger: 'blur' },
  ]
})
const ruleFormRef = ref()

// 新增
const handleAdd = () => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = { type: 1, orders: 1 }

    // 把这个请求加在这里，解决了加新的permission的时候显示no data
    // 请求了icon的数据集合
    request.get('/dict/icons').then(res => {
      icons.value = res.data
    })
  })
}

// 保存
const save = () => {

  ruleFormRef.value.validate(valid => {   // valid就是校验的结果
    if (valid) {
      request.request({
        url: '/permission',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('Save Success')
          dialogFormVisible.value = false
          load()  // 刷新表格数据
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}

const changeHide = (row) => {
  request.request({
    url: '/permission',
    method: 'put',
    data: row
  }).then(res => {
    if (res.code === '200') {
      ElMessage.success('Success')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 图标字典集合
const icons = ref([])
// 编辑
const handleEdit = (raw) => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = JSON.parse(JSON.stringify(raw))

    // 请求了icon的数据集合
    request.get('/dict/icons').then(res => {
      icons.value = res.data
    })
  })
}

// 从数组里删除指定id的数据，获取新的数组
// const getTreeArr = (raw) => {
//   state.tree = JSON.parse(JSON.stringify(state.tableData))
//   if (raw) {
//     let index = state.tree.findIndex(v => v.id === raw.id)
//     state.tree.splice(index, 1)
//   }
// }

// 删除
const del = (id) => {
  request.delete('/permission/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('Success')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 导出接口
const exportData = () => {
  window.open(`http://${config.serverUrl}/permission/export`)
}

const userStore = useUserStore()
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const handleImportSuccess = () => {
  // 刷新表格
  load()
  ElMessage.success("Import Success")
}

const handleNodeClick = (data) => {
  if (data.id === state.form.id) {  // 当前编辑行的id跟选择的父节点的id如果相同的话，就不让他选择
    console.log(data)
    ElMessage.warning("Can't choose parent itself")

    nextTick(() => {  // 等树节点的dom渲染完之后再去修改pid
      // 重置pid
      state.form.pid = null
      console.log(state.form)
    })
  }
}
</script>

<template>
  <div>
    <div style="margin: 10px 0">
      <el-button type="success" @click="handleAdd"  v-if="auths.includes('permission.add')">
        <el-icon style="vertical-align: middle">
          <Plus />
        </el-icon>  <span style="vertical-align: middle"> Add </span>
      </el-button>
<!--      <el-popconfirm title="您确定删除吗？" @confirm="confirmDelBatch" v-if="auths.includes('permission.deleteBatch')">-->
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
      <el-table :data="state.tableData" stripe border row-key="id"  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id"></el-table-column>
        <el-table-column prop="name" label="Name"></el-table-column>
        <el-table-column prop="path" label="Path"></el-table-column>
        <el-table-column prop="page" label="PagePath"></el-table-column>
        <el-table-column prop="orders" label="Orders"></el-table-column>
        <el-table-column prop="icon" label="Icon">
          <template #default="scope">
            <el-icon v-if="scope.row.icon">
              <component :is="scope.row.icon" />
            </el-icon>
          </template>
        </el-table-column>
        <el-table-column prop="auth" label="Auth"></el-table-column>
        <el-table-column prop="pid" label="Parent"></el-table-column>
        <el-table-column prop="type" label="Type">
          <template #default="scope">
            <el-tag type="warning" v-if="scope.row.type === 1">Main Menu</el-tag>
            <el-tag v-if="scope.row.type === 2">Menu Page</el-tag>
            <el-tag type="success" v-if="scope.row.type === 3">Page Button</el-tag>
          </template>
        </el-table-column>

        <el-table-column prop="hide" label="Hide">
          <template #default="scope">
            <el-switch v-model="scope.row.hide" @change="changeHide(scope.row)"></el-switch>
          </template>
        </el-table-column>

        <el-table-column label="Action" width="180">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)" v-if="auths.includes('permission.edit')">Edit</el-button>
            <el-popconfirm width="15%" title="you want to delete this?" @confirm="del(scope.row.id)" v-if="auths.includes('permission.delete')">
              <template #reference>
                <el-button type="danger">Delete</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <el-dialog v-model="dialogFormVisible" title="Info" width="40%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="80px" style="padding: 0 20px" status-icon>
        <el-form-item prop="type" label="Type" >
          <el-radio-group v-model="state.form.type">
            <el-radio :label="1">Main Menu</el-radio>
            <el-radio :label="2">Menu Page</el-radio>
            <el-radio :label="3">Page Button</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item prop="name" label="Name" >
          <el-input v-model="state.form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="path" label="Path" v-if="state.form.type === 2">
          <el-input v-model="state.form.path" autocomplete="off"  />
        </el-form-item>
        <el-form-item prop="page" label="PagePath" v-if="state.form.type === 2" >
          <el-input v-model="state.form.page" autocomplete="off"  />
        </el-form-item>
        <el-form-item prop="orders" label="Orders"  v-if="state.form.type === 1 || state.form.type === 2" >
          <el-input-number v-model="state.form.orders" :min="1" />
        </el-form-item>
        <el-form-item prop="icon" label="Icon"  v-if="state.form.type === 1 || state.form.type === 2">
          <el-select v-model="state.form.icon"  placeholder="Choose" style="width: 100%">
            <el-option
                v-for="item in icons"
                :key="item.id"
                :label="item.code"
                :value="item.value"
            >
              <el-icon>
                <component :is="item.value"></component>
              </el-icon>
              <span style="font-size: 14px; margin-left: 5px; top: -3px">{{ item.code }}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="auth" label="Auth"  v-if="state.form.type === 2 || state.form.type === 3" >
          <el-input v-model="state.form.auth" autocomplete="off"  />
        </el-form-item>
        <el-form-item prop="pid" label="Parent" >
          <el-tree-select style="width: 100%" v-model="state.form.pid" :data="state.tableData"
                          @node-click="handleNodeClick"
                          :props="{ label: 'name', value: 'id' }" :render-after-expand="false" check-strictly />
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
