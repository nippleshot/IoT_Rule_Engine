package example.data;


import example.Rule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.NotNull;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class  JdbcRuleRepository implements RuleRepository {

    private JdbcOperations jdbc;

    @Autowired
    public JdbcRuleRepository(JdbcOperations jdbc) {
        this.jdbc = jdbc;
    }

    public Rule save(Rule rule) {
        jdbc.update(
                "insert into " +
                        "rule_database (name, rule_type, classroom, " +
                        "cond_low_temp, cond_high_temp, cond_status, cond_lock, " +
                        "is_rule_check, " +
                        "act_projector, act_light, act_ac, act_ac_temp, act_cctv, " +
                        "trans_temp, trans_cctv)" +
                        " values (?, ?, ?, " +
                        "?, ?, ?, ?," +
                        "?," +
                        "?, ?, ?, ?, ?," +
                        "?, ?)",
                rule.getName(), rule.getRule_type(), rule.getClassroom(),
                rule.getCond_low_temp(), rule.getCond_high_temp(), rule.getCond_status(), rule.getCond_lock(),
                rule.isIs_rule_check(),
                rule.isAct_projector(), rule.isAct_light(), rule.isAct_ac(), rule.getAct_ac_temp(), rule.isAct_cctv(),
                rule.isTrans_temp(), rule.isTrans_cctv());
//        System.out.println("========================<Repository.save()>=======================");
//        System.out.println(rule.toString());
//        System.out.println("===============================================");
        return rule; // TODO: Determine value for id
    }

    @Override
    public List<Rule> findRules(long max) {
        return jdbc.query(
                "select id, name, rule_type, classroom, " +
                        "cond_low_temp, cond_high_temp, cond_status, cond_lock, " +
                        "is_rule_check, " +
                        "act_projector, act_light, act_ac, act_ac_temp, act_cctv, " +
                        "trans_temp, trans_cctv" +
                        " from rule_database" +
                        " where id <= ?",
                new RuleRowMapper(), max);
    }

    private static class RuleRowMapper implements RowMapper<Rule> {
        public Rule mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Rule(
                    rs.getLong("id"),
                    rs.getString("name"),
                    rs.getString("rule_type"),
                    rs.getString("classroom"),
                    rs.getInt("cond_low_temp"),
                    rs.getInt("cond_high_temp"),
                    rs.getString("cond_status"),
                    rs.getString("cond_lock"),
                    rs.getBoolean("is_rule_check"),
                    rs.getBoolean("act_projector"),
                    rs.getBoolean("act_light"),
                    rs.getBoolean("act_ac"),
                    rs.getInt("act_ac_temp"),
                    rs.getBoolean("act_cctv"),
                    rs.getBoolean("trans_temp"),
                    rs.getBoolean("trans_cctv"));
        }
    }

    @Override
    public List<Rule> findRulesByTypeAndClassroom(String type, String roomNum){
        return jdbc.query(
                "select id, name, rule_type, classroom, " +
                        "cond_low_temp, cond_high_temp, cond_status, cond_lock, " +
                        "is_rule_check, " +
                        "act_projector, act_light, act_ac, act_ac_temp, act_cctv, " +
                        "trans_temp, trans_cctv" +
                        " from rule_database" +
                        " where rule_type=? and classroom=?",
                new RuleRowMapper(), type, roomNum);
    }

    @Override
    public List<Rule> findRulesByType(String type){
        return jdbc.query(
                "select id, name, rule_type, classroom, " +
                        "cond_low_temp, cond_high_temp, cond_status, cond_lock, " +
                        "is_rule_check, " +
                        "act_projector, act_light, act_ac, act_ac_temp, act_cctv, " +
                        "trans_temp, trans_cctv" +
                        " from rule_database" +
                        " where rule_type = ?",
                new RuleRowMapper(), type);
    }

    @Override
    public List<Rule> findRulesByClassroom(String roomNum){
        return jdbc.query(
                "select id, name, rule_type, classroom, " +
                        "cond_low_temp, cond_high_temp, cond_status, cond_lock, " +
                        "is_rule_check, " +
                        "act_projector, act_light, act_ac, act_ac_temp, act_cctv, " +
                        "trans_temp, trans_cctv" +
                        " from rule_database" +
                        " where classroom = ?",
                new RuleRowMapper(), roomNum);
    }

    @Override
    public void delete(int id){
        String deleteQuery = "delete from rule_database where id = ?";
        jdbc.update(deleteQuery, id);

    }

    @Override
    public void update(int id, boolean changeCheck){
        String updateQuery = "update rule_database set is_rule_check = ? where id = ?";
        jdbc.update(updateQuery,
                changeCheck,
                id);
    }


}