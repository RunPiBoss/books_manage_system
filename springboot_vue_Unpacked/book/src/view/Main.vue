<template>
  <el-container>
    <el-header>
      <router-link to="/" class="router-link">
        <div class="title">图书借阅分析系统</div>
      </router-link>
    </el-header>
    <el-container>
      <el-aside width="200px">
        <el-menu router background-color="#2B4B6B" text-color="#fff"
                 active-text-color="#409EFF" unique-opened>
          <el-submenu>
            <template slot="title">
              <i class="el-icon-platform-eleme"></i>
              <span>馆藏类别</span>
            </template>
            <el-menu-item index="/category">
              <i class="el-icon-platform-eleme"></i>
              <span>类别信息管理</span>
            </el-menu-item>
          </el-submenu>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view/>
      </el-main>
    </el-container>
  </el-container>
</template>
<script>

</script>
<style scoped>
.el-container {
  height: 100%;
}

.el-header {
  background-color: #2B4B6B;
  display: flex;
  justify-content: space-between;
  padding-left: 10px;
  align-items: center;
  color: white;
  font-size: 18px;
}
.router-link {
  text-decoration: none; /* 去掉下划线 */
  color: inherit; /* 继承父元素的文本颜色 */
  cursor: pointer; /* 鼠标移上去显示手型 */
}

.el-aside {
  color: white;
  background-color: #2B4B6B;
}

.el-main {
  background-color: aliceblue;
}


</style>
