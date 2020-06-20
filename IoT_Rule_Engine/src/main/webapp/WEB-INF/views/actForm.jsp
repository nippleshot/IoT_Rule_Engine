<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<head>
<meta content="text/html; charset=utf-8">
<title>创建设备联动规则</title>
<style type="text/css">
    @import url("<c:url value="/resources/actForm.css" />");
</style>


</head>
<body>
  <div id="wapper">

          <header>
      			<div class="container">
                    <img src="<c:url value="/resources/nju.png" />" style="float: left; height: 80px; width: 140px; margin-right: -20px">
                    <div id="logo"><a href="<c:url value="/rule/list" />">教室设备管理系统</a></div>
      			</div>
      		</header>


          <div class="loginbox">
              <h1>创建新规则</h1>
                <sf:form method="POST" commandName="rule" >
                        <p>规则名称</p>
                        <sf:input path="name" type="text"/>
                        <p>类型</p>
                        <sf:select path="rule_type">
                            <sf:option value="act">设备联动</sf:option>
                            <sf:option value="trans" disabled="true">转发</sf:option>
                        </sf:select>

                        <p>教室号</p>
                        <sf:input path="classroom" type="text"/>
                        </br>
                        <p>条件</p>
                        <table class="equipo-image">
                                <tr>
                                  <td>教室温度</td>
                                  <td>
                                    <br/>
                                      <sf:input path="cond_low_temp" style="width:100px; margin-left:35%;" value="0" />&ensp; 度以上
                                    <br/>
                                      <sf:input path="cond_high_temp" style="width:100px; margin-left:35%; margin-bottom:3%;" value="100"/>&ensp; 度以下
                                      <br/>
                                  </td>
                                </tr>
                                <tr>
                                  <td>教室状态</td>
                                  <td colspan="2">

                                          <div class="toggle_radio">
                                              <sf:radiobutton path="cond_status" value="class_start" class="toggle_option" id="first_toggle" name="toggle_option"/>
                                              <sf:radiobutton path="cond_status" value="class_done" class="toggle_option" id="second_toggle" name="toggle_option"/>
                                              <sf:radiobutton path="cond_status" value="self_study" class="toggle_option" id="third_toggle" name="toggle_option"/>
                                              <sf:radiobutton path="cond_status" value="non" class="toggle_option" id="forth_toggle" name="toggle_option" checked="true"/>
                                            <label for="first_toggle"><p>上课</p></label>
                                            <label for="second_toggle"><p>下课</p></label>
                                            <label for="third_toggle"><p>自习</p></label>
                                            <label for="forth_toggle"><p>无关</p></label>
                                            <div class="toggle_option_slider"></div>
                                          </div>

                                  </td>
                                </tr>
                                <tr>
                                  <td>门锁状态</td>
                                  <td colspan="2">
                                          <div class="toggle_radio2">
                                              <sf:radiobutton path="cond_lock" value="unlock" class="toggle_option2" id="first_toggle2" name="toggle_option2"/>
                                              <sf:radiobutton path="cond_lock" value="lock" class="toggle_option2" id="second_toggle2" name="toggle_option2"/>
                                              <sf:radiobutton path="cond_lock" value="non" class="toggle_option2" id="third_toggle2" name="toggle_option2" checked="true"/>
                                            <label for="first_toggle2"><p>开</p></label>
                                            <label for="second_toggle2"><p>关</p></label>
                                            <label for="third_toggle2"><p>无关</p></label>
                                            <div class="toggle_option_slider2"></div>
                                          </div>
                                  </td>
                                </tr>
                        </table>

                      </br>
                      </br>
                      <p>动作</p>
                      <table class="equipo-image">
                              <tr>
                                <td>空调</td>
                                <td>
                                    <sf:input path="act_ac_temp" style="width:100px; margin-left:25%;" value="0" /> 度
                                  <div class="toggle_radio6">
                                      <sf:radiobutton path="act_ac" value="true" class="toggle_option6" id="first_toggle6" name="toggle_option6"/>
                                      <sf:radiobutton path="act_ac" value="false" class="toggle_option6" id="second_toggle6" name="toggle_option6" checked="true"/>
                                    <label for="first_toggle6"><p>开</p></label>
                                    <label for="second_toggle6"><p>关</p></label>
                                    <div class="toggle_option_slider6"></div>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>投影仪</td>
                                <td colspan="2">
                                        <div class="toggle_radio3">
                                            <sf:radiobutton path="act_projector" value="true" class="toggle_option3" id="first_toggle3" name="toggle_option3"/>
                                            <sf:radiobutton path="act_projector" value="false" class="toggle_option3" id="second_toggle3" name="toggle_option3" checked="true"/>
                                          <label for="first_toggle3"><p>开</p></label>
                                          <label for="second_toggle3"><p>关</p></label>
                                          <div class="toggle_option_slider3"></div>
                                        </div>
                                </td>
                              </tr>
                              <tr>
                                <td>照明</td>
                                <td colspan="2">
                                        <div class="toggle_radio4">
                                            <sf:radiobutton path="act_light" value="true" class="toggle_option4" id="first_toggle4" name="toggle_option4"/>
                                            <sf:radiobutton path="act_light" value="false" class="toggle_option4" id="second_toggle4" name="toggle_option4" checked="true"/>
                                          <label for="first_toggle4"><p>开</p></label>
                                          <label for="second_toggle4"><p>关</p></label>
                                          <div class="toggle_option_slider4"></div>
                                        </div>
                                </td>
                              </tr>
                              <tr>
                                <td>监控摄像头</td>
                                <td colspan="2">
                                        <div class="toggle_radio5">
                                            <sf:radiobutton path="act_cctv" value="true" class="toggle_option5" id="first_toggle5" name="toggle_option5"/>
                                            <sf:radiobutton path="act_cctv" value="false" class="toggle_option5" id="second_toggle5" name="toggle_option5" checked="true"/>
                                          <label for="first_toggle5"><p>开</p></label>
                                          <label for="second_toggle5"><p>关</p></label>
                                          <div class="toggle_option_slider5"></div>
                                        </div>
                                </td>
                              </tr>
                      </table>
                      <br/><br/>
                        <sf:input path="is_rule_check" value="true" type="hidden"/>

                      <input type="submit" value="完成">
                </sf:form>
            </div>




 </div>

</body>
</html>
