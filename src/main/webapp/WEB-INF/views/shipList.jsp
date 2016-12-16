<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html style="word-break: keep-all">
<head>
        <c:set var="base" value="${pageContext.request.contextPath}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${base}/css/ship.css" rel="stylesheet" type="text/css" />
        <script src="${base}/plugin/jquery-1.7.2.js" type="text/javascript"></script>
        <script type="text/javascript">
                function shipsAddBefore(){
                       window.location.href="/ship/rest/ships/addBefore";
                }
        </script>
    <script type="text/javascript">
        $(function () {
            $("#selectAll").click(function(){

                if($("#selectAll").attr("checked")){
                    $(".shipId").each(function () {
                        $(this).attr("checked","checked");
                    });
                }else{
                    $(".shipId").each(function () {
                        $(this).attr("checked",false);
                    });
                }
            });

            $("#deleteShips").click(function(e){
                //e.preventDefault();
                var t=confirm("确定要删除船舶明细吗？");
                if(t) {
                    var ids = "";
                    var count = 0;
                    $(".shipId").each(function () {
                        if ($(this).attr("checked")) {
                            ids += $(this).val() + ":";
                            count++;
                        }
                    });

                    if (count == 0) {
                        alert("至少选择一个!");
                        return;
                    }

                    window.location.href="/ship/rest/ships/deleteShips?pageNum=${page.pageNum}&id="+ids;
                }
            });

            $("#gotoPage").blur(function () {
                var pageNum=$("#gotoPage").val();
                if(pageNum>${page.pages}||pageNum==""){
                    pageNum=1;
                }
                window.location.href="/ship/rest/ships/gotoPage?pageNum="+pageNum;

            })
            $("#typeId").change(function () {
                var name="";
                var imo="";
                var tid=$("#typeId").val();
                $(this).blur();
                window.location.href="/ship/rest/ships/type?tid="+tid;
            }).focus(function () {
                $(this)[0].selectedIndex=-1;
            });

            $("tr:even").css("background-color","#CCC");
        });
    </script>

