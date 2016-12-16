<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

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
            if(${mes}){
                alert("添加成功");
                var url="/ship/rest/ships/remove"
                $.post(url,function () {

                });
            }
        });
    </script>
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

            $("#imo").blur(function () {
                var imo= $("#imo").val();
                var url="/ship/rest/ships/confirm";
                $.post(url,{"imo":imo},function (data) {
                    if(data.mes){
                        alert(data.mes);
                        $("#imo").val("");
                        $("#imo").focus();
                    }
                });
            });

            $("#insert").click(function () {
                var url="/ship/rest/ships/add";
                $.post(url,$("#form1").serialize(),function (data) {
                    if(data.mes){
                        alert("添加成功")
                        window.location.reload(true);
                    }
                })
            });




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
			<!-- BEGIN FORM-->
				<form method="post" action="/ship/rest/ships/add" enctype="multipart/form-data">
					<table border="1" align="center" width="1000" cellspacing="0">
						<tr align="middle"><th colspan="6" height="24">添加船舶信息</th></tr>
						<tr>
							<td width="5%">
								<b>IMO</b>:
							</td>
							<td width="27%">
								<input  type="text" name="imo"  id="imo" />
							</td>
							<td width="5%">
								<b>Status</b>:
							</td>
							<td width="27%">
                                <select name="status">
                                    <option value ="UnSold">UnSold</option>
                                    <option value ="OnSale">OnSale</option>
                                </select>
							</td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <select class="typeId" name="tid" id="typeId">
                                    <c:forEach items="${types}" var="type">
                                        <option value ="${type.tid}">${type.category}</option>
                                    </c:forEach>
                                </select>
                            </td>
						</tr>

						<tr>
							<td width="5%">
								<b>Name</b>:
							</td>
							<td width="27%">
								<input  type="text" name="name"/>
							</td>
							<td width="5%">
								<b>BuildYear</b>:
							</td>
							<td width="27%">
								<input  type="text" name="buildyear" id="buildyear" />
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
								<input  type="text" name="builder"/>
							</td>
							<td width="5%">
								<b>LOA(m)</b>:
							</td>
							<td width="27%">
								<input  type="text" name="loa"/>
							</td>
						</tr>
						<tr>
							<td width="5%">
								<b>Beam(m)</b>:
							</td>
							<td width="27%">
								<input  type="text" name="beam"/>
							</td>
							<td width="5%">
								<b>GT(ton)</b>:
							</td>
							<td width="27%">
								<input  type="text" name="ggt"/>
							</td>
                            <td width="5%">
                                <b>Dwt(ton)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="dwt"/>
                            </td>
						</tr>

						<tr>

                            <td width="5%">
                                <b>Flag</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="flag"/>
                            </td>
                            <td width="5%">
                                <b>Class</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="classs"/>
                            </td>
                            <td width="5%">
                                <b>SS(m/y)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="nextSs" id="nextSs" />
                            </td>
					    </tr>
						<tr>

                            <td width="5%">
                                <b>DD(m/y)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="nextDd" id="nextDd" />
                            </td>
                            <td width="5%">
                                <b>Speed(knot)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="speed"/>
                            </td>
                            <td width="5%">
                                <b>Draft(m)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="draft"/>
                            </td>
						</tr>
						<tr>

                            <td width="5%">
                                <b>LDT(ton)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="ldt"/>
                            </td>
                            <td width="5%">
                                <b>ShipType</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="model"/>
                            </td>
                            <td width="5%">
                                <b>Owned/Managed</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="owned"/>
                            </td>
						</tr>
                        <tr>
                            <td width="5%">
                                <b>Bunkers</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="bunkers"/>
                            </td>
                            <td width="5%">
                                <b>NT</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="nt"/>
                            </td>
                            <td width="5%">
                                <b>TPC</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="tpc"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Call Sign</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="callsign"/>
                            </td>
                            <td width="5%">
                                <b>HP</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="hp"/>
                            </td>
                            <td width="5%">
                                <b>Ice</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="ice"/>
                            </td>
                        </tr>



                        <tr>
                            <td width="5%" >
                                <b id="onepenult">Ho/Ha</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="onepenult"/>
                            </td>
                            <td width="5%" >
                                <b id="twopenult">Hatch Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="twopenult"/>
                            </td>
                            <td width="5%" >
                                <b id="threepenult">Grain/Bale</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="threepenult"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" >
                                <b id="fourpenult">Gear</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="fourpenult"/>
                            </td>
                            <td width="5%" >
                                <b id="onelast">Lakes Fitted</b>:
                            </td>
                            <td width="27%" >
                                <input  type="text" name="onelast"/>
                            </td>
                            <td width="5%" >
                                <b id="twolast">Log Fitted</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="twolast"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" >
                                <b id="threelast">Str.Ore</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="threelast"/>
                            </td>
                            <td width="5%" >
                                <b id="fourlast">Str.Heavy</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="fourlast"/>
                            </td>
                        </tr>




                        <tr align="middle">
                            <td  colspan="6" style="background-color: #CCC">M/E</td>
                        </tr>
                        <tr >
                            <td width="5%">
                                <b>Maker</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mmaker"/>
                            </td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mmype"/>
                            </td>
                            <td width="5%">
                                <b>BHP/RPM</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mbr"/>
                            </td>

                        </tr>
						<tr >
                            <td width="5%">
                                <b>Cyl.bore(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="mcyl"/>
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
                                <input  type="text" name="amake"/>
                            </td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="atype"/>
                            </td>
                            <td width="5%">
                                <b>Qty</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="aqty"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Rated output/revolution(KW/rpm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="arated"/>
                            </td>
                            <td width="5%">
                                <b>Cyl.bore(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="acyl"/>
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
                                <input  type="text" name="ctype"/>
                            </td>
                            <td width="5%">
                                <b>QTY</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="cqty"/>
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
                                <input  type="text" name="baux"/>
                            </td>
                            <td width="5%">
                                <b>Large water tube boiler evaporation(ton/hour)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="blarge"/>
                            </td>
                            <td width="5%">
                                <b>Gas boiler heating area(m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="bgas"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Exhaust boiler heating area(m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="bexhaust"/>
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
                                <input  type="text" name="emaker"/>
                            </td>
                            <td width="5%">
                                <b>Type</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="etype"/>
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
                                <input  type="text" name="wanchor"/>
                            </td>
                            <td width="5%">
                                <b>Capstan mooring winch dia.(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="wcapstan"/>
                            </td>
                        </tr>
                        <tr><td colspan="6" height="10px"></td></tr>

                        <tr>
                            <td width="5%">
                                <b>Tailshaft Dia.(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="tasishaft"/>
                            </td>
                            <td width="5%">
                                <b>Anchor(kg)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="anchor"/>
                            </td>
                            <td width="5%">
                                <b>Anchor chain dia.(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="anchorchain"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <b>Air compressor low pressure cly.bore(mm)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="air"/>
                            </td>
                            <td width="5%">
                                <b>Freon refrigerating compressor rated output
                                    (m3)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="freon"/>
                            </td>
                            <td width="5%">
                                <b>Refrigerating system heat exchange area
                                    (m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="refrige"/>
                            </td>

                        </tr>
						<tr>
                            <td width="5%">
                                <b>Tubular Heat Exhaust  surface area
                                    (m2)</b>:
                            </td>
                            <td width="27%">
                                <input  type="text" name="tubluar"/>
                            </td>
							<td>
								<b>Propeller</b>:
							</td>
							<td>
                                <input  type="text" name="propeller"/>
							</td>
						</tr>
						<tr align="middle">
							<td colspan="6">
								<input type="submit" id="insert" value="确定" />
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