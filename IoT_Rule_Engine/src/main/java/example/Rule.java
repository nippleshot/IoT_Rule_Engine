package example;

import java.util.Date;

public class Rule {
    private Long id;
    private String name;
    private String rule_type; //{"trans", "act"}
    private String classroom;

    private int cond_low_temp;
    private int cond_high_temp;
    private String cond_status; //{"class_start", "class_done", "self_study"， "non"}
    private String cond_lock; //{"lock", "unlock", "non"}

    private boolean is_rule_check = true;

    // 데이터 베이스에 안들어감
    private boolean cond_checker = false;

    private boolean act_projector = false;
    private boolean act_light = false;
    private boolean act_ac = false;
    private int act_ac_temp = 0;
    private boolean act_cctv = false;

    private boolean trans_temp = false;
    private boolean trans_cctv = false;


    public Rule(Long id, String name, String rule_type, String classroom, int cond_low_temp, int cond_high_temp, String cond_status, String cond_lock, boolean is_rule_check, boolean act_projector, boolean act_light, boolean act_ac, int act_ac_temp, boolean act_cctv, boolean trans_temp, boolean trans_cctv) {
        this.id = id;
        this.name = name;
        this.rule_type = rule_type;
        this.classroom = classroom;
        this.cond_low_temp = cond_low_temp;
        this.cond_high_temp = cond_high_temp;
        this.cond_status = cond_status;
        this.cond_lock = cond_lock;
        this.is_rule_check = is_rule_check;
        this.act_projector = act_projector;
        this.act_light = act_light;
        this.act_ac = act_ac;
        this.act_ac_temp = act_ac_temp;
        this.act_cctv = act_cctv;
        this.trans_temp = trans_temp;
        this.trans_cctv = trans_cctv;
    }



    public Rule() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIs_rule_check() {
        return is_rule_check;
    }

    public void setIs_rule_check(boolean is_rule_check) {
        this.is_rule_check = is_rule_check;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public void setCond_low_temp(int cond_low_temp) {
        this.cond_low_temp = cond_low_temp;
    }

    public void setCond_high_temp(int cond_high_temp) {
        this.cond_high_temp = cond_high_temp;
    }

    public void setCond_status(String cond_status) {
        this.cond_status = cond_status;
    }

    public void setCond_lock(String cond_lock) {
        this.cond_lock = cond_lock;
    }

    public void setCond_checker(boolean cond_checker) {
        this.cond_checker = cond_checker;
    }

    public void setAct_projector(boolean act_projector) {
        this.act_projector = act_projector;
    }

    public void setAct_light(boolean act_light) {
        this.act_light = act_light;
    }

    public void setAct_ac(boolean act_ac) {
        this.act_ac = act_ac;
    }

    public void setAct_ac_temp(int act_ac_temp) {
        this.act_ac_temp = act_ac_temp;
    }

    public void setAct_cctv(boolean act_cctv) {
        this.act_cctv = act_cctv;
    }

    public void setTrans_temp(boolean trans_temp) {
        this.trans_temp = trans_temp;
    }

    public void setTrans_cctv(boolean trans_cctv) {
        this.trans_cctv = trans_cctv;
    }

    public String getName() {
        return name;
    }


    public String getClassroom() {
        return classroom;
    }

    public int getCond_low_temp() {
        return cond_low_temp;
    }

    public int getCond_high_temp() {
        return cond_high_temp;
    }

    public String getCond_status() {
        return cond_status;
    }

    public String getCond_lock() {
        return cond_lock;
    }

    public boolean isAct_projector() {
        return act_projector;
    }

    public boolean isAct_light() {
        return act_light;
    }

    public boolean isAct_ac() {
        return act_ac;
    }

    public int getAct_ac_temp() {
        return act_ac_temp;
    }

    public boolean isAct_cctv() {
        return act_cctv;
    }

    public boolean isTrans_temp() {
        return trans_temp;
    }

    public boolean isTrans_cctv() {
        return trans_cctv;
    }

    public String getRule_type() {
        return rule_type;
    }

    public void setRule_type(String rule_type) {
        this.rule_type = rule_type;
    }



    @Override
    public String toString() {
        return "Rule{" + "\n" +
                "id=" + id + "\n" +
                ", name='" + name + '\'' + "\n" +
                ", rule_type='" + rule_type + '\'' + "\n" +
                ", classroom='" + classroom + '\'' + "\n" +
                ", cond_low_temp=" + cond_low_temp + "\n" +
                ", cond_high_temp=" + cond_high_temp + "\n" +
                ", cond_status='" + cond_status + '\'' + "\n" +
                ", cond_lock='" + cond_lock + '\'' + "\n" +
                ", is_rule_check=" + is_rule_check + "\n" +
                ", cond_checker=" + cond_checker + "\n" +
                ", act_projector=" + act_projector + "\n" +
                ", act_light=" + act_light + "\n" +
                ", act_ac=" + act_ac + "\n" +
                ", act_ac_temp=" + act_ac_temp + "\n" +
                ", act_cctv=" + act_cctv + "\n" +
                ", trans_temp=" + trans_temp + "\n" +
                ", trans_cctv=" + trans_cctv +
                '}';
    }

}