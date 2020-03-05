package com.ssm.test;

import com.ssm.dao.DepartmentMapper;
import com.ssm.dao.EmployeeMapper;
import com.ssm.domain.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * 测试dao层工作
 */

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private SqlSession sqlSession;
    /**
     * 测试DepartmenMapper
     */
    @Test
    public void testCRUD() {
        //System.out.println(departmentMapper);
        //1.插入几个部门
        //departmentMapper.insertSelective(new Department(null, "开发部"));
        //departmentMapper.insertSelective(new Department(null, "测试部"));

        //2.生成员工数据，测试员工插入
        //employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@qq.com", 1));

        //3.批量插入多个员工
        /**
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0; i<500; i++){
            String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null, uuid, "M", uuid+"@163.com", 1));
        }
        System.out.println("执行完成");
         **/
    }
}