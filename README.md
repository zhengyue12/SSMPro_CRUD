#### 项目说明：

​	本项目主要是使用SSM框架进行的一些简单的CRUD操作。

#### 技术栈：

|           技术           |                         说明                          |                       链接                       |
| :----------------------: | :---------------------------------------------------: | :----------------------------------------------: |
| SpringMVC+Spring+Mybatis |                       基础框架                        |    https://spring.io/ \| https://mybatis.org     |
|          MySQL           |                        数据库                         |              https://www.mysql.com/              |
|        bootstrap         |                       前端框架                        |             https://www.bootcss.com/             |
|          maven           |                     项目依赖管理                      |            https://mvnrepository.com/            |
|        pagehelper        |                    Mybatis分页插件                    | https://github.com/pagehelper/Mybatis-PageHelper |
|    Mybatis Generator     | Mybatis逆向工程，用来生成实体类的映射类和映射配置文件 |          https://mybatis.org/generator           |



#### 主要功能：

|    功能     |                      说明                      |
| :---------: | :--------------------------------------------: |
|    分页     |        使用mybatis的pagehelper分页插件         |
|  数据校验   |         jQuery前端校验+JSR303后端校验          |
|    ajax     |                  发送异步请求                  |
| Rest风格URI | GET(查询)，POST(增加)，PUT(修改)，DELETE(删除) |



#### IDEA中WebMaven项目创建过慢问题：

​	创建工程时在properties配置栏中添加 archetypeCatalog ：internal的键值对



#### 数据库信息：

##### 	employee(员工表)

|   字段   |     类型     |           含义           |
| :------: | :----------: | :----------------------: |
|  emp_id  |   int(11)    | 唯一标识，主键，自动递增 |
| emp_name | varchar(255) |         员工姓名         |
|  email   | varchar(255) |           邮箱           |
|  gender  |     char     |           性别           |
|   d_id   |   int(11)    |         所属部门id        |

##### 	department（部门表）

|   字段    |     类型     |            含义            |
| :-------: | :----------: | :------------------------: |
|  dept_id  |   int(11)    | 唯一标识，主键，员工表外键 |
| dept_name | varchar(255) |          部门名称          |



#### 项目依赖：

```xml
<spring.version>5.0.2.RELEASE</spring.version>
<mysql.version>5.1.6</mysql.version>
<mybatis.version>3.4.5</mybatis.version>

<!--Spring jdbc-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-jdbc</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <!--Spring-test-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-test</artifactId>
      <version>${spring.version}</version>
      <scope>test</scope>
    </dependency>

    <!--ioc-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <!--aop-->
    <dependency>
      <groupId>org.aspectj</groupId>
      <artifactId>aspectjweaver</artifactId>
      <version>1.6.8</version>
    </dependency>

    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-aop</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <!--事务-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-tx</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <!--mvc-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-web</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-webmvc</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <!--mybatis-->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>${mybatis.version}</version>
    </dependency>

    <!--spring-mybatis整合-->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis-spring</artifactId>
      <version>1.3.0</version>
    </dependency>

    <!--mysql驱动-->
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>${mysql.version}</version>
    </dependency>

    <!--数据库连接池-->
    <dependency>
      <groupId>c3p0</groupId>
      <artifactId>c3p0</artifactId>
      <version>0.9.1.2</version>
      <type>jar</type>
      <scope>compile</scope>
    </dependency>

    <!--servlet支持-->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>servlet-api</artifactId>
      <version>2.5</version>
      <scope>provided</scope>
    </dependency>

    <dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>jsp-api</artifactId>
      <version>2.0</version>
      <scope>provided</scope>
    </dependency>

	<!-- jstl 支持-->
    <dependency>
      <groupId>jstl</groupId>
      <artifactId>jstl</artifactId>
      <version>1.2</version>
    </dependency>

    <!--JSR303数据校验支持；tomcat7及以上的服务器 -->
    <dependency>
      <groupId>org.hibernate</groupId>
      <artifactId>hibernate-validator</artifactId>
      <version>5.4.1.Final</version>
    </dependency>

    <!--返回json字符串的支持-->
    <dependency>
      <groupId>com.fasterxml.jackson.core</groupId>
      <artifactId>jackson-databind</artifactId>
      <version>2.8.8</version>
    </dependency>

    <!--mybatis反向-->
    <dependency>
      <groupId>org.mybatis.generator</groupId>
      <artifactId>mybatis-generator-core</artifactId>
      <version>1.3.5</version>
    </dependency>

    <!--分页-->
    <dependency>
      <groupId>com.github.pagehelper</groupId>
      <artifactId>pagehelper</artifactId>
      <version>5.1.2</version>
    </dependency>

    <!--junit测试-->
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.12</version>
      <scope>test</scope>
    </dependency>
```



#### 接口详情：

|         URI         |               行为               |
| :-----------------: | :------------------------------: |
|        /dept        |         查询所有部门信息         |
|        /emps        | 查询所有员工信息，并上传分页信息 |
|      /checkEmp      |             校验用户             |
|    /emp（POST）     |             保存用户             |
|    /emp （GET）     |      根据员工id查询员工信息      |
|  /emp/{id} （PUT）  |             更新用户             |
| /emp/{id}（DELETE） |          单个或批量删除          |



#### 查询-逻辑：

 1. **index.jsp页面直接发送ajax请求进行员工分页数据的查询**
 2. **服务器将查出的数据，以json字符串的形式返回给浏览器**
 3. **浏览器收到js字符串。可以使用js对json进行解析，使用js通过dom增删改改变页面。**
 4. **返回json。实现客户端的无关性**



#### 新增-逻辑：

1. **在index.jsp页面点击“新增”**

2. **弹出新增对话框**

3. **去数据库查询部门列表，显示在对话框中**
4. **用户输入数据，并进行校验**
	***jQuery前端校验，ajax用户名重复校验，重要数据（后端校验（JSR303），唯一约束）**
5. **完成保存**



#### 修改-逻辑：

1. **点击编辑**
2.  **弹出用户修改的模态框（显示用户信息）**
3. **点击更新，完成用户修改**



#### 删除逻辑

 1. **单个删除**
 2. **批量删除**