</head>
    <body>
        <div id="uppart">
            <form id="patient_form"  method="get" action="/ship/rest/ships/condition">
                <div class="searchTj">
                        <ul style="margin-left:0px;padding-left:0px;">
                                <li><span>船号:</span> <input type="text" name="imo" id="patient_name" class="textflield"></li>
                                <li><span>船名:</span> <input type="text" name="name" value="" id="outpatient_no" class="textflield"></li>
                                <li style="width:70px;"><input id="submitShip" type="submit" value="搜索" style="width:60px;float:left;height:28px; line-height:22px;"></li>

                                <li><span>Type:</span>
                                    <select class="textflield" name="tid" id="typeId">
                                        <c:forEach items="${types}" var="type">
                                            <option value ="${type.tid}"
                                                    <c:if test="${type.tid==parameter.tid}">
                                                        selected
                                                    </c:if>
                                            >${type.category}</option>
                                        </c:forEach>
                                    </select>
                                </li>
                                <input type="button" onclick="shipsAddBefore()" value="添加" style="width:60px;height:28px; line-height:22px;">&nbsp;&nbsp;
                                <input type="button"  value="删除" id="deleteShips" style="width:60px;height:28px; line-height:22px;">
                        </ul>
                        <div style="clear:both"></div>
                </div>
            </form>
        <!-- <h1>,,,</h1> -->
            <div id="mydiv" style="width: 98%;margin: 0 auto;text-align: right;">
                <span id="pageNum" style="font-size: 12px;">第<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="gotoPage" type="text" style="width: 40px" align="center" value="${page.pageNum}">页/共${page.pages}页</span>&nbsp;
                <a href="/ship/rest/ships/page?tid=${parameter.tid}&pageNum=${page.prePage}" >上一页</a>&nbsp;
                <a href="/ship/rest/ships/page?tid=${parameter.tid}&pageNum=${page.nextPage}" >下一页</a>&nbsp;
            </div>
        </div>

        <div style="height: 80px"></div>

        <table id="MyTable" style="white-space: nowrap;border-bottom:1px solid #D6D6D6;border-right:1px solid #D6D6D6; " cellspacing="0">
            <thead>
                    <tr id="head">
                        <td class="tabletop" ><input type="checkbox" id="selectAll"/></td>
                        <td class="tabletop" >Type&nbsp;</td>
                        <td class="tabletop" >IMO</td>
                        <td class="tabletop" >Status&nbsp;</td>
                        <td class="tabletop" >Name&nbsp;</td>
                        <td class="tabletop"  >BuildYear&nbsp;</td>
                        <td class="tabletop"  >Builder&nbsp;</td>
                        <td class="tabletop"  >ShipType&nbsp;</td>
                        <td class="tabletop"  >Owned/Managed&nbsp;</td>
                        <td class="tabletop"  >Bunkers&nbsp;</td>
                        <td class="tabletop"  >NT&nbsp;</td>
                        <td class="tabletop"  >TPC&nbsp;</td>
                        <td class="tabletop"  >Call Sign&nbsp;</td>
                        <td class="tabletop"  >HP&nbsp;</td>
                        <td class="tabletop"  >Ice&nbsp;</td>

                    <%--bulk--%>
                    <c:if test="${parameter.tid==1}">
                        <td class="tabletop" >Ho/Ha&nbsp;</td>
                        <td class="tabletop" >Hatch Type&nbsp;</td>
                        <td class="tabletop"  >Grain/Bale&nbsp;</td>
                        <td class="tabletop"  >Gear&nbsp;</td>

                        <td class="tabletop" >Lakes Fitted&nbsp;</td>
                        <td class="tabletop" >Log Fitted</td>
                        <td class="tabletop" >Str.Ore&nbsp;</td>
                        <td class="tabletop" >Str.Heavy&nbsp;</td>
                    </c:if>
                        <%--tanker--%>
                    <c:if test="${parameter.tid==2||parameter.tid==4}">
                        <td class="tabletop" >Hull Type&nbsp;</td>
                        <td class="tabletop" >Total Cu.m&nbsp;</td>
                        <td class="tabletop"  >Tnk/Pmp/Sep&nbsp;</td>
                        <td class="tabletop"  >Max t/hr&nbsp;</td>

                        <td class="tabletop" >Coating&nbsp;</td>
                        <td class="tabletop" >IMO grade</td>
                        <td class="tabletop" >Heating&nbsp;</td>
                        <td class="tabletop" >SBT&nbsp;</td>
                    </c:if>
                        <%--gas--%>
                    <c:if test="${parameter.tid==3}">
                        <td class="tabletop" >Tank Type&nbsp;</td>
                        <td class="tabletop" >Tank No.&nbsp;</td>
                        <td class="tabletop"  >Pumps&nbsp;</td>
                        <td class="tabletop"  >Max P/Min T&nbsp;</td>

                        <td class="tabletop" >Cargo&nbsp;</td>
                        <td class="tabletop" >Ammonia</td>
                        <td class="tabletop" >Gas Con&nbsp;</td>
                        <td class="tabletop" >Liq. Con.&nbsp;</td>
                    </c:if>
                        <%--container--%>
                    <c:if test="${parameter.tid==5}">
                        <td class="tabletop" >Ho/Ha&nbsp;</td>
                        <td class="tabletop" >Gear&nbsp;</td>
                        <td class="tabletop"  >DWT/TEU&nbsp;</td>
                        <td class="tabletop"  >Thrust&nbsp;</td>

                        <td class="tabletop" >TEU(hmg)&nbsp;</td>
                        <td class="tabletop" >Rfr Teu/Plugs</td>
                        <td class="tabletop" >Ho/De&nbsp;</td>
                        <td class="tabletop" >Tiers&nbsp;</td>
                    </c:if>
                    <c:if test="${parameter.tid==6}">
                        <td class="tabletop"  >Consumption&nbsp;</td>
                        <td class="tabletop"  >De./Ho./Ha.&nbsp;</td>
                        <td class="tabletop" >Teu&nbsp;</td>
                        <td class="tabletop" >Gear&nbsp;</td>

                        <td class="tabletop" >TEU(hmg)&nbsp;</td>
                        <td class="tabletop" >Rfr Teu/Plugs</td>
                        <td class="tabletop" >Ho/De&nbsp;</td>
                        <td class="tabletop" >Tiers&nbsp;</td>
                    </c:if>



                        <td class="tabletop" >LOA<br>(m)&nbsp;</td>
                        <td class="tabletop" >Beam<br>(m)&nbsp;</td>
                        <td class="tabletop" >GT<br>(ton)&nbsp;</td>
                        <td class="tabletop" >Dwt<br>(ton)&nbsp;</td>
                        <td class="tabletop" >Flag&nbsp;</td>
                        <td class="tabletop" >Class&nbsp;</td>
                        <td class="tabletop" >SS<br>(m/y)&nbsp;</td>
                        <td class="tabletop" >DD<br>(m/y)&nbsp;</td>
                        <td class="tabletop">Speed<br>(knot)&nbsp;</td>
                        <td class="tabletop" >Draft<br>(m)&nbsp;</td>
                        <td class="tabletop" >LDT<br>(ton)</td>
                        <td class="tabletop"  >M/E<br>Maker&nbsp;</td>
                        <td class="tabletop"  >M/E<br>Type&nbsp;</td>
                        <td class="tabletop"  >M/E<br>BHP/RPM&nbsp;</td>
                        <td class="tabletop"  >M/E<br>Cyl.bore<br>(mm)</td>
                        <td class="tabletop"  >AUX.E<br>Maker&nbsp;</td>
                        <td class="tabletop"  >AUX.E<br>Type&nbsp;</td>
                        <td class="tabletop"  >AUX.E<br>QTY&nbsp;</td>
                        <td class="tabletop"  >AUX.E<br>Rated output/revolution<br>(KW/rpm)</td>
                        <td class="tabletop"  >AUX.E<br>Cyl.bore<br>(mm)</td>
                        <td class="tabletop"  >Crane<br>Type&nbsp;</td>
                        <td class="tabletop"  >Crane<br>QTY&nbsp;</td>
                        <td class="tabletop"  >Boiler<br>AUX.boiler heating area<br>(m2)&nbsp;</td>
                        <td class="tabletop"  >Boiler<br>Large water tube boiler evaporation<br>(ton/hour)&nbsp;</td>
                        <td class="tabletop"  >Boiler<br>Gas boiler heating area<br>(m2)&nbsp;</td>
                        <td class="tabletop"  >Boiler<br>Exhaust boiler heating area<br>(m2)</td>
                        <td class="tabletop"  >EM'CY GEN<br>Maker&nbsp;</td>
                        <td class="tabletop"  >EM'CY GEN<br>Type&nbsp;</td>

                        <td class="tabletop"  >Windlass<br>Anchor Windlass&nbsp;</td>
                        <td class="tabletop"  >Windlass<br>Capstan mooringwinch dia.<br>(mm)&nbsp;</td>
                        <td class="tabletop"  >Tailshaft Dia<br>(mm)&nbsp;</td>
                        <td class="tabletop"  >Anchor(kg)&nbsp;</td>
                        <td class="tabletop"  >Anchor chain dia.<br>(mm)&nbsp;</td>
                        <td class="tabletop"  >Air compressor low pressure cly.bore<br>(mm)&nbsp;</td>
                        <td class="tabletop"  >Freon refrigerating compressor rated output<br>(m3)&nbsp;</td>
                        <td class="tabletop"  >Refrigerating system heatexchange area<br>(m2)&nbsp;</td>
                        <td class="tabletop"  >Tubular Heat Exhaust surface area<br>(m2)&nbsp;</td>
                        <td class="tabletop"  >Propeller&nbsp;</td>
                    </tr>
            </thead>
            <tbody>
                     <c:if test="${!empty page.list}" var="s">
                             <c:forEach items="${page.list}" var="ship">
                                  <tr>
                                     <td ><input type="checkbox" value="${ship.id}" class="shipId"/></td>
                                     <td >${ship.type.category}&nbsp;</td>
                                     <td > ${ship.imo}</td>
                                     <td >${ship.status}&nbsp;</td>
                                     <td ><a href="/ship/rest/ships/search?id=${ship.id}&pageNum=${page.pageNum}" >${ship.name}</a>&nbsp;</td>
                                     <td >${ship.buildyear}&nbsp;</td>
                                     <td >${ship.builder}&nbsp;</td>
                                      <td  >${ship.model}&nbsp;</td>
                                      <td  >${ship.owned}&nbsp;</td>
                                      <td  >${ship.bunkers}&nbsp;</td>
                                      <td  >${ship.nt}&nbsp;</td>
                                      <td  >${ship.tpc}&nbsp;</td>
                                      <td  >${ship.callsign}&nbsp;</td>
                                      <td  >${ship.hp}&nbsp;</td>
                                      <td  >${ship.ice}&nbsp;</td>


                                      <td  >${ship.onepenult}&nbsp;</td>
                                      <td  >${ship.twopenult}&nbsp;</td>
                                      <td  >${ship.threepenult}&nbsp;</td>
                                      <td  >${ship.fourpenult}&nbsp;</td>

                                      <td  >${ship.onelast}&nbsp;</td>
                                      <td  >${ship.twolast}</td>
                                      <td  >${ship.threelast}</td>
                                      <td  >${ship.fourlast}&nbsp;</td>




                                     <td  >${ship.loa}&nbsp;</td>
                                     <td  >${ship.beam}&nbsp;</td>
                                     <td  >${ship.ggt}&nbsp;</td>
                                     <td  >${ship.dwt}</td>
                                     <td  >${ship.flag}&nbsp;</td>

                                     <td  >${ship.classs}&nbsp;</td>
                                     <td  >${ship.nextSs}&nbsp;</td>
                                     <td  >${ship.nextDd}&nbsp;</td>
                                     <td  >${ship.speed}&nbsp;</td>
                                     <td  >${ship.draft}&nbsp;</td>
                                     <td  >${ship.ldt}</td>

                                     <td  >${ship.mmaker}&nbsp;</td>
                                     <td  >${ship.mmype}&nbsp;</td>
                                     <td  >${ship.mbr}&nbsp;</td>
                                     <td  >${ship.mcyl}</td>
                                     <td  >${ship.amake}&nbsp;</td>
                                     <td  >${ship.atype}&nbsp;</td>

                                     <td  >${ship.aqty}&nbsp;</td>
                                     <td  >${ship.arated}</td>
                                     <td  >${ship.acyl}</td>
                                     <td  >${ship.ctype}&nbsp;</td>
                                     <td  >${ship.cqty}&nbsp;</td>
                                     <td  >${ship.baux}&nbsp;</td>

                                     <td  >${ship.blarge}&nbsp;</td>
                                     <td  >${ship.bgas}&nbsp;</td>
                                     <td  >${ship.bexhaust}</td>
                                     <td  >${ship.emaker}&nbsp;</td>
                                     <td  >${ship.etype}&nbsp;</td>
                                     <td  >${ship.wanchor}&nbsp;</td>

                                     <td  >${ship.wcapstan}&nbsp;</td>
                                     <td  >${ship.tasishaft}&nbsp;</td>
                                     <td  >${ship.anchor}&nbsp;</td>
                                     <td  >${ship.anchorchain}&nbsp;</td>
                                     <td  >${ship.air}&nbsp;</td>
                                     <td  >${ship.freon}&nbsp;</td>
                                     <td  >${ship.refrige}&nbsp;</td>
                                     <td  >${ship.tubluar}&nbsp;</td>
                                     <td  >${ship.propeller}&nbsp;</td>
                                  </tr>
                             </c:forEach>
                     </c:if>
                     <c:if test="${!s}">
                            <tr align="center">
                                    <td colspan="43">暂无信息</td>
                            </tr>
                     </c:if>
            </tbody>
        </table>


        <script src="${base}/plugin/jquery-migrate-1.2.1.js" type="text/javascript"></script>
        <script src="${base}/plugin/table.js" type="text/javascript"></script>
</body>
</html>
