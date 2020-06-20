package example.web;

import example.Classroom;
import example.Rule;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class RuleEngine {
    private List<Rule> rules;
    private String logBuilder = "";

    @Autowired
    public RuleEngine(List<Rule> rules) {
        this.rules = rules;

    }

    public String run(Classroom classInfo){
        for(int i=0; i<this.rules.size(); i++){
            //System.out.println("rule["+i+"] is running");
            logBuilder = logBuilder + checkCondition(classInfo, rules.get(i));
        }

        return logBuilder;
    }

    private String checkCondition(Classroom room, Rule rule){
        //System.out.println("start checking rule");
        SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm", Locale.CHINA );
        Date currentTime = new Date ( );
        String current_time = formatter.format ( currentTime );

        if(rule.isIs_rule_check()){
            if( rule.getCond_low_temp() < room.getCurrent_temp()
                    && rule.getCond_high_temp() > room.getCurrent_temp()
                    && rule.getCond_status().equals(room.getStatus())
                    && rule.getCond_lock().equals(room.getDoor_lock())
                    && rule.getClassroom().equals(room.getRoomNum()))
            {
                return action(rule);
            }else if(rule.getCond_low_temp() < room.getCurrent_temp()
                    && rule.getCond_high_temp() > room.getCurrent_temp()
                    && rule.getCond_status().equals("non")
                    && rule.getCond_lock().equals(room.getDoor_lock())
                    && rule.getClassroom().equals(room.getRoomNum()))
            {
                return action(rule);
            }else if(rule.getCond_low_temp() < room.getCurrent_temp()
                    && rule.getCond_high_temp() > room.getCurrent_temp()
                    && rule.getCond_status().equals(room.getStatus())
                    && rule.getCond_lock().equals("non")
                    && rule.getClassroom().equals(room.getRoomNum()))
            {
                return action(rule);
            }else if(rule.getCond_low_temp() < room.getCurrent_temp()
                    && rule.getCond_high_temp() > room.getCurrent_temp()
                    && rule.getCond_status().equals("non")
                    && rule.getCond_lock().equals("non")
                    && rule.getClassroom().equals(room.getRoomNum()))
            {
                return action(rule);
            }else{
                return current_time +" : 不符合 ("+rule.getName()+") 条件\n";
            }
        }else{
            return "\n";
        }
    }

    private String action(Rule rule){

            String msg;

            SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm", Locale.CHINA );
            Date currentTime = new Date ( );
            String current_time = formatter.format ( currentTime );

            msg = current_time +" : 符合 ("+rule.getName()+") 条件\n";
            if(rule.getRule_type().equals("trans")) {
                String temp = (rule.isTrans_temp()) ? "\t转发 (" : "\t不转发 (";
                String video = (rule.isTrans_cctv()) ? "\t转发 (" : "\t不转发 (";

                msg = msg +
                        temp + rule.getClassroom()+") 空调开关情况，现在温度\n" +
                        video + rule.getClassroom()+") 监控摄像头视频\n";

            }else{
                String ac = (rule.isAct_ac()) ? "开" : "关";
                String light = (rule.isAct_light()) ? "开" : "关";
                String projector = (rule.isAct_projector()) ? "开" : "关";
                String cctv = (rule.isAct_cctv()) ? "开" : "关";
                if(rule.isAct_ac()){
                    ac = ac + "("+rule.getAct_ac_temp()+"度)";
                }

                msg = msg +
                        "\t"+rule.getClassroom()+" 投影仪 ： "+projector+"\n" +
                        "\t"+rule.getClassroom()+" 照明 ： "+light+"\n" +
                        "\t"+rule.getClassroom()+" 空调 ： "+ac+"\n" +
                        "\t"+rule.getClassroom()+" 监控摄像头 ： "+cctv+"\n";

            }

        return msg;
    }
}
