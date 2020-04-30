package cn.jit.controller;

import cn.jit.dto.MenuDto;
import cn.jit.dto.UserDto;
import cn.jit.po.*;
import cn.jit.po.Process;
import cn.jit.recommend.Recommendation;
import cn.jit.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/render")
public class RenderCtrl {
    @Autowired
    private MenuService menuService;
    @Autowired
    private UserService userService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private DecoratorService decoratorService;
    @Autowired
    private ExampleService exampleService;
    @Autowired
    private ProcessService processService;
    @Autowired
    private Recommendation application;
    @Autowired
    private DesignService designService;
    /**
     * 跳转到首页，首页标签处于激活状态
     * @param session
     * @return
     */
    @GetMapping("/toIndex")
    public ModelAndView toIndex(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("common/index");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        List<Example> examplesList=exampleService.queryAllExamples();
        modelAndView.addObject("examplesList",examplesList);

        modelAndView.addObject("menuId",9);
        return modelAndView;
    }

    @GetMapping("/toPush")
    public ModelAndView toPush(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/push");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        List<Example> examplesList=exampleService.queryAllExamples();
        modelAndView.addObject("examplesList",examplesList);

        modelAndView.addObject("menuId",4);
        return modelAndView;
    }

    @GetMapping("toreserve")
    public ModelAndView toreserve(HttpSession session){
        UserDto userDto=(UserDto)session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("client/decoratorList");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        List<Decorator> decoratorsList=decoratorService.queryAllDecorators();
        modelAndView.addObject("decoratorsList",decoratorsList);
        modelAndView.addObject("menuId",10);
        return modelAndView;
    }

    @GetMapping("/toManageClient")
    public ModelAndView toManageClient(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/manageClient");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",1);
        User user=new User();
        user.setRoleId(3);
        /*查询所有客户*/
        modelAndView.addObject("users",userService.queryAllUsers(user));
        return modelAndView;
    }

    @GetMapping("/toManageDecorator")
    public ModelAndView toManageDecorator(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/manageDecorator");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",2);
        User user=new User();
        user.setRoleId(2);
        /*查询所有客户*/
        modelAndView.addObject("users",userService.queryAllUsers(user));
        return modelAndView;
    }

    @GetMapping("/toManageExample")
    public ModelAndView toManageExample(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/manageExample");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",3);

        return modelAndView;
    }

    @GetMapping("/todecProcess")
    public ModelAndView todecProcess(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();

        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",8);

        Process process=processService.queryByDecoratorId1(userDto.getId());

        String[] str=new String[4];
        if(process!=null){
            if(process.getPic()!=null){
                str=process.getPic().split("#");
            }
            List<String> urlList=new ArrayList<>();
            for(int i=1;i<=4;i++){
                if(i<=str.length){
                    urlList.add(str[i-1]);
                }else{
                    urlList.add("http://placehold.it/150x100");
                }
            }
            modelAndView.addObject("urlList",urlList);
            modelAndView.setViewName("decorator/decProcess");
        }else{
            modelAndView.setViewName("common/exception2");
        }

        return modelAndView;
    }

    @GetMapping("/tocheckProcess")
    public ModelAndView tocheckProcess(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",12);

        Process process=processService.queryByClientId(userDto.getId());

        String[] str=new String[4];

        if(process!=null){
            if(process.getPic()!=null){
                str=process.getPic().split("#");
            }
            List<String> urlList2=new ArrayList<>();
            for(int i=1;i<=4;i++){
                if(i<=str.length){
                    urlList2.add(str[i-1]);
                }else{
                    urlList2.add("http://placehold.it/150x100");
                }
            }
            modelAndView.addObject("urlList",urlList2);
            modelAndView.setViewName("client/checkProcess");
        }else{
            modelAndView.setViewName("common/exception");
        }
        return modelAndView;
    }

    @GetMapping("/todetail")
    public ModelAndView todetail(@RequestParam(value = "id") Integer id,HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView mv1 = null;
        try {
            mv1 = new ModelAndView("detail");
            Example example= exampleService.getContent(id);
            mv1.addObject("data",example);
            int[] tmp=application.generateRecommendations(userDto.getId());
            Example example1=exampleService.getContent(tmp[0]);
            mv1.addObject("data1",example1);
            Example example2=exampleService.getContent(tmp[1]);
            mv1.addObject("data2",example2);
            Example example3=exampleService.getContent(tmp[2]);
            mv1.addObject("data3",example3);
            mv1.setViewName("/common/detail");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv1;
    }
    @GetMapping("/todetail2")
    public ModelAndView todetail2(@RequestParam(value = "id") Integer id,HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView mv1 = null;
        try {
            mv1 = new ModelAndView("detail2");
            Decorator decorator= decoratorService.queryDecoratorById(id);
            mv1.addObject("data",decorator);
            mv1.setViewName("/common/detail2");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv1;
    }

    @GetMapping("toaccept")
    public ModelAndView toaccept(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("decorator/accept");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",6);
        return modelAndView;
    }

    @GetMapping("toteamInfo")
    public ModelAndView toteamInfo(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("decorator/teamInfo");
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",5);
        return modelAndView;
    }

    @GetMapping("todesign")
    public ModelAndView todesign(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();

        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",7);
        Process process=processService.queryByDecoratorId1(userDto.getId());
        if(process!=null){
            modelAndView.addObject("clientId",process.getClientId());
            modelAndView.setViewName("decorator/design");
        }else{
            modelAndView.setViewName("common/exception2");
        }
        return modelAndView;
    }

    @GetMapping("tomybill")
    public ModelAndView tomybill(HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        ModelAndView modelAndView=new ModelAndView();
        List<MenuDto> menuDtoList=menuService.queryMenuByRoleId(userDto.getRoleId());
        modelAndView.addObject("menuDtoList",menuDtoList);
        modelAndView.addObject("menuId",13);
        Design design=designService.queryDesignByClientId(userDto.getId());
        if(design!=null){
            modelAndView.addObject("design",design);
            double total=design.getConstructionCost()+design.getFurniture()+design.getMainMaterial()+design.getSoftOutfit();
            modelAndView.addObject("total",total);
            modelAndView.setViewName("client/mybill");
        }else{
            modelAndView.setViewName("common/exception");
        }
        return modelAndView;
    }
}
