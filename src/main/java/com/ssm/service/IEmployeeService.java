package com.ssm.service;

import com.ssm.domain.Employee;

import java.util.List;

public interface IEmployeeService {
    public List<Employee> getAll();

    void saveEmp(Employee employee);

    boolean checkEmp(String empName);

    Employee getEmp(Integer id);

    void updateEmp(Employee employee);

    void deleteBatch(List<Integer> deleteEmps);
}
