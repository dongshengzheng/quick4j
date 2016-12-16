		$(document).ready(function () {
			var width=$(window).width();
			var height=$(window).height()-80-$("#uppart").height();
			FixTable("MyTable", 2, width, height);
		});

		function FixTable(TableID, FixColumnNumber, width, height) {
			if ($("#" + TableID + "_tableLayout").length != 0) {
				$("#" + TableID + "_tableLayout").before($("#" + TableID));
				$("#" + TableID + "_tableLayout").empty();
			}
			else {
				$("#" + TableID).after("<div id='" + TableID + "_tableLayout' style='overflow:hidden;height:" + height + "px; width:" + width + "px;'></div>");
			}

			$('<div id="' + TableID + '_tableFix"></div>'
			+ '<div id="' + TableID + '_tableHead"></div>'
			+ '<div id="' + TableID + '_tableData"></div>').appendTo("#" + TableID + "_tableLayout");


			var oldtable = $("#" + TableID);

			var tableFixClone = oldtable.clone(true);
			tableFixClone.attr("id", TableID + "_tableFixClone");
			$("#" + TableID + "_tableFix").append(tableFixClone);

			var tableHeadClone = oldtable.clone(true);
			tableHeadClone.attr("id", TableID + "_tableHeadClone");
			$("#" + TableID + "_tableHead").append(tableHeadClone);

			var tableColumnClone = oldtable.clone(true);
			$("#" + TableID + "_tableData").append(oldtable);

			$("#" + TableID + "_tableLayout table").each(function () {
				$(this).css("margin", "0");
			});


			var HeadHeight = $("#" + TableID + "_tableHead thead").height();
			HeadHeight += 2;
			$("#" + TableID + "_tableHead").css("height", HeadHeight);
			$("#" + TableID + "_tableFix").css("height", HeadHeight);


			var ColumnsWidth = 0;
			var ColumnsNumber = 0;
			$("#" + TableID + "_tableColumn tr:last td:lt(" + FixColumnNumber + ")").each(function () {
				ColumnsWidth += $(this).outerWidth(true);
				ColumnsNumber++;
			});
			ColumnsWidth += 2;
			if ($.browser.msie) {
				switch ($.browser.version) {
					case "7.0":
						if (ColumnsNumber >= 3) ColumnsWidth--;
						break;
					case "8.0":
						if (ColumnsNumber >= 2) ColumnsWidth--;
						break;
				}
			}
			$("#" + TableID + "_tableColumn").css("width", ColumnsWidth);
			$("#" + TableID + "_tableFix").css("width", ColumnsWidth);


			$("#" + TableID + "_tableData").scroll(function () {
				$("#" + TableID + "_tableHead").scrollLeft($("#" + TableID + "_tableData").scrollLeft());
				$("#" + TableID + "_tableColumn").scrollTop($("#" + TableID + "_tableData").scrollTop());
			});

			$("#" + TableID + "_tableFix").css({ "overflow": "hidden", "position": "relative", "z-index": "50", "background-color": "Silver" });
			$("#" + TableID + "_tableHead").css({ "overflow": "hidden", "width": width - 17, "position": "relative", "z-index": "45", "background-color": "Silver" });

			$("#" + TableID + "_tableData").css({ "overflow": "scroll", "width": width, "height": height, "position": "relative", "z-index": "35" });

			$("#" + TableID + "_tableFix").offset($("#" + TableID + "_tableLayout").offset());
			$("#" + TableID + "_tableHead").offset($("#" + TableID + "_tableLayout").offset());

			$("#" + TableID + "_tableData").offset($("#" + TableID + "_tableLayout").offset());

			if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableFix table").width()) {
				$("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableFix table").width());
				$("#" + TableID + "_tableData").css("width", $("#" + TableID + "_tableFix table").width() + 17);
			}
		}