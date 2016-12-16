<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <c:set var="base" value="${pageContext.request.contextPath}"/>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script src="${base}/plugin/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="${base}/plugin/jquery-ui.js" type="text/javascript"></script>
    <link href="${base}/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .ui-datepicker-calendar {
            display: none;
        }

    </style>
	<script type="text/javascript">
        $(document).ready(function() {
            $("#nextSs").datepicker({
                changeMonth: true,
                changeYear: true,
                showButtonPanel: true,
                dateFormat: 'MM/yy',
                onClose: function(dateText, inst) {
                    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                    $(this).datepicker('setDate', new Date(year, month, 1));
                }
            });
            $("#nextDd").datepicker({
                changeMonth: true,
                changeYear: true,
                showButtonPanel: true,
                dateFormat: 'MM/yy',
                onClose: function(dateText, inst) {
                    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                    $(this).datepicker('setDate', new Date(year, month, 1));
                }
            });
            $("#buildyear").datepicker({
                changeMonth: true,
                changeYear: true,
                showButtonPanel: true,
                dateFormat: 'MM/yy',
                onClose: function(dateText, inst) {
                    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                    $(this).datepicker('setDate', new Date(year, month, 1));
                }
            });
            //tanker||chemical
            if ($("#typeId").val()==1){
                $("#onepenult").html("Ho/Ha");
                $("#twopenult").html("Hatch Type");
                $("#threepenult").html("Grain/Bale");
                $("#fourpenult").html("Gear");
                $("#onelast").html("Lakes");
                $("#twolast").html("Log Fitted");
                $("#threelast").html("Str.Ore");
                $("#fourlast").html("Str.Heavy");
            }

            //tanker||chemical
            if ($("#typeId").val()==2||$("#typeId").val()==4){
                $("#onepenult").html("Hull Type");
                $("#twopenult").html("Total Cu.m");
                $("#threepenult").html("Tnk/Pmp/Sep");
                $("#fourpenult").html("Max t/hr");
                $("#onelast").html("Coating");
                $("#twolast").html("IMO grade");
                $("#threelast").html("Heating");
                $("#fourlast").html("SBT");
            }

            //gas
            if ($("#typeId").val()==3){
                $("#onepenult").html("Tank Type");
                $("#twopenult").html("Tank No.");
                $("#threepenult").html("Pumps");
                $("#fourpenult").html("Max P/Min T");
                $("#onelast").html("Cargo");
                $("#twolast").html("Ammonia");
                $("#threelast").html("Gas Con.");
                $("#fourlast").html("Liq. Con.");
            }

            //container
            if ($("#typeId").val()==5){
                $("#onepenult").html("Ho/Ha");
                $("#twopenult").html("Gear");
                $("#threepenult").html("DWT/TEU");
                $("#fourpenult").html("B.Thrust");
                $("#onelast").html("TEU(hmg)");
                $("#twolast").html("Rfr Teu/Plugs");
                $("#threelast").html("Ho/De");
                $("#fourlast").html("Tiers");
            }

            //Multi-Purpose
            if ($("#typeId").val()==6){
                $("#onepenult").html("Consumption");
                $("#twopenult").html("De./Ho./Ha.");
                $("#threepenult").html("Teu");
                $("#fourpenult").html("Gear");
                $("#onelast").html("Lakes");
                $("#twolast").html("Log Fitted");
                $("#threelast").html("Str.Ore");
                $("#fourlast").html("Str.Heavy");
            }
            $("#typeId").change(function () {
                //tanker||chemical
                if ($("#typeId").val()==1){
                    $("#onepenult").html("Ho/Ha");
                    $("#twopenult").html("Hatch Type");
                    $("#threepenult").html("Grain/Bale");
                    $("#fourpenult").html("Gear");
                    $("#onelast").html("Lakes");
                    $("#twolast").html("Log Fitted");
                    $("#threelast").html("Str.Ore");
                    $("#fourlast").html("Str.Heavy");
                }

                //tanker||chemical
                if ($("#typeId").val()==2||$("#typeId").val()==4){
                    $("#onepenult").html("Hull Type");
                    $("#twopenult").html("Total Cu.m");
                    $("#threepenult").html("Tnk/Pmp/Sep");
                    $("#fourpenult").html("Max t/hr");
                    $("#onelast").html("Coating");
                    $("#twolast").html("IMO grade");
                    $("#threelast").html("Heating");
                    $("#fourlast").html("SBT");
                }
                //gas
                if ($("#typeId").val()==3){
                    $("#onepenult").html("Tank Type");
                    $("#twopenult").html("Tank No.");
                    $("#threepenult").html("Pumps");
                    $("#fourpenult").html("Max P/Min T");
                    $("#onelast").html("Cargo");
                    $("#twolast").html("Ammonia");
                    $("#threelast").html("Gas Con.");
                    $("#fourlast").html("Liq. Con.");
                }

                //container
                if ($("#typeId").val()==5){
                    $("#onepenult").html("Ho/Ha");
                    $("#twopenult").html("Gear");
                    $("#threepenult").html("DWT/TEU");
                    $("#fourpenult").html("B.Thrust");
                    $("#onelast").html("TEU(hmg)");
                    $("#twolast").html("Rfr Teu/Plugs");
                    $("#threelast").html("Ho/De");
                    $("#fourlast").html("Tiers");
                }
                //Multi-Purpose
                if ($("#typeId").val()==6){
                    $("#onepenult").html("Consumption");
                    $("#twopenult").html("De./Ho./Ha.");
                    $("#threepenult").html("Teu");
                    $("#fourpenult").html("Gear");
                    $("#onelast").html("Lakes");
                    $("#twolast").html("Log Fitted");
                    $("#threelast").html("Str.Ore");
                    $("#fourlast").html("Str.Heavy");
                }

            });

        });

	</script>
