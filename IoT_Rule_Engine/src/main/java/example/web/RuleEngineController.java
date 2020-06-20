package example.web;


import com.sun.org.apache.bcel.internal.util.ClassQueue;
import example.Classroom;
import example.Rule;
import example.data.RuleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping("/rule")
public class RuleEngineController {

    private static final String MAX_LONG_AS_STRING = "10000000000";

    private RuleRepository ruleRepository;
    private String resultLog = "";


    @Autowired
    public RuleEngineController(RuleRepository ruleRepository) {
        this.ruleRepository = ruleRepository;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String rules(@RequestParam(value = "max", defaultValue = MAX_LONG_AS_STRING) long max, Model model) {
        model.addAttribute(ruleRepository.findRules(max));
        model.addAttribute(new Classroom());
        model.addAttribute("myLog", resultLog);

        return "ruleList";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String deleteRule(@RequestParam(value ="deleteId") int id) {
        ruleRepository.delete(id);
        return "redirect:/rule/list";
    }


    @RequestMapping(value = "/list/search", method = RequestMethod.GET)
    public String searchRule(HttpServletRequest request, Model model) {
        String rule_type = request.getParameter("ruleType");
        String class_num = request.getParameter("classNum");

        if(rule_type.equals("-")){
            model.addAttribute(ruleRepository.findRulesByClassroom(class_num));
        }else if(class_num.equals("-")){
            model.addAttribute(ruleRepository.findRulesByType(rule_type));
        }else{
            model.addAttribute(ruleRepository.findRulesByTypeAndClassroom(rule_type, class_num));
        }

        model.addAttribute("ruleType", rule_type);
        model.addAttribute("classNum", class_num);
        return "resultList";
    }

    @RequestMapping(value = "/list/search/delete", method = RequestMethod.POST)
    public String searchDeleteRule(@RequestParam(value ="deleteId") int id, HttpServletRequest request, RedirectAttributes redirect) {
        ruleRepository.delete(id);
        redirect.addAttribute("ruleType", request.getParameter("ruleType"));
        redirect.addAttribute("classNum", request.getParameter("classNum"));
        return "redirect:/rule/list/search";
    }

    @RequestMapping(value = "/list/search/change", method = RequestMethod.POST)
    public String searchChangeRuleCheck(@RequestParam(value ="checkId") int id, @RequestParam(value ="fixTo") boolean fixCheck, HttpServletRequest request, RedirectAttributes redirect) {
        ruleRepository.update(id, fixCheck);
        redirect.addAttribute("ruleType", request.getParameter("ruleType"));
        redirect.addAttribute("classNum", request.getParameter("classNum"));
        return "redirect:/rule/list/search";
    }

    @RequestMapping(value = "/list/change", method = RequestMethod.POST)
    public String changeRuleCheck(@RequestParam(value ="checkId") int id, @RequestParam(value ="fixTo") boolean fixCheck) {
        ruleRepository.update(id, fixCheck);
        return "redirect:/rule/list";
    }

    @RequestMapping(value = "/list/run", method = RequestMethod.POST)
    public String sendClassInfo(@RequestParam(value ="roomNum") int classNum){
        Classroom classroom = new Classroom();
        if(classNum==1){
            classroom.setRoomNum("Room222");
            classroom.setStatus("class_done");
            classroom.setDoor_lock("lock");
            classroom.setCurrent_temp(24);
        }else if(classNum==2){
            classroom.setRoomNum("Room223");
            classroom.setStatus("class_start");
            classroom.setDoor_lock("unlock");
            classroom.setCurrent_temp(28);
        }else if(classNum==3){
            classroom.setRoomNum("Room224");
            classroom.setStatus("self_study");
            classroom.setDoor_lock("unlock");
            classroom.setCurrent_temp(25);
        }

        List<Rule> allRules = ruleRepository.findRules(1000000);
        RuleEngine engine = new RuleEngine(allRules);
        resultLog = resultLog + engine.run(classroom);
        resultLog = resultLog + "------------------------------------------------\n";

        return "redirect:/rule/list";
    }

    @RequestMapping(value = "/createTrans", method = GET)
    public String showTransRegistrationForm(Model model) {
        model.addAttribute(new Rule());
        return "transForm";
    }

    @RequestMapping(value = "/createTrans", method = RequestMethod.POST)
    public String saveTransRule(Rule rule, Errors errors) throws Exception {
//        System.out.println("======================<Controller.saveTransRule()>=========================");
//        System.out.println(rule.toString());
//        System.out.println("===============================================");

        if (errors.hasErrors()) {
            return "transForm";
        }
        ruleRepository.save(rule);
        return "redirect:/rule/list";
    }

    @RequestMapping(value = "/createAct", method = GET)
    public String showActRegistrationForm(Model model) {
        model.addAttribute(new Rule());
        return "actForm";
    }


    @RequestMapping(value = "/createAct", method = RequestMethod.POST)
    public String saveActRule(Rule rule, Errors errors) throws Exception {

        if (errors.hasErrors()) {
            return "actForm";
        }
        ruleRepository.save(rule);
        return "redirect:/rule/list";
    }





}