<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath()+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 样式 -->
<link href="resources/css/Main.css" rel="stylesheet" type="text/css" />
<!-- jquery -->
<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
<!-- jquery 控件和提示框 -->
  <link rel="stylesheet" href="resources/css/jquery-ui.css">
  <script src="resources/js/jquery-1.10.2.js"></script>
  <script src="resources/js/jquery-ui.js"></script>
  <link rel="stylesheet" href="<%=basePath %>resources/css/style.css">
<!-- jquery 数字选择器滑动 -->
  <script src="resources/js/jquery.mousewheel.js"></script>
 
  <!-- jquery 提示框 -->
  <script>
  $(function() {
    $( document ).tooltip();
  });
  </script>
  <style>
  label {
    display: inline-block;
    width: 5em;
  }
  </style>
</head>
<body>
<div id="retError" style="display: none;"></div>
<script>
<!-- jquery 日期选择器,设置为默认汉字,日期格式"yy-dd-mm" -->
$(function() {
	$( "#datepicker" ).datepicker();
	 $(function() {

         $.datepicker.regional["zh-CN"] = { closeText: "关闭", prevText: "&#x3c;上月", nextText: "下月&#x3e;", currentText: "今天", monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"], monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"], dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"], dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"], dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"], weekHeader: "周", dateFormat: "yy-mm-dd", firstDay: 1, isRTL: !1, showMonthAfterYear: !0, yearSuffix: "年" }

                      

         $.datepicker.setDefaults($.datepicker.regional["zh-CN"]);

         

         var datePicker = $("#ctl00_BodyMain_txtDate").datepicker({

             showOtherMonths: true,

             selectOtherMonths: true            

         });

     });
});
$(function() {
	$( "#datepicker1" ).datepicker();
	 $(function() {

         $.datepicker.regional["zh-CN"] = { closeText: "关闭", prevText: "&#x3c;上月", nextText: "下月&#x3e;", currentText: "今天", monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"], monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"], dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"], dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"], dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"], weekHeader: "周", dateFormat: "yy-mm-dd", firstDay: 1, isRTL: !1, showMonthAfterYear: !0, yearSuffix: "年" }

                      

         $.datepicker.setDefaults($.datepicker.regional["zh-CN"]);

         

         var datePicker = $("#ctl00_BodyMain_txtDate").datepicker({

             showOtherMonths: true,

             selectOtherMonths: true            

         });

     });
});
<!--Jquery选项框-->
/*$(function() {
	$( "#accordion" ).accordion();
});*/
//不用点击选择
$(function() {
	$( "#accordion" ).accordion({
		event: "click hoverintent"
	});
});
/*
 * hoverIntent | Copyright 2011 Brian Cherne
 * http://cherne.net/brian/resources/jquery.hoverIntent.html
 * modified by the jQuery UI team
 */

$.event.special.hoverintent = {
	setup: function() {
		$( this ).bind( "mouseover", jQuery.event.special.hoverintent.handler );
	},
	teardown: function() {
		$( this ).unbind( "mouseover", jQuery.event.special.hoverintent.handler );
	},
	handler: function( event ) {
		var currentX, currentY, timeout,
			args = arguments,
			target = $( event.target ),
			previousX = event.pageX,
			previousY = event.pageY;

		function track( event ) {
			currentX = event.pageX;
			currentY = event.pageY;
		};

		function clear() {
			target
				.unbind( "mousemove", track )
				.unbind( "mouseout", clear );
			clearTimeout( timeout );
		}

		function handler() {
			var prop,
				orig = event;

			if ( ( Math.abs( previousX - currentX ) +
					Math.abs( previousY - currentY ) ) < 7 ) {
				clear();

				event = $.Event( "hoverintent" );
				for ( prop in orig ) {
					if ( !( prop in event ) ) {
						event[ prop ] = orig[ prop ];
					}
				}
				// Prevent accessing the original event since the new event
				// is fired asynchronously and the old event is no longer
				// usable (#6028)
				delete event.originalEvent;

				target.trigger( event );
			} else {
				previousX = currentX;
				previousY = currentY;
				timeout = setTimeout( handler, 100 );
			}
		}

		timeout = setTimeout( handler, 100 );
		target.bind({
			mousemove: track,
			mouseout: clear
		});
	}
};
$(function() {
	$( "#spinner" ).spinner({
		min: 0,
		max: 10000,
		step: 15,
		start: 0
	});
});
$(function() {
	$( "#basic" ).spinner({
		min: 1000,
		max: 50000,
		step: 500,
		start: 1000
	});
});
$(function() {
	$( "#eat" ).spinner({
		min: 0,
		max: 10000,
		step: 50,
		start: 0
	});
});
$(function() {
	$( "#house" ).spinner({
		min: 0,
		max: 10000,
		step: 500,
		start: 0
	});
});
$(function() {
	$( "#duty" ).spinner({
		min: 0,
		max: 10000,
		step: 1000,
		start: 0
	});
});
$(function() {
	$( "#other" ).spinner({
		min: 0,
		max: 100,
		step: 1,
		start: 0
	});
});
$(function() {
	$( "#scot" ).spinner({
		min: 0,
		max: 10000,
		step: 100,
		start: 0
	});
});
</script>
<label for="tip"></label>
<label for="tip1"></label>
<label for="tip2"></label>
<label for="tip3"></label>
<label for="tip4"></label>
<label for="tip5"></label>
<label for="tip6"></label>
<label for="tip7"></label>
<label for="tip8"></label>
<label for="tip9"></label>
<label for="basic"></label>
<label for="spinner"></label>
<label for="datepicker"></label>
</body>


