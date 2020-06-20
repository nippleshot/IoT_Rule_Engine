<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<head>
<meta content="text/html; charset=utf-8">
<title>�����豸����ϵͳ - ������� </title>
<style type="text/css">
    @import url("<c:url value="/resources/ruleList.css" />");
</style>

</head>
<body>
  <div id="wrapper">

          <header>
      			<div class="container">
                    <img src="<c:url value="/resources/nju.png" />" style="float: left; height: 80px; width: 140px; margin-right: -20px">
      				<div id="logo"><a href="<c:url value="/rule/list" />">�����豸����ϵͳ</a></div>
      			</div>
      		</header>


          </br></br></br>

          <div class="container2">
              <div id="wrapper2">
                  <div class="equipo-item" style="min-width: 90%;">

                            <h2 class="titulo-equipo" style="color:#424894;"> ������� </h2>
                            </br>

                            <h3 class="titulo-equipo" style="margin-left: 3%;"> ������� </h3>
                      <button type="button" style="margin-left:3%;height: 30px;width: 60px;border-radius: 15px; color: white; background-color: brown; border: none" onclick="location.href='<c:url value="/rule/list" />'"><strong>����</strong></button>
                            <br/><br/>
                            <table class="equipo-image" style="width: 93%;">
                                  <thead>
                                    <tr>
                                      <th> ���</th>
                                      <th style="color:#424894;">��������</th>
                                      <th style="color:#424894;">����</th>
                                      <th style="color:#424894;">����</th>
                                      <th style="color:#424894;">����</th>
                                      <th style="color:#424894;">����</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <c:forEach items="${ruleList}" var="rule" >
                                            <tr>
                                                  <td><c:out value="${rule.id}" /></td>

                                                  <td><c:out value="${rule.name}" /></td>

                                                    <c:choose>
                                                        <c:when test="${rule.rule_type eq 'act'}">
                                                            <td><strong style="color: goldenrod">�豸����</strong></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><strong style="color: mediumpurple">ת��</strong></td>
                                                        </c:otherwise>
                                                    </c:choose>


                                                  <td>
                                                    <p>���Һ� �� <c:out value="${rule.classroom}" /> </p>
                                                    <c:choose>
                                                          <c:when test="${rule.cond_low_temp eq 0 && rule.cond_high_temp eq 100}">
                                                              <p>�����¶� �� �޹�</p>
                                                          </c:when>
                                                          <c:when test="${rule.cond_low_temp ne 0 && rule.cond_high_temp eq 100}">
                                                              <p>�����¶� �� <c:out value="${rule.cond_low_temp}" /> ������</p>
                                                          </c:when>
                                                          <c:when test="${rule.cond_low_temp eq 0 && rule.cond_high_temp ne 100}">
                                                              <p>�����¶� �� <c:out value="${rule.cond_high_temp}" /> ������</p>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <p>�����¶� �� <c:out value="${rule.cond_low_temp}" />�� ~ <c:out value="${rule.cond_high_temp}" />��</p>
                                                          </c:otherwise>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${rule.cond_status eq 'class_start'}">
                                                            <p>����״̬ �� �Ͽ�</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_status eq 'class_done'}">
                                                            <p>����״̬ �� �¿�</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_status eq 'self_study'}">
                                                            <p>����״̬ �� ��ϰ</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_status eq 'non'}">
                                                            <p>����״̬ �� �޹�</p>
                                                        </c:when>
                                                    </c:choose>

                                                    <c:choose>
                                                        <c:when test="${rule.cond_lock eq 'lock'}">
                                                            <p>����״̬ �� ��</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_lock eq 'unlock'}">
                                                            <p>����״̬ �� ��</p>
                                                        </c:when>
                                                        <c:when test="${rule.cond_lock eq 'non'}">
                                                            <p>����״̬ �� �޹�</p>
                                                        </c:when>
                                                    </c:choose>
                                                  </td>

                                                  <td>
                                                      <c:choose>
                                                          <c:when test="${rule.rule_type eq 'act'}">
                                                              <c:choose>
                                                                  <c:when test="${rule.act_projector eq true}">
                                                                      <p>ͶӰ�� �� ��</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>ͶӰ�� �� ��</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.act_light eq true}">
                                                                      <p>���� �� ��</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>���� �� ��</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.act_ac eq true}">
                                                                      <p>�յ� �� �� ��<c:out value="${rule.act_ac_temp}" />�ȣ�</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>�յ� �� ��</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.act_cctv eq true}">
                                                                      <p>�������ͷ �� ��</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>�������ͷ �� ��</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <c:choose>
                                                                  <c:when test="${rule.trans_temp eq true}">
                                                                      <p>�յ����أ������¶� �� ����</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>�յ����أ������¶� �� ������</p>
                                                                  </c:otherwise>
                                                              </c:choose>
                                                              <c:choose>
                                                                  <c:when test="${rule.trans_cctv eq true}">
                                                                      <p>�������ͷ��Ƶ �� ����</p>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <p>�������ͷ��Ƶ �� ������</p>
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
                                                                    <button type="submit"  style="background-color:darkgreen; border-radius: 15px; border: none; color:white">����״̬</button>
                                                                </form>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <form method="post" action="/iot/rule/list/search/change?checkId=${rule.id}&fixTo=true">
                                                                    <input type="hidden" value="<c:out value="${ruleType}" />" name="ruleType">
                                                                    <input type="hidden" value="<c:out value="${classNum}" />" name="classNum">
                                                                    <button type="submit" style="background-color:orangered; border-radius: 15px; border: none; color:white">����״̬</button>
                                                                </form>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <br/>
                                                      <form method="post" action="/iot/rule/list/search/delete?deleteId=${rule.id}">
                                                          <input type="hidden" value="<c:out value="${ruleType}" />" name="ruleType">
                                                          <input type="hidden" value="<c:out value="${classNum}" />" name="classNum">
                                                        <button type="submit" style="border: black;">ɾ��</button>
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
