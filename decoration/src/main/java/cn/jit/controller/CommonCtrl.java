package cn.jit.controller;

import cn.jit.common.Result;
import cn.jit.dto.UserDto;
import cn.jit.po.*;
import cn.jit.po.Process;
import cn.jit.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;


@RequestMapping("/common")
@RestController
public class CommonCtrl extends BaseCtrl {
    @Autowired
    private UserService userService;

    @Autowired
    private ProcessService processService;
    @Autowired
    private DecoratorService decoratorService;
    @Autowired
    private RatingService ratingService;
    @Autowired
    private DesignService designService;

    @RequestMapping(value = "/upload")
    public ModelAndView upload(@RequestParam MultipartFile[] imgs, HttpSession session) throws Exception{

        UserDto userDto = (UserDto) session.getAttribute("USER_SESSION");

        Process process=new Process();
        process.setDecoratorId(userDto.getId());

        String url="";
        boolean flag=false;

        for (MultipartFile img : imgs) {
            if (img.getSize() > 0) {
                //构建文件上传所要保存的"文件夹路径"--这里是相对路径，保存到项目根路径的文件夹下
                String path = new String("G:/javaworkspace1/decoration/decoration/src/main/webapp/files/")+img.getOriginalFilename();
                String path2=new String("../files/")+img.getOriginalFilename();
                String fileName = img.getOriginalFilename();
                if (fileName.endsWith("jpg") || fileName.endsWith("png")) {
                    File file = new File(path);
                    img.transferTo(file);
                    if(flag==false){
                        url=path2;
                    }else{
                        url=url+"#"+path2;
                    }
                    flag=true;
                }

            }

        }
        process.setPic(url);
        processService.updateProcess(process);

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("common/success");
        return modelAndView;

    }

    @RequestMapping("/upload1")
    public ModelAndView upload1(@RequestParam MultipartFile img,HttpServletRequest request) throws Exception{
        Design design=new Design();
        Integer id=Integer.parseInt(request.getParameter("clientId1"));
        design.setClientId(id);
        String drawing="";
        if (img.getSize() > 0) {
            //构建文件上传所要保存的"文件夹路径"--这里是相对路径，保存到项目根路径的文件夹下
            String path = new String("D:/images/pic/")+img.getOriginalFilename();
            String path2=new String("/images/pic/")+img.getOriginalFilename();
            String fileName = img.getOriginalFilename();
            if (fileName.endsWith("jpg") || fileName.endsWith("png")) {
                File file = new File(path);
                img.transferTo(file);
                drawing=path2;

            }

        }
        design.setDrawing(drawing);
        designService.updateDesign(design);

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("common/uploadsuccess");
        return modelAndView;
    }

    @RequestMapping("/rate")
    public Result rate(@RequestParam(value = "score")Integer score, @RequestParam(value = "exampleId")Integer exampleId, HttpServletRequest request, HttpServletResponse response)  throws IOException {
        HttpSession session = request.getSession();
        Rating rating=new Rating();
        UserDto user = (UserDto) session.getAttribute("USER_SESSION");
        rating.setClientId(user.getId());
        rating.setExampleId(exampleId);
        rating.setScore(score);
        ratingService.addRatingByUser(rating);
        return this.send(ratingService.addRatingByUser(rating));
    }

    @RequestMapping("/acceptBtn")
    public Result acceptBtn(@RequestParam("clientId")Integer clientId,
                            @RequestParam("isAccept")String isAccept,
                            @RequestParam("status")String status,HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        Decorator decorator=decoratorService.queryDecoratorByUserId(userDto.getId());
        if(decorator.getStatus().equals("1")){
            return this.send(-1,"你已有预约客户");
        }
        decorator.setStatus(status);
        decorator.setUserId(userDto.getId());
        decoratorService.updateDecoratorByUserId(decorator);
        Process process=new Process();
        process.setClientId(clientId);
        process.setIsAccept(isAccept);
        processService.updateByClientId(process);
        return this.send(null);
    }

    @RequestMapping("/finishBtn")
    public Result finishBtn(@RequestParam("clientId")Integer clientId, @RequestParam("isDelete")String isDelete){
        Process process=new Process();
        process.setClientId(clientId);
        process.setIsDelete(isDelete);
        return this.send(processService.updateByClientId(process));
    }
}
