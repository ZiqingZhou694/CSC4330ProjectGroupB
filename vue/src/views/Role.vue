<script setup>
import {nextTick, reactive, ref} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import config from "../../config";
import {useUserStore} from "@/stores/user";

const name = ref('')
const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)
const permissionTreeRef = ref()
const userStore = useUserStore()
const user = userStore.getUser
const token = userStore.getBearerToken
const auths = userStore.getAuths

const state = reactive({
  tableData: [],
  form: {},
  treeData: []
})
const multipleSelection = ref([])

// 批量删除
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

const confirmDelBatch = () => {
  if (!multipleSelection.value || !multipleSelection.value.length) {
    ElMessage.warning("please select a data")
    return
  }
  const idArr = multipleSelection.value.map(v => v.id)
  request.post('/role/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('successs')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  request.get('/role/page', {
    params: {
      name: name.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
  })

  request.get('/permission/tree').then(res => {
    state.treeData = res.data
  })
}
load()  // 调用 load方法拿到后台数据

const reset = () => {
  name.value = ''
  load()
}

const dialogFormVisible = ref(false)

const rules = reactive({
  name: [
    { required: true, message: 'Role Name', trigger: 'blur' },
  ],
  flag: [
    { required: true, message: "role's flag", trigger: 'blur' },
  ]
})
const ruleFormRef = ref()

// 新增
const handleAdd = () => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = {}
  })
}

// 保存
const save = () => {
  ruleFormRef.value.validate(valid => {   // valid就是校验的结果
    if (valid) {
      // 目前被选中的菜单节点
      let checkedKeys = permissionTreeRef.value.getCheckedKeys();
      // 半选中的菜单节点
      let halfCheckedKeys = permissionTreeRef.value.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);

      state.form.permissionIds = checkedKeys
      request.request({
        url: '/role',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('Save success')
          dialogFormVisible.value = false
          load()  // 刷新表格数据
          if (state.form.flag === 'ADMIN') {
            logout()
          }
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

    permissionTreeRef.value.setCheckedKeys([])  // 先清除选中的节点
    raw.permissionIds.forEach(v => {
      permissionTreeRef.value.setChecked(v, true, false)  // 给权限树设置选中的节点
    })
  })
}

// 删除
const del = (id) => {
  request.delete('/role/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('success')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// // 导出接口
// const exportData = () => {
//   window.open(`http://${config.serverUrl}/role/export`)
// }



// const handleImportSuccess = () => {
//   // 刷新表格
//   load()
//   ElMessage.success("import success")
// }


const logout = () => {
  request.get('/logout/' + user.uid).then(res => {
    if (res.code === '200') {
      userStore.logout()
    } else {
      ElMessage.error(res.msg)
    }
  })
}
</script>

<template>
  <div>
    <div>
      <el-input v-model="name" placeholder="Enter a role name" class="w300" />
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
      <el-button type="success" @click="handleAdd" v-if="auths.includes('role.add')">
        <el-icon style="vertical-align: middle">
          <Plus />
        </el-icon>  <span style="vertical-align: middle"> Add </span>
      </el-button>
      <el-upload
          v-if="auths.includes('role.import')"
          class="ml5"
          :show-file-list="false"
          style="display: inline-block; position: relative; top: 3px"
          :action='`http://${config.serverUrl}/role/import`'
          :on-success="handleImportSuccess"
          :headers="{ Authorization: token}"
      >
        <el-button type="primary">
          <el-icon style="vertical-align: middle">
            <Bottom />
          </el-icon>  <span style="vertical-align: middle"> Import </span>
        </el-button>
      </el-upload>
      <el-button type="primary" @click="exportData" class="ml5"  v-if="auths.includes('role.export')">
        <el-icon style="vertical-align: middle">
          <Top />
        </el-icon>  <span style="vertical-align: middle"> Export </span>
      </el-button>
      <el-popconfirm width="15%" title="you want to delete this?" @confirm="confirmDelBatch"  v-if="auths.includes('role.deleteBatch')">
        <template #reference>
          <el-button type="danger" style="margin-left: 5px">
            <el-icon style="vertical-align: middle">
              <Remove />
            </el-icon>  <span style="vertical-align: middle"> Batch deletion </span>
          </el-button>
        </template>
      </el-popconfirm>
    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="Id"></el-table-column>
        <el-table-column prop="name" label="Name"></el-table-column>
        <el-table-column prop="flag" label="Flag"></el-table-column>

        <el-table-column label="Action" width="180">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)"  v-if="auths.includes('role.edit')">Edit</el-button>
            <el-popconfirm width="15%" title="you want to delete this?" @confirm="del(scope.row.id)"  v-if="auths.includes('role.delete')">
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
        <el-form-item prop="name" label="Name" >
          <el-input v-model="state.form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item prop="flag" label="Flag" >
          <el-input v-model="state.form.flag" autocomplete="off" />
        </el-form-item>
        <el-form-item label="role" >
          <div style="width: 100%; border: 1px solid #ccc; border-radius: 5px; padding: 5px">
            <el-tree ref="permissionTreeRef" :data="state.treeData" :props="{ label: 'name', value: 'id' }"
                     show-checkbox node-key="id"></el-tree>
          </div>
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
