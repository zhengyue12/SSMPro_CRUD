package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.domain.Employee;
import com.ssm.domain.MessageBean;
import com.ssm.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@RestControoler相当于@Controller+@ResponseBody
@RestController
public class EmployeeController {
    @Autowired
    private IEmployeeService employeeService;

    /**
     * 分页查询并使用jackson返回json格式返回值
     * @return
     */
    @RequestMapping("/emps")
    public MessageBean getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn
            , Model model) {
        PageHelper.startPage(pn, 5).setOrderBy("emp_id asc");
        //startPage后面紧跟的查询就是分页查询
        List<Employee> emps = employeeService.getAll();
        //使用pageInfo包装查询的结果
        //封装了详细的分页信息，包括我们查询出来的数据,传入我们连续显示的页数
        PageInfo page = new PageInfo(emps, 5);
        return MessageBean.success().add("pageInfo", page);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public MessageBean getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return MessageBean.success().add("emp", employee);
    }

    /**
     * Restful风格
     * 保存用户
     *      1.支持JSR303校验
     *      2.导入hibernate-validator
     *      @Valid注解表示需要校验
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public MessageBean saveEmp(@Valid Employee employee,
        BindingResult result) {
        if(result.hasErrors()) {
            //检验失败，应该返回失败，在模态框中显示错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error: errors) {
                System.out.println("错误的字段名："+error.getField());
                System.out.println("错误信息："+error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return MessageBean.fail().add("errorFields", map);
        } else {
            employeeService.saveEmp(employee);
            return MessageBean.success();
        }
    }

    /**
     * 更新
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    public MessageBean updateEmp(Employee employee) {
        employeeService.updateEmp(employee);
        return MessageBean.success();
    }

    /**
     * 检验用户
     */
    @RequestMapping("/checkEmp")
    public MessageBean checkEmp(String empName) {
        //判断用户是否合法
        String regex = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regex)) {
            return MessageBean.fail().add("va_msg", "用户名可以是2-5位中文汉字，也可以是3-16位英文或数字");
        }
        //判断用户是否存在
        boolean check = employeeService.checkEmp(empName);
        if(check) {
            return MessageBean.success();
        } else {
            return MessageBean.fail().add("va_msg", "用户名已存在");
        }

    }

    /**
     * 完成批量或是单个删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    public MessageBean deleteEmp(@PathVariable("ids") String ids) {
        List<Integer> deleteEmps = new ArrayList<>();
        for (String id : ids.split("-")) {
            deleteEmps.add(Integer.parseInt(id));
        }
        employeeService.deleteBatch(deleteEmps);
        return MessageBean.success();
    }

    /**
     * 分页查询
     * @return
     */
    //@RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn", defaultValue = "1")Integer pn
//        , Model model){
//        System.out.println("emps运行");
//        //传入页面和每页大小
//        PageHelper.startPage(pn, 5);
//        //startPage后面紧跟的查询就是分页查询
//        List<Employee> emps = employeeService.getAll();
//        //使用pageInfo包装查询的结果
//        //封装了详细的分页信息，包括我们查询出来的数据,传入我们连续显示的页数
//        PageInfo page = new PageInfo(emps, 5);
//        model.addAttribute("pageInfo", page);
//        return "list";
//    }
}
