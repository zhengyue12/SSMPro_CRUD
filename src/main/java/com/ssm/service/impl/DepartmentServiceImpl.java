package com.ssm.service.impl;

import com.ssm.dao.DepartmentMapper;
import com.ssm.domain.Department;
import com.ssm.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements IDepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDept() {
        return departmentMapper.selectByExample(null);
    }
}
