<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<head>
<meta content="text/html; charset=utf-8">
<title>教室设备管理系统 - 规则管理 </title>
<style type="text/css">
    @import url("<c:url value="/resources/ruleList.css" />");
</style>

</head>
<body>
  <div id="wrapper">

          <header>
      			<div class="container">
                    <img src="<c:url value="/resources/nju.png" />" style="float: left; height: 80px; width: 140px; margin-right: -20px">
      				<div id="logo"><a href="<c:url value="/rule/list" />">教室设备管理系统</a></div>
      			</div>
      		</header>


          </br></br></br>

          <div class="container2">
              <div id="wrapper2">
                  <div class="equipo-item" style="min-width: 90%;">

                            <h2 class="titulo-equipo" style="color:#424894;"> 规则管理 </h2>
                            </br>

                            <h3 class="titulo-equipo" style="margin-left: 3%;"> 搜索结果 </h3>
                      <button type="button" style="margin-left:3%;height: 30px;width: 60px;border-radius: 15px; color: white; background-color: brown; border: none" onclick="location.href='<c:url value="/rule/list" />'"><strong>返回</strong></button>
                            <br/><br/>
                            <table class="equipo-image" style="width: 93%;">
                                  <thead>
                                    <tr>
                                      <th> 编号</th>
                                      <th style="color:#424894;">规则名称</th>
                                      <th style="color:#424894;">类型</th>
                                      <th style="color:#424894;">条件</th>
                                      <th style="color:#424894;">动作</th>
                                      <th style="color:#424894;">操作</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <c:forEach items="${ruleList}" var="rule" >
                                            <tr>
                                                  <td><c:out value="${rule.id}" /></td>

                                                  <td><c:out value="${rule.name}" /></td>

                                                    <c:choose>
                                                        <c:when test="${rule.rule_type eq 'act'}">
                                                            <td><strong style="color: goldenrod">设备联动</strong></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><strong style="color: mediumpurple">转发</strong></td>
                                                        </c:otherwise>
                                                    </c:choose>


                                                  <td>
                                                    <p>教室号 ： <c:out value="${rule.classroom}" /> </p>
                                                    <c:choose>
                                                          <c:when test="${rule.cond_low_temp eq 0 && rule.cond_high_temp eq 100}">
                                                              <p>教室温度 ： 无关</p>
                                                          </c:when>
                                                          <c:when test="${rule.cond_low_temp ne 0 && rule.cond_high_temp eq 100}">
                                                              <p>教室温度 ： <c:out value="${rule.cond_low_temp}" /> 度以上</p>
                                                          </c:when>
                                                          <c:when test="${rule.cond_low_temp eq 0 && rule.cond_high_temp ne 100}">
                                                              <p>教室温度 ： <c:out value="${rule.cond_high_temp}" /> 度以下</p>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <p>教室温度 ： <c:out value="${rule.cond_low_temp}" />度 ~ <c:out value="${rule.cond_high_temp}" />度</p>
                                                          </c:otherwise>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${rule.cond_status eq 'class_start'}">
                                                            <p>教室状态 ： 上课</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_status eq 'class_done'}">
                                                            <p>教室状态 ： 下课</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_status eq 'self_study'}">
                                                            <p>教室状态 ： 自习</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_status eq 'non'}">
                                                            <p>教室状态 ： 无关</p>
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${rule.cond_lock eq 'lock'}">
                                                            <p>门锁状态 ： 关</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_lock eq 'unlock'}">
                                                            <p>门锁状态 ： 开</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_lock eq 'non'}">
                                                            <p>门锁状态 ： 无关</p>
                                                        </c:when>
                                                    </c:choose>
                                                  </td>

                                                  <td>
                                                      <c:choose>
                                                          <c:when test="${rule.rule_type eq 'act'}">
                                                              <c:choose>
                                                                  <c:when test="${rule.act_projector eq true}">
                                                                      <p>投影仪 ： 开</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>投影仪 ： 关</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.act_light eq true}">
                                                                      <p>照明 ： 开</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>照明 ： 关</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.act_ac eq true}">
                                                                      <p>空调 ： 开 （<c:out value="${rule.act_ac_temp}" />度）</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>空调 ： 关</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.act_cctv eq true}">
                                                                      <p>监控摄像头 ： 开</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>监控摄像头 ： 关</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <c:choose>
                                                                  <c:when test="${rule.trans_temp eq true}">
                                                                      <p>空调开关，现在温度 ： 包括</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>空调开关，现在温度 ： 不包括</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.trans_cctv eq true}">
                                                                      <p>监控摄像头视频 ： 包括</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>监控摄像头视频 ： 不包括</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                          </c:otherwise>
                                                      </c:choose>
                                                  </td>

                                                  <td>
                                                    <div>
                                                        <c:choose>
                                                            <c:when test="${rule.is_rule_check eq true}">
                                                                <form method="post" action="/iot/rule/list/search/change?checkId=${rule.id}&fixTo=false">
                                                                    <input type="hidden" value="<c:out value="${ruleType}" />" name="ruleType">
                                                                    <input type="hidden" value="<c:out value="${classNum}" />" name="classNum">
                                                                    <button type="submit"  style="background-color:darkgreen; border-radius: 15px; border: none; color:white">运行状态</button>
                                                                </form>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <form method="post" action="/iot/rule/list/search/change?checkId=${rule.id}&fixTo=true">
                                                                    <input type="hidden" value="<c:out value="${ruleType}" />" name="ruleType">
                                                                    <input type="hidden" value="<c:out value="${classNum}" />" name="classNum">
                                                                    <button type="submit" style="background-color:orangered; border-radius: 15px; border: none; color:white">运行状态</button>
                                                                </form>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <br/>
                                                      <form method="post" action="/iot/rule/list/search/delete?deleteId=${rule.id}">
                                                          <input type="hidden" value="<c:out value="${ruleType}" />" name="ruleType">
                                                          <input type="hidden" value="<c:out value="${classNum}" />" name="classNum">
                                                        <button type="submit" style="border: black;">删掉</button>
                                                      </form>
                                                  </td>

                                            </tr>
                                    </c:forEach>
                                  </tbody>
                            </table>
                     </div>
                </div>
          </div>

 </div>

</body>

</html>
