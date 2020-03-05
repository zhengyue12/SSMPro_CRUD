<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUSSS
  Date: 2020/2/20
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>员工列表</title>
        <% pageContext.setAttribute("APP_PATH", request.getContextPath());%>
        <%--    <script src="${APP_PATH}/static/js/jquery-3.3.1.js" type="text/javascript"/>--%>
        <%--    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"/>--%>
        <%--    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"/>--%>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!--搭建员工查询显示页面-->
        <div class="container">
                <!--标题-->
                <div class="row">
                    <div class="col-md-12">
                        <h1>SSM-CRUD</h1>
                    </div>
                </div>
                <!--按钮-->
                <div class="row">
                    <div class="col-md-4 col-md-offset-8">
                        <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
                        <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
                    </div>
                </div>
                <br/>
                <!--显示表格数据-->
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered table-hover" id="emps_table">
                            <!--表格头数据-->
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="check_all"/></th>
                                    <th>#</th>
                                    <th>员工姓名</th>
                                    <th>性别</th>
                                    <th>邮箱</th>
                                    <th>部门名称</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <!--表格体-->
                            <tbody></tbody>

                        </table>
                    </div>
                </div>
                <!--显示分页信息-->
                <div class="row">
                    <!--分页文字信息-->
                    <div class="col-md-6" id="page_info_area"></div>

                    <!--分页条信息-->
                    <div class="col-md-6" id="page_nav_area"></div>
                </div>
            </div>

        <!-- 员工新增界面，模态框 -->
        <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工新增</h4>
                </div>
                <div class="modal-body">
                    <!--新增表单-->
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">姓名：</label>
                            <div class="col-sm-6">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="张三">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">性别：</label>
                            <div class="col-sm-6">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">邮箱：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="email" id="email_add_input" placeholder="email@163.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <!--部门信息提交id即可-->
                        <div class="form-group">
                            <label class="col-sm-4 control-label">所属部门：</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" ></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

        <!--员工更新界面，模态框-->
        <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">员工更新</h4>
                    </div>
                    <div class="modal-body">
                        <!--新增表单-->
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">姓名：</label>
                                <div class="col-sm-6">
                                    <p class="form-control-static" id="empName_update_static"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">性别：</label>
                                <div class="col-sm-6">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_update_input" value="M"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">邮箱：</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="email" id="email_update_input" placeholder="email@163.com">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <!--部门信息提交id即可-->
                            <div class="form-group">
                                <label class="col-sm-4 control-label">所属部门：</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="dId" ></select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            //当前页码
            var currentNum;
            //总记录数
            var totalRecord;

            //页面加载完成后，直接发送ajax请求，要到分页数据
            $(function () {
                to_page(1);
            });

            //使用ajax请求跳转页面
            function to_page(pn) {
                $.ajax({
                    url:"${APP_PATH}/emps",
                    data:"pn="+pn,
                    type:"GET",
                    success:function (data) {
                        //console.log(data);
                        //1.解析并显示员工信息
                        build_emps_table(data);
                        //2.解析并显示分页信息
                        build_page_info(data);
                        //3.解析并显示分页条
                        build_page_nav(data);
                    }
                })
            }

            <!--显示表格查询信息-->
            function build_emps_table(data) {
                //清空table表格
                $("#emps_table tbody").empty();
                var emps = data.extend.pageInfo.list;
                $.each(emps, function (index, item) {
                    <!--选择框-->
                    var checkTd = $("<td></td>")
                        .append("<input type='checkbox' class='check_item'/>")

                    <!--员工编号-->
                    var empIdTd = $("<td></td>")
                        .append(item.empId);

                    <!--员工姓名-->
                    var empNameTd = $("<td></td>")
                        .append(item.empName);

                    <!--性别-->
                    var genderTd = $("<td></td>")
                        .append(item.gender == "M" ? "男" : "女");

                    <!--邮箱-->
                    var emailTd = $("<td></td>")
                        .append(item.email);

                    <!--所属部门-->
                    var deptNameTd = $("<td></td>")
                        .append(item.department.deptName);

                    <!--编辑按钮-->
                    var ediBtn = $("<button></button>")
                        .addClass("btn btn-primary btn-sm edit_btn")
                        .append("<span></span>")
                        .addClass("glyphicon glyphicon-pencil")
                        .append("编辑");
                    //在编辑按钮设置一个自定义属性，放值员工id
                    ediBtn.attr("edit-id", item.empId);

                    <!--删除按钮-->
                    var delBtn = $("<button></button>")
                        .addClass("btn btn-danger btn-sm delete_btn")
                        .append("<span></span>")
                        .addClass("glyphicon glyphicon-trash")
                        .append("删除");
                    //在删除按钮设置一个自定义属性，放值员工id
                    delBtn.attr("del-id", item.empId);

                    <!--两个按钮放在一个单元格中-->
                    var btnTd = $("<td></td>")
                        .append(ediBtn)
                        .append("   ")
                        .append(delBtn);

                   $("<tr></tr>")
                       .append(checkTd)
                       .append(empIdTd)
                       .append(empNameTd)
                       .append(genderTd)
                       .append(emailTd)
                       .append(deptNameTd)
                       .append(btnTd)
                       .appendTo("#emps_table tbody");
                });
            }

            <!--解析显示分页信息-->
            function build_page_info(data) {
                //清空分页信息
                $("#page_info_area").empty();
                var pageInfo = data.extend.pageInfo;
                //页码
                var num = pageInfo.pageNum;
                currentNum = num;
                //总页数
                var pages = pageInfo.pages;
                //总记录数
                var totals = pageInfo.total;
                totalRecord = totals;//赋值，总记录数

                $("#page_info_area")
                    .append("当前"+ num +"页，共"+ pages +"页，共"+ totals +"条记录");
            }

            <!--解析显示分页条-->
            function build_page_nav(data) {
                //清空分页条
                $("#page_nav_area").empty();
                var pageInfo = data.extend.pageInfo;

                var ul = $("<ul></ul>")
                    .addClass("pagination");

                //起始页
                var startPageLi = $("<li></li>")
                    .append($("<a></a>").append("首页"));
                //前一页
                var prePageLi = $("<li></li>")
                    .append($("<a></a>").append("&laquo;"));

                //首页，前一页是否可点击
                if(pageInfo.hasPreviousPage == false) {
                    startPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                } else {
                    //首页，前一页绑定点击事件
                    prePageLi.click(function () {
                        to_page(pageInfo.pageNum-1);
                    });
                    startPageLi.click(function () {
                        to_page(1)
                    })
                }
                ul.append(startPageLi)
                    .append(prePageLi);

                //单独页码号,并遍历给ul
                $.each(pageInfo.navigatepageNums, function (index, item) {
                    var numLi = $("<li></li>")
                        .append($("<a></a>").append(item));
                    //当前页码高亮显示
                    if(pageInfo.pageNum == item) {
                        numLi.addClass("active");
                    }
                    //绑定点击事件
                    numLi.click(function () {
                        to_page(item);
                    });
                    ul.append(numLi);
                });

                //后一页
                var nextPageLi = $("<li></li>")
                    .append($("<a></a>").append("&raquo;"));
                //末页
                var endPageLi = $("<li></li>")
                    .append($("<a></a>").append("末页"));

                //尾页，下一页是否可点击
                if(pageInfo.hasNextPage == false) {
                    endPageLi.addClass("disabled");
                    nextPageLi.addClass("disabled");
                } else {
                    //末页，后一页绑定点击事件
                    endPageLi.click(function () {
                        to_page(pageInfo.pages);
                    });
                    nextPageLi.click(function () {
                        to_page(pageInfo.pageNum+1);
                    });
                }
                ul.append(nextPageLi)
                    .append(endPageLi);

                //导航条
                $("<nav></nav>")
                    .append(ul)
                    .appendTo("#page_nav_area");
            }

            //重置表单所以信息包括span提示信息
            function reset_form(ele) {
                //清空表单内容
                $(ele)[0].reset();
                //清空表单样式
                $(ele).find("*").removeClass("has-error has-success");
                //清空校验提示框
                $(ele).find(".help-block").text("");
            }

            <!--员工新增按钮，弹出模态框-->
            $("#emp_add_modal_btn")
                .click(function () {
                    //重置表单
                    reset_form("#empAddModal form");
                    //发送ajax请求，查出部门信息
                   getDepts("#empAddModal select");
                   $("#empAddModal")
                       .modal({
                           backdrop:"static"
                       });
                });

            //查出所有的部门信息并显示在下拉列表中
            function getDepts(ele) {
                //清空下拉列表
                $(ele).empty();
                $.ajax({
                    url:"${APP_PATH}/depts",
                    type:"GET",
                    success: function (data) {
                        console.log(data);
                        $.each(data.extend.deptInfo, function (index, item) {
                            $(ele)
                                .append($("<option></option>")
                                    .append(item.deptName)
                                    .attr("value", item.deptId));
                        });
                    }
                });
            }

            //校验表单数据
            function validate_add_form() {
                //拿到要校验的数据，使用正则表达式
                var empName = $("#empName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
                if(!regName.test(empName)) {
                    //alert("员工姓名格式错误，可以是2-5位中文汉字，也可以是3-16位英文或数字");
                    show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文汉字，也可以是3-16位英文或数字");
                    return false;
                } else {
                    show_validate_msg("#empName_add_input", "success", "");
                }

                var email = $("#email_add_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if(!regEmail.test(email)) {
                    //alert("邮箱格式错误");
                    show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
                    return false;
                } else {
                    show_validate_msg("#email_add_input", "success", "");
                }
                return true;
            }

            //校验状态显示器
            function show_validate_msg(ele, status, msg) {
                $(ele).parent().removeClass("has-success has-error");
                if("success" == status) {
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                } else if("error" == status) {
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }

            //检验用户名是否存在重复，内容改变时触发，所以还要添加每次增加用户时，清空表单内容
            $("#empName_add_input").change(function () {
                //取得表单用户名值
                var empName = this.value;
                //发送ajax检验是否可用
                $.ajax({
                   url:"${APP_PATH}/checkEmp",
                    data:"empName="+empName,
                    type:"POST",
                    success: function (data) {
                       //后端检验重复和用户名是否标准
                        if(data.code == 100) {
                            show_validate_msg("#empName_add_input", "success", "用户名可用");
                            //自定义属性值，由保存按钮进行提取判断是否可存
                            $("#emp_save_btn").attr("ajax-va", "success");
                        } else {
                            show_validate_msg("#empName_add_input", "error", data.extend.va_msg);
                            $("#emp_save_btn").attr("ajax-va", "error");
                        }
                    }
                });
            });

            //保存按钮实现数据持久化保存
            $("#emp_save_btn").click(function () {
                //先对要提交到服务器的数据进行校验
                if(!validate_add_form()) {
                    return false;
                };

                //判断用户是否重复
                if("error" == $(this).attr("ajax-va")) {
                    return false;
                }
                //ajax保存员工
                $.ajax({
                   url:"${APP_PATH}/emp",
                    method:"POST",
                    //jquery提供的数据序列化方法
                    data:$("#empAddModal form").serialize(),
                    success: function (data) {
                       if(data.code == 100){
                           alert(data.msg);
                           //关闭模态框
                           $("#empAddModal")
                               .modal("hide");
                           //跳转到最后一页，因为总记录数一定比总页码大，又因为配置了分页合理化
                           to_page(totalRecord);
                       } else {
                            console.log(data);
                           //哪个字段的信息错误显示哪个字段的
                           if(undefined != data.extend.errorFields.email) {
                               //显示邮箱错误信息
                               show_validate_msg("#email_add_input", "error", data.extend.errorFields.email);
                           }
                           if(undefined != data.extend.errorFields.empName) {
                               //显示员工错误信息
                               show_validate_msg("#empName_add_input", "error", data.extend.errorFields.empName);
                           }
                       }

                    }
                });
            });

            //更新用户操作，更新按钮绑定事件
            // 我们是在按钮创建之前就绑定了click，所以绑定不上
            //     在jquery文档中有一个live方法，即使在后面添加的也可以绑定
            //     jquery新版没有live方法，替代的是on
            $(document).on("click", ".edit_btn", function () {
                //alert("edit")
                //1.查出部门信息，并显示部门列表
                getDepts("#empUpdateModal select");
                //2.查出员工信息，并显示信息
                getEmp($(this).attr("edit-id"));
                //3.把员工的id传递模态框的更新按钮
                $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
                //弹出模态框
                $("#empUpdateModal")
                    .modal({
                        backdrop:"static"
                    });
            });
            
            //查询员工信息
            function getEmp(id) {
                $.ajax({
                   url:"${APP_PATH}/emp/"+id,
                    type:"GET",
                    success: function (data) {
                        var empData = data.extend.emp;
                        $("#empName_update_static").text(empData.empName);
                        $("#email_update_input").val(empData.email);
                        $("#empUpdateModal input[name=gender]").val([empData.gender]);
                        $("#empUpdateModal select").val([empData.dId]);
                    }
                });
            };

            //更新保存按钮绑定点击事件
            $("#emp_update_btn").click(function () {
                //表单验证邮箱
                var email = $("#email_update_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if(!regEmail.test(email)) {
                    //alert("邮箱格式错误");
                    show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
                    return false;
                } else {
                    show_validate_msg("#email_update_input", "success", "");
                }
                //ajax更新请求
                $.ajax({
                    url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                    //type:"POST",
                    //data:$("#empUpdateModal form").serialize()+"&_method=PUT",
                    //在web.xml中配置过put的情况下，可以用以下方法
                    type:"PUT",
                    data:$("#empUpdateModal form").serialize(),
                    success: function (data) {
                        alert(data.msg);
                        //关闭模态框
                        $("#empUpdateModal").modal("hide");
                        //回到本页面
                        to_page(currentNum);
                    }
                });
            });

            //单个删除按钮点击事件
            $(document).on("click", ".delete_btn", function () {
                //弹出是否确认删除对话框
                var empName = $(this)
                    .parents("tr")
                    .find("td:eq(2)")
                    .text();
                //获取员工id
                var empId = $(this).attr("del-id");
                if(confirm("确认删除【"+empName+"】吗？")){
                    //确认，发送ajax请求
                    $.ajax({
                       url:"${APP_PATH}/emp/"+empId,
                        type:"DELETE",
                        success:function (data) {
                            alert(data.msg);
                            to_page(currentNum);
                        }
                    });
                }
            })

            //完成全选/全不选功能
            $("#check_all").click(function () {
                //dom原生属性，建议使用prop，attr获取自定义的属性
                var checked = $(this).prop("checked");
                $(".check_item").prop("checked", checked);
            });

            //单个可选框绑定点击事件
            $(document).on("click", ".check_item", function () {
               var flag = $(".check_item checked").length == $(".check_item").length;
               $("#check_all").prop("checked", flag);
            });

            //批量删除绑定单击事件
            $("#emp_delete_all_btn").click(function () {
                var empNames = "";
                var empIds = "";
                $.each($(".check_item:checked"), function (index, item) {
                    //员工姓名
                    empNames += $(this).parents("tr").find("td:eq(2)").text()+", ";
                    //员工id字符串
                    empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
                });
                //去除empName多余逗号
                empNames = empNames.substring(0, empNames.length-2);
                //去除id多余横线
                empIds = empIds.substring(0, empIds.length-1);
                console.log(empNames);
                console.log(empIds);
                if(confirm("确认删除【"+empNames+"】吗？")) {
                    $.ajax({
                        url:"${APP_PATH}/emp/"+empIds,
                        type: "DELETE",
                        success:function (data) {
                            alert(data.msg);
                            to_page(currentNum);
                        }
                    });
                }
            });

        </script>
    </body>
</html>
