package com.ssm.controller;

import com.ssm.domain.Department;
import com.ssm.domain.MessageBean;
import com.ssm.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DepartmentController {
    @Autowired
    private IDepartmentService departmentService;

    /**
     * 查询所有
     * @return
     */
    @RequestMapping("/depts")
    public MessageBean getDepts() {
        List<Department> depts = departmentService.getDept();
        return MessageBean.success().add("deptInfo", depts);
    }
}
