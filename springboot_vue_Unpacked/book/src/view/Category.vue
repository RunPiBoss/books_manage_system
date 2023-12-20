<template>
  <div>
    <el-card>
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>馆藏类别管理</el-breadcrumb-item>
        <el-breadcrumb-item>类别信息管理</el-breadcrumb-item>
      </el-breadcrumb>
      <el-row :gutter="10">
        <el-col :span="8">
          <el-input v-model="catename" placeholder="请输入类别名称查询"></el-input>
        </el-col>
        <el-col :span="8">
          <el-button type="primary" icon="el-icon-zoom-in">搜索</el-button>
        </el-col>
        <el-col :span="4" offset="4">
          <el-button type="success" icon="el-icon-plus" @click="openAddDialog">添加</el-button>
        </el-col>
      </el-row>
      <el-table :data="tableData">
        <el-table-column label="类别名称" prop="catename"/>
        <el-table-column label="创建时间" prop="createtime"/>
        <el-table-column label="修改时间" prop="modifytime"/>
        <el-table-column label="操作">
          <template v-slot="scopes">
            <el-button type="primary" size="mini" icon="el-icon-edit" @click=openEditDialog(scopes.row)>修改</el-button>
            <el-button type="danger" size="mini" icon="el-icon-delete" @click="remove(scopes.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <!--      添加对话框-->
      <el-dialog title="添加类别" :visible.sync="addDialogFlag">
        <!--        :model = "category" :rules="rules" ref="category" 绑定表单内容， 绑定规则， 制定表单名称-->
        <el-form :model="category" :rules="rules" ref="category">
          <el-form-item label="类别名称" prop="catename">
            <el-input v-model="category.catename" 请输入类别名称></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="addDialogFlag = false">关 闭</el-button>
          <el-button type="primary" @click="save">保 存</el-button>
        </div>
      </el-dialog>
      <!--      修改对话框-->
      <el-dialog title="修改类别" :visible.sync="editDialogFlag">
        <!--        :model = "category" :rules="rules" ref="category" 绑定表单内容， 绑定规则， 制定表单名称-->
        <el-form :model="category" :rules="rules" ref="categoryEdit">
          <el-form-item label="类别名称" prop="catename">
            <el-input v-model="category.catename" 请输入类别名称></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="editDialogFlag = false">关 闭</el-button>
          <el-button type="primary" @click="update">保 存</el-button>
        </div>
      </el-dialog>
    </el-card>
  </div>


</template>
<script>
export default {
  data() {
    return {
      tableData: [],
      catename: "",
      addDialogFlag: false, //对话框默认不显示
      editDialogFlag: false, //修改对话框
      category: {
        catename: ""
      },
      rules: {
        catename: [
          // 输入框中的值为空，则显示消息"请输入类别名称
          {required: true, message: '请输入类别名称', trigger: 'blur'},
        ]
      }
    }
  },
  methods: {
    // 打开添加对话框
    openAddDialog() {
      this.addDialogFlag = !this.addDialogFlag
    },
    openEditDialog(row) {
      this.editDialogFlag = !this.editDialogFlag
      this.category = row
    },
    showTipMeassage(message, type) {
      this.$message({
        showClose: true,
        message: message,
        type: type
      })
    },

    save() {
      this.$refs["category"].validate(valid => {
        if (valid) {
          this.$http.post('http://localhost:7514/category/save', this.category).then(res => {
            if (res.status === 200) {
              this.showTipMeassage("添加数据成功", "success")
              this.openAddDialog();
              this.search();
            }
          }).catch(error => {
            alert(error);
          })
        }
      })

    },
    // 根据id修改名称，且只允许修改名称
    update() {
      this.$refs["categoryEdit"].validate(valid => {
        if (valid) {
          this.$http.put('http://localhost:7514/category/update', this.category).then(res => {
            if (res.status === 200) {
              this.showTipMeassage("数据修改成功", "success")
              this.editDialogFlag = !this.editDialogFlag
              this.search();
            }
          }).catch(error => {
            alert(error);
          })
        }
      })
    },
    search() {
      this.$http.get('http://localhost:7514/category/list')
        .then(res => {
          if (res.status === 200)
            this.tableData = res.data;
        }).catch(error => {
        alert(error);
      })
    },
    remove(row) {
      // 发起delete请求
      console.log(row)
      this.$http.delete('http://localhost:7514/category/delete?cateid=' + row.cateid)
        .then(res => {
          if (res.status === 200) {
            this.showTipMeassage("数据删除成功", "success")
            this.search();
          }
        }).catch(error => {
        alert(error);
      })
    },

  },
  mounted() {
    this.search();
  }
}
</script>
<style scoped>
.el-breadcrumb {
  padding: 6px;
}
</style>
