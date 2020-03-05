package com.ssm.service;

import com.ssm.dao.DepartmentMapper;
import com.ssm.domain.Department;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface IDepartmentService {

    List<Department> getDept();
}
