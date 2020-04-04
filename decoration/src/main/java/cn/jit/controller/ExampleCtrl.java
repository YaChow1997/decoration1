package cn.jit.controller;

import cn.jit.common.Result;
import cn.jit.po.Example;
import cn.jit.service.ExampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/example")
public class ExampleCtrl extends BaseCtrl{
    @Autowired
    private ExampleService exampleService;
    @RequestMapping("/queryExamples")
    public Result queryExamples(@RequestParam("pageNumber")Integer pageNumber,
                                @RequestParam("pageSize")Integer pageSize,
                                @RequestParam(value = "beginTime",required = false)String beginTime,
                                @RequestParam(value = "endTime",required = false)String endTime,
                                @RequestParam(value = "title",required = false)String title){
        Map<String,Object> params=new HashMap<>();
        params.put("pageNumber",pageNumber);
        params.put("pageSize",pageSize);
        params.put("title",title);
        params.put("beginTime",beginTime);
        params.put("endTime",endTime);
        return this.send(exampleService.queryExamples(params));
    }
    @RequestMapping("/updateExample")
    public Result updateDecorator(Example example){
        return this.send(exampleService.updateExample(example));
    }
}
