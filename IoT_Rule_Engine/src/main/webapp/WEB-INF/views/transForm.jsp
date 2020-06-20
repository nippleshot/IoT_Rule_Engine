<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<head>
<meta content="text/html; charset=utf-8">
<title>����ת������</title>
<style type="text/css">
    @import url("<c:url value="/resources/transForm.css" />");
</style>


</head>
<body>
  <div id="wapper">

          <header>
      			<div class="container">
                    <img src="<c:url value="/resources/nju.png" />" style="float: left; height: 80px; width: 140px; margin-right: -20px">
                    <div id="logo"><a href="<c:url value="/rule/list" />">�����豸����ϵͳ</a></div>
      			</div>
      		</header>


          <div class="loginbox">
              <h1>�����¹���</h1>
                <sf:form method="POST" commandName="rule" >
                            <p>��������</p>
                            <sf:input path="name" type="text"/>
                            <p>����</p>
                            <sf:select path="rule_type">
                                <sf:option value="trans" >ת��</sf:option>
                                <sf:option value="act" disabled="true">�豸����</sf:option>
                            </sf:select>

                            <p>���Һ�</p>
                            <sf:input path="classroom" type="text"/>
                            </br>
                            <p>����</p>
                            <table class="equipo-image">
                                <tr>
                                    <td>�����¶�</td>
                                    <td>
                                        <br/>
                                            <sf:input path="cond_low_temp" style="width:100px; margin-left:35%;" value="0" />&ensp; ������
                                        <br/>
                                            <sf:input path="cond_high_temp" style="width:100px; margin-left:35%; margin-bottom:3%;" value="100"/>&ensp; ������
                                    </td>
                                </tr>
                                <tr>
                                    <td>����״̬</td>
                                    <td colspan="2">

                                        <div class="toggle_radio">
                                            <sf:radiobutton path="cond_status" value="class_start" class="toggle_option" id="first_toggle" name="toggle_option"/>
                                            <sf:radiobutton path="cond_status" value="class_done" class="toggle_option" id="second_toggle" name="toggle_option"/>
                                            <sf:radiobutton path="cond_status" value="self_study" class="toggle_option" id="third_toggle" name="toggle_option"/>
                                            <sf:radiobutton path="cond_status" value="non" class="toggle_option" id="forth_toggle" name="toggle_option" checked="true"/>
                                            <label for="first_toggle"><p>�Ͽ�</p></label>
                                            <label for="second_toggle"><p>�¿�</p></label>
                                            <label for="third_toggle"><p>��ϰ</p></label>
                                            <label for="forth_toggle"><p>�޹�</p></label>
                                            <div class="toggle_option_slider"></div>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td>����״̬</td>
                                    <td colspan="2">
                                        <div class="toggle_radio2">
                                            <sf:radiobutton path="cond_lock" value="unlock" class="toggle_option2" id="first_toggle2" name="toggle_option2"/>
                                            <sf:radiobutton path="cond_lock" value="lock" class="toggle_option2" id="second_toggle2" name="toggle_option2"/>
                                            <sf:radiobutton path="cond_lock" value="non" class="toggle_option2" id="third_toggle2" name="toggle_option2" checked="true"/>
                                            <label for="first_toggle2"><p>��</p></label>
                                            <label for="second_toggle2"><p>��</p></label>
                                            <label for="third_toggle2"><p>�޹�</p></label>
                                            <div class="toggle_option_slider2"></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                          </br>
                          </br>
                          <p>ת������</p>
                          <table class="equipo-image">
                                  <tr>
                                    <td>�յ���������������¶�</td>
                                    <td>
                                      <div class="toggle_radio6">
                                          <sf:radiobutton path="trans_temp" value="true" class="toggle_option6" id="first_toggle6" name="toggle_option6"/>
                                          <sf:radiobutton path="trans_temp" value="false" class="toggle_option6" id="second_toggle6" name="toggle_option6" checked="true"/>
                                        <label for="first_toggle6"><p>����</p></label>
                                        <label for="second_toggle6"><p>������</p></label>
                                        <div class="toggle_option_slider6"></div>
                                      </div>
                                    </td>
                                  </tr>

                                  <tr>
                                    <td>�������ͷ��Ƶ</td>
                                    <td colspan="2">
                                            <div class="toggle_radio5">
                                                <sf:radiobutton path="trans_cctv" value="true" class="toggle_option5" id="first_toggle5" name="toggle_option5"/>
                                                <sf:radiobutton path="trans_cctv" value="false" class="toggle_option5" id="second_toggle5" name="toggle_option5" checked="true"/>
                                              <label for="first_toggle5"><p>����</p></label>
                                              <label for="second_toggle5"><p>������</p></label>
                                              <div class="toggle_option_slider5"></div>
                                            </div>
                                    </td>
                                  </tr>
                          </table>
                          <br/><br/>
                            <sf:input path="is_rule_check" value="true" type="hidden"/>

                          <input type="submit" value="���">

                 </sf:form>
            </div>




 </div>

</body>
</html>
