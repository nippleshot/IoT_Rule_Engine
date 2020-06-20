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

                            <h3 class="titulo-equipo" style="margin-left: 3%;"> 所有规则 </h3>
                              <div>
                                     <div style="float:right; margin-right: 65%;">
                                         <form method="get" action="/iot/rule/list/search">
                                              <p>
                                                  类型 ：
                                                  <select name="ruleType">
                                                      <option value="-"> - - </option>
                                                      <option value="trans"> 转发 </option>
                                                      <option value="act"> 设备联动 </option>
                                                  </select>
                                                  &nbsp; 教室号 ：
                                                  <input type="text" value="-" name="classNum"/>
                                                  &nbsp;
                                                  <button type="submit">搜索</button>
                                              </p>
                                         </form>
                                      </div>
                                    <div style="float:right; margin-right: 39%;">
                                        <div>
                                            <button type="button" style="float:right; height: 35px;border-radius: 15px; color: white; background-color: goldenrod; border: none" onclick="location.href='<c:url value="/rule/createAct" />'">创建设备联动规则</button>
                                            <button type="button" style="float:right; height: 35px;border-radius: 15px; color: white; margin-right: 10px; background-color: mediumpurple; border: none" onclick="location.href='<c:url value="/rule/createTrans" />'">创建转发规则</button>
                                        </div>
                                        <br/><br/><br/>
                                    </div>
                              </div>
                            <table class="equipo-image">
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
                                                                <form method="post" action="/iot/rule/list/change?checkId=${rule.id}&fixTo=false">
                                                                    <button type="submit"  style="background-color:darkgreen; border-radius: 15px; border: none; color:white">运行状态</button>
                                                                </form>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <form method="post" action="/iot/rule/list/change?checkId=${rule.id}&fixTo=true">
                                                                    <button type="submit" style="background-color:orangered; border-radius: 15px; border: none; color:white">运行状态</button>
                                                                </form>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <br/>
                                                      <form method="post" action="/iot/rule/list?deleteId=${rule.id}">
                                                        <button type="submit" style="border: black;">删掉</button>
                                                      </form>
                                                  </td>

                                            </tr>
                                    </c:forEach>
                                  </tbody>
                            </table>
                            <div id="logBox">
                              <textarea placeholder="<c:out value="${myLog}" />" readonly style="width:100%; height:500px"></textarea>
                            </div>
                     </div>
                </div>
          </div>

          <br/><br/><br/><br/>

          <div class="container2">
            <div id="wrapper2">
              <div class="equipo-item" style="min-width: 90%;">
                <h2 class="titulo-equipo" style="color:black;"> 模拟教室 </h2>
                  <div style="float: left; margin-left: 10px">
                      <form method="post" action="/iot/rule/list/run?roomNum=1">
                          <p> <strong>教室号 :</strong> Room222 </p>
                          <p>  <strong>教室状态 :</strong> 下课 </p>
                          <p>   <strong>门锁状态 :</strong> 关门 </p>
                          <p>   <strong>现在教室温度 :</strong> 24度 </p>
                          <br/>
                          <input type="submit" style="width:150px" name="" value="发送'Room222'信息">
                      </form>
                  </div>
                  <div style="float: left; margin-left: 40px">
                      <form method="post" action="/iot/rule/list/run?roomNum=2">
                          <p> <strong>教室号 :</strong> Room223 </p>
                          <p>  <strong>教室状态 :</strong> 上课 </p>
                          <p>   <strong>门锁状态 :</strong> 开门 </p>
                          <p>   <strong>现在教室温度 :</strong> 28度 </p>
                          <br/>
                          <input type="submit" style="width:150px" name="" value="发送'Room223'信息">
                      </form>
                  </div>
                  <div style="float: left; margin-left: 40px">
                      <form method="post" action="/iot/rule/list/run?roomNum=3">
                          <p> <strong>教室号 :</strong> Room224 </p>
                          <p>  <strong>教室状态 :</strong> 自习 </p>
                          <p>   <strong>门锁状态 :</strong> 开门 </p>
                          <p>   <strong>现在教室温度 :</strong> 25度 </p>
                          <br/>
                          <input type="submit" style="width:150px" name="" value="发送'Room224'信息">
                      </form>
                  </div>


              </div>
            </div>
          </div>


 </div>

</body>

</html>
