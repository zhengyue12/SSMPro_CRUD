package com.ssm.service.impl;

import com.ssm.dao.EmployeeMapper;
import com.ssm.domain.Employee;
import com.ssm.domain.EmployeeExample;
import com.ssm.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements IEmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public void saveEmp(Employee employee) {
        employeeMapper.insert(employee);
    }

    /**
     * 校验用户名是否可以
     * @param empName
     * @return true：代表当前姓名客户可用
     */
    @Override
    public boolean checkEmp(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        //count等于0表示，没有该用户，即可用
        return count == 0;
    }

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @Override
    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    /**
     * 更新
     * @param employee
     */
    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * 单个或批量删除
     * @param ids
     */
    @Override
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