</head>
	<body >
		<div class="portlet box green">
            <div style="margin: auto; width:1000px;background-color: #CCC" >
                <a href="/ship/rest/ships" >返回首页</a>

            </div>
			<div class="portlet-body form">
			<!-- BEGIN FORM-->
				<form name="form1" method="POST" action="/ship/rest/ships/update" enctype="multipart/form-data">
                    <input type="hidden" value="${ship.id}" name="id"/>

					<table border="3" align="center" width="1000" cellspacing="0">
						<tr align="middle"><th colspan="6" height="24">更新船舶信息</th>
                        </tr>

                        <tr>
                            <td width="5%">
                                <b>IMO</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="imo"  id="imo" value="${ship.imo}"/>
                            </td>
                            <td width="5%">
                                <b>Status</b>:
                            </td>
                            <td width="27%">
                                <select name="status">
                                    <option value ="Unsold"
                                        <c:if test="${ship.status=='Unsold'}">
                                            selected
                                        </c:if>
                                     >Unsold</option>
                                    <option value ="OnSale"
                                            <c:if test="${ship.status=='OnSale'}">
                                                selected
                                            </c:if>
                                    >OnSale</option>
                                </select>
                            </td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <select class="typeId" name="tid" id="typeId">
                                    <option >--请选择--</option>
                                    <c:forEach items="${types}" var="type">
                                        <option value ="${type.tid}"
                                                <c:if test="${type.tid==ship.type.tid}">
                                                    selected
                                                </c:if>
                                        >${type.category}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Name</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="name" value="${ship.name}"/>
                            </td>
                            <td width="5%">
                                <b>BuildYear</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="buildyear" value="${ship.buildyear}" id="buildyear" />
                            </td>
                            <td width="5%">
                                <b>Image</b>
                            </td>
                            <td width="27%">
                                <input type="file" name="shipImage"/>
                            </td>

                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Builder</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="builder" value="${ship.builder}"/>
                            </td>
                            <td width="5%">
                                <b>LOA(m)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="loa" value="${ship.loa}"/>
                            </td>
                            <td width="5%">
                                <b>FileName</b>:
                            </td>
                            <td width="27%">
                                <b>${ship.filename}</b>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Beam(m)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="beam" value="${ship.beam}"/>
                            </td>
                            <td width="5%">
                                <b>GT(ton)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="ggt" value="${ship.ggt}"/>
                            </td>
                            <td colspan="2" rowspan="9">
                                <img src="/ship/rest/ships/image?id=${ship.id}" width="350px" height="240px"/>
                            </td>

                        </tr>

                        <tr>
                            <td width="5%">
                                <b>Dwt(ton)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="dwt" value="${ship.dwt}"/>
                            </td>

                            <td width="5%">
                                <b>Flag</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="flag" value="${ship.flag}"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Class</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="classs" value="${ship.classs}"/>
                            </td>
                            <td width="5%">
                                <b>SS(m/y)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="nextSs" id="nextSs"  value="${ship.nextSs}"/>
                            </td>
                        </tr>
                        <tr>

                            <td width="5%">
                                <b>DD(m/y)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="nextDd" id="nextDd"  value="${ship.nextDd}"/>
                            </td>
                            <td width="5%">
                                <b>Speed(knot)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="speed" value="${ship.speed}"/>
                            </td>

                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Draft(m)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="draft" value="${ship.draft}"/>
                            </td>

                            <td width="5%">
                                <b>LDT(ton)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="ldt" value="${ship.ldt}"/>
                            </td>

                        </tr>
                        <tr>
                            <td width="5%">
                                <b>ShipType</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="model" value="${ship.model}"/>
                            </td>
                            <td width="5%">
                                <b>Owned/Managed</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="owned" value="${ship.owned}"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Bunkers</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="bunkers" value="${ship.bunkers}"/>
                            </td>
                            <td width="5%">
                                <b>NT</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="nt" value="${ship.nt}"/>
                            </td>

                        </tr>
                        <tr>
                            <td width="5%">
                                <b>TPC</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="tpc" value="${ship.tpc}"/>
                            </td>
                            <td width="5%">
                                <b>Call Sign</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="callsign" value="${ship.callsign}"/>
                            </td>

                        </tr>
                        <tr>
                            <td width="5%">
                                <b>HP</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="hp" value="${ship.hp}"/>
                            </td>
                            <td width="5%">
                                <b>Ice</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="ice" value="${ship.ice}"/>
                            </td>
                        </tr>



                        <tr>
                            <td width="5%" >
                                <b id="onepenult">Ho/Ha</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="onepenult" value="${ship.onepenult}"/>
                            </td>
                            <td width="5%" >
                                <b id="twopenult">Hatch Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="twopenult" value="${ship.twopenult}"/>
                            </td>
                            <td width="5%" >
                                <b id="threepenult">Grain/Bale</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="threepenult" value="${ship.threepenult}"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" >
                                <b id="fourpenult">Gear</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="fourpenult" value="${ship.fourpenult}"/>
                            </td>
                            <td width="5%" >
                                <b id="onelast">Lakes Fitted</b>:
                            </td>
                            <td width="27%" >
                                <input  type="text" name="onelast" value="${ship.onelast}"/>
                            </td>
                            <td width="5%" >
                                <b id="twolast">Log Fitted</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="twolast" value="${ship.twolast}"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" >
                                <b id="threelast">Str.Ore</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="threelast" value="${ship.threelast}"/>
                            </td>
                            <td width="5%" >
                                <b id="fourlast">Str.Heavy</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="fourlast" value="${ship.fourlast}"/>
                            </td>
                        </tr>


                        <tr><td colspan="6" height="10px"></td></tr>
                        <tr align="middle">
                            <td  colspan="6" style="background-color: #CCC">M/E</td>
                        </tr>
                        <tr >
                            <td width="5%">
                                <b>Maker</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mmaker" value="${ship.mmaker}"/>
                            </td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mmype" value="${ship.mmype}"/>
                            </td>
                            <td width="5%">
                                <b>BHP/RPM</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mbr" value="${ship.mbr}"/>
                            </td>

                        </tr>
                        <tr >
                            <td width="5%">
                                <b>Cyl.bore(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mcyl" value="${ship.mcyl}"/>
                            </td>
                        </tr>
                        <tr><td colspan="6" height="10px"></td></tr>

                        <tr align="middle">
                            <td  colspan="6" style="background-color: #CCC">AUX.E</td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Maker</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="amake" value="${ship.amake}"/>
                            </td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="atype" value="${ship.atype}"/>
                            </td>
                            <td width="5%">
                                <b>Qty</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="aqty" value="${ship.aqty}"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Rated output/revolution(KW/rpm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="arated" value="${ship.arated}"/>
                            </td>
                            <td width="5%">
                                <b>Cyl.bore(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="acyl" value="${ship.acyl}"/>
                            </td>
                        </tr>
                        <tr><td colspan="6" height="10px"></td></tr>

                        <tr align="middle">
                            <td  colspan="6" style="background-color: #CCC">Crane</td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="ctype" value="${ship.ctype}"/>
                            </td>
                            <td width="5%">
                                <b>QTY</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="cqty" value="${ship.cqty}"/>
                            </td>
                        </tr>
                        <tr><td colspan="6" height="10px"></td></tr>

                        <tr align="middle">
                            <td  colspan="6" style="background-color: #CCC">Boiler</td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>AUX.boiler heating area(m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="baux" value="${ship.baux}"/>
                            </td>
                            <td width="5%">
                                <b>Large water tube boiler evaporation(ton/hour)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="blarge" value="${ship.blarge}"/>
                            </td>
                            <td width="5%">
                                <b>Gas boiler heating area(m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="bgas" value="${ship.bgas}"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Exhaust boiler heating area(m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="bexhaust" value="${ship.bexhaust}"/>
                            </td>
                        </tr>
                        <tr><td colspan="6" height="10px"></td></tr>

                        <tr align="middle">
                            <td  colspan="6" style="background-color: #CCC">EM'CY GEN.</td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Maker</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="emaker" value="${ship.emaker}"/>
                            </td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="etype" value="${ship.etype}"/>
                            </td>
                        </tr>
                        <tr><td colspan="6" height="10px"></td></tr>


                        <tr align="middle">
                            <td  colspan="6" style="background-color: #CCC">Windlass</td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Anchor</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="wanchor" value="${ship.wanchor}"/>
                            </td>
                            <td width="5%">
                                <b>Capstan mooring winch dia.(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="wcapstan" value="${ship.wcapstan}"/>
                            </td>
                        </tr>
                        <tr><td colspan="6" height="10px"></td></tr>

                        <tr>
                            <td width="5%">
                                <b>Tailshaft Dia.(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="tasishaft" value="${ship.tasishaft}"/>
                            </td>
                            <td width="5%">
                                <b>Anchor(kg)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="anchor" value="${ship.anchor}"/>
                            </td>
                            <td width="5%">
                                <b>Anchor chain dia.(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="anchorchain" value="${ship.anchorchain}"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Air compressor low pressure cly.bore(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="air" value="${ship.air}"/>
                            </td>
                            <td width="5%">
                                <b>Freon refrigerating compressor rated output
                                    (m3)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="freon" value="${ship.freon}"/>
                            </td>
                            <td width="5%">
                                <b>Refrigerating system heat exchange area
                                    (m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="refrige" value="${ship.refrige}"/>
                            </td>

                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Tubular Heat Exhaust  surface area
                                    (m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="tubluar" value="${ship.tubluar}"/>
                            </td>
                            <td>
                                <b>Propeller</b>:
                            </td>
                            <td>
                                <input  type="text" name="propeller" value="${ship.propeller}"/>
                            </td>
                        </tr>
                        <tr align="middle">
                            <td colspan="6">
                                <input type="submit" value="更新" />
                                <input type="reset" value="重置"/>
                            </td>
                        </tr>
					</table>
				</form>
			<!-- END FORM-->
			</div>
		</div>
</body>

</html>