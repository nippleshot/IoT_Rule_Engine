package example.data;

import example.Rule;

import java.util.List;

public interface RuleRepository {

    Rule save(Rule rule);

    List<Rule> findRules(long max);

    List<Rule> findRulesByTypeAndClassroom(String type, String roomNum);

    List<Rule> findRulesByType(String type);

    List<Rule> findRulesByClassroom(String roomNum);

    void delete(int id);

    void update(int id, boolean changeCheck);
}
