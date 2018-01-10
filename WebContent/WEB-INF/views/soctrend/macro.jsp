<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Regression Tab View</title>
<%-- 1. jquery --%>
<!-- <script src="js/jquery/jquery-1.11.2.js"></script> -->
<script type="text/javascript" src="js/jqGrid_JS_5.1.0/js/jquery-1.11.0.min.js"></script>
<!-- <script src="js/jquery-ui-1.11.3.custom/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="js/jquery-ui-1.11.3.custom/jquery-ui.css" /> -->
<!-- <script src="js/jquery.csv-0.71.js"></script> -->

<%-- jqgrid --%>
<!-- <script type="text/javascript" src="js/jqGrid_JS_5.1.0/js/jquery-1.11.0.min.js"></script> -->
<script type="text/javascript"	src="js/jqGrid_JS_5.1.0/js/i18n/grid.locale-en.js"></script>
<script type="text/javascript"	src="js/jqGrid_JS_5.1.0/src/jquery.jqGrid.js"></script>

<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">  -->
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/jquery-ui-1.11.3.custom/jquery-ui.js"></script>

<%-- http://swebdeveloper.com/apps/forms-plus-css/popup-form-comment.html --%>
<link rel="stylesheet"	href="/dashboard/css/bootstrap/font-awesome.min.css">
<link rel="stylesheet"	href="/dashboard/css/bootstrap/modern-forms-plus.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/purple.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/cadetBlue.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/orange.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/extra1color3.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/extra1color4.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/extra2color3.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/extra2color3.css">
<link rel="stylesheet" href="/dashboard/css/bootstrap/steelBlue.css">



<!--  <link rel="stylesheet" href="js/jqGrid_JS_5.1.0/css/ui.jqgrid.css" type="text/css" /> -->
<link rel="stylesheet" media="screen"	href="js/jqGrid_JS_5.1.0/css/ui.jqgrid-bootstrap.css" type="text/css" />
<!-- <link rel="stylesheet" media="screen"  href="js/jqGrid_JS_5.1.0/css/ui.jqgrid-bootstrap-ui.css" type="text/css" /> -->



<%-- 2. high charts --%>
<!--<script src="/dashboard/js/Highcharts-5.0.7/code/highcharts.src.js"></script>
	<script src="/dashboard/js/Highcharts-5.0.7/code/highcharts-more.src.js"></script>
	<script src="/dashboard/js/Highcharts-5.0.7/code/modules/drilldown.src.js"></script>
	<script src="/dashboard/js/Highcharts-5.0.7/code/modules/no-data-to-display.js"></script>
	<script src="/dashboard/js/Highcharts-5.0.7/code/modules/exporting.src.js"></script>
	<script src="/dashboard/js/Highcharts-5.0.7/code/modules/offline-exporting.src.js"></script> -->

<script src="/dashboard/js/Highstock-5.0.9/code/highstock.src.js"></script>
<script src="/dashboard/js/Highstock-5.0.9/code/modules/heatmap.src.js"></script>
<script src="/dashboard/js/Highstock-5.0.9/code/highcharts-more.src.js"></script>
<script	src="/dashboard/js/Highstock-5.0.9/code/modules/drilldown.src.js"></script>
<script	src="/dashboard/js/Highstock-5.0.9/code/modules/no-data-to-display.js"></script>
<script	src="/dashboard/js/Highstock-5.0.9/code/modules/exporting.src.js"></script>
<script	src="/dashboard/js/Highstock-5.0.9/code/modules/offline-exporting.src.js"></script>

<%-- x축 그룹라벨 --%>
<!-- <script src="js/highcharts/grouped-categories.js"></script> -->
<!-- <script src="http://blacklabel.github.io/grouped_categories/grouped-categories.js"></script> -->

<%-- 3. Additional files for the Highslide popup effect --%>
<script type="text/javascript" src="js/highslide/highslide-full.js"></script>
<script type="text/javascript" src="js/highslide/highslide.config.js"	charset="utf-8"></script>

<%-- 4. local common --%>
<script src="js/dashboard.js?version=2017.10.01"></script>

<%-- 5. local --%>
<!-- <link rel="stylesheet" type="text/css" href="js/highslide/highslide.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="js/jquery-ui-1.11.3.custom/jquery-ui.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="http://www.trirand.com/blog/jqgrid/themes/redmond/jquery-ui-custom.css" /> -->

<%-- multi select --%>
<script src="/dashboard/js/jquery-multiselect/jquery.multiselect.js"></script>
<script	src="/dashboard/js/jquery-multiselect/src/jquery.multiselect.filter.js"></script>
<link rel="stylesheet" type="text/css"	href="/dashboard/js/jquery-multiselect/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css"	href="/dashboard/js/jquery-multiselect/jquery.multiselect.filter.css" />
<link rel="stylesheet" type="text/css"	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" />
<script src="/dashboard/js/jmespath.js-master/jmespath.js?version=1"></script>

<link rel="stylesheet" type="text/css" href="/nspim/css/common.css" />
<link rel="stylesheet" type="text/css" href="/nspim/css/new.css" />
<link rel="stylesheet" type="text/css" href="/nspim/css/board.css" />
<script src="/common/js/module.js"></script>

<%-- File Saver --%>
<script type="text/javascript"	src="/dashboard/js/FileSaver.js/FileSaver.js" charset="utf-8"></script>
<script type="text/javascript"	src="/dashboard/js/jquery-zclip-master/jquery.zclip.js"></script>

<script type="text/javascript"	src="/dashboard/js/alasql-develop/dist/alasql.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/alasql/0.3/alasql.min.js"></script> -->
<script src="/dashboard/js/jointjs/lodash.min.js"></script>
<!-- <script src="/dashboard/js/parallel.js"></script> -->

<script type="text/javascript" id="script_common">
	var dataMain = {
		dataList : [],
		dataGroup : []
	};
</script>
<script type="text/javascript" id="script_schemaSearchCondition">
	var EfContextPath = "";
	var colors = Highcharts.getOptions().colors;
	var categories = [ 'MSIE', 'Firefox', 'Chrome', 'Safari', 'Opera' ];
	// zzz
	var schemaContent = {
		containerId : 'contentMain',
		type : 'HorizontalLayout',
		label : '',
		elements : [ 
			{
				containerCss : [
					//{code: 'display', value:''}
					//,{code: 'float', value:'left'}
					//{code: 'height', value:'1000px'}
					//,{code: 'width', value:'100%'}
	
				],
				type : 'chart',
				id : 'smart_polar',
				label : '',
				width : '100%',
				//height: 600,
				data : function() {
					// searchGrid에서 선택된 folder
					var paramObj = {
						macro : 'MACRO_GC_TOTAL'
					};
					var target_macro = paramObj.macro;
					var rtn = {series: {}};
	           		var series = {series:[]};
					$.ajax({
						type : "POST",
						url : "/dashboard/genericlListJson.html",
						data : {
							sqlid : "dashboard.trendSyn.latest",
							searchJson : JSON.stringify(paramObj)
						},
						async : false,
						success : function(response) {
							dataMain.dataList = response.dataList;
							rtn.dataList = response.dataList;
	
						}
					});

					if (dataMain.dataList.length == 0) {
						return rtn;
					}

					// 01. make series1 : grouping
					var datas = dataMain.dataList.filter(function(d){
						var str1 = d.MODULE_NAME;
						var str2 = str1.split("/");
						if(str2.length > 2){
							d.MODULE_NAME1 = str2.splice(0,2).join("/");
							return true;
						}else{
							return false;
						}
						
					});
					dataMain.dataGroup = groupbySum(datas,[ 'MODULE_NAME1' ], target_macro);
					$.each(dataMain.dataGroup, function(i, d) {
						d.y = d[target_macro];
						d.name = d.MODULE_NAME1;
					});
					sortObjects(dataMain.dataGroup, [ [ 'y', 'desc' ] ]);
					
					series.series.push({
	           			type: 'pie',
	           			name: 'Module',
	           			size: '60%',	           			
	           			data: dataMain.dataGroup,
	           			dataLabels: {
	           	            formatter: function () {
	           	                return this.y > 5 ? this.point.name : null;
	           	            },
	           	            color: '#ffffff',
	           	            distance: -30
	           	        }
	           		});
					
					// 01. make series2 : drilldown
					var datadrill = [];
					$.each(dataMain.dataGroup,function(i,d){
						var data1 = datas.filter(function(detail){
							var rtn = (d.MODULE_NAME1 == detail.MODULE_NAME1);
							if(rtn){
								detail.y = detail[target_macro];
								detail.name = detail.MODULE_NAME;
								detail.color = Highcharts.defaultOptions.colors[ i % Highcharts.defaultOptions.colors.length ];
							}
							return rtn;
							
						});
						sortObjects(data1,[ [ 'y', 'desc' ] ]);
						datadrill = datadrill.concat(data1);
					});
					series.series.push({
	           			type: 'pie',
	           			name: 'Module Detail',
	           			data: datadrill,
	           			size: '80%',
	           	        innerSize: '60%'
		           	    
	           		});
				
	           		rtn.series = series;
	           		return rtn;

				},
				options : function() {
					var option = {
						chart : {
							//polar: true
							//backgroundColor : 'transparent',
							type : 'pie',
							zoomType : 'xy'
							,height : 600
						}
						,
						legend : {
							enabled : true
						},
						title : {
							text : ' Macro GC Total'
						},
						plotOptions : {
							pie : {
								allowPointSelect: true,
								shadow : false,
								center : [ '50%', '50%' ],
								dataLabels: {
	   	     	                    enabled: true,
	   	     	                    //distance: -30,
	   	     	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	   	     	                    style: {
	   	     	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	   	     	                    }
	   	     	                }
	   	     	                
							}
						},
						tooltip : {
							valueSuffix : '',
							
						}
	
					};

					return option;
				}

			}

		]
	};
</script>
<script type="text/javascript" id="script_main">
	$(function() {
		loaderShow();
		setTimeout(function() {
			fn_makeHtml('contentMain', schemaContent);
			loaderHide();
		}, 50);
		$(window).resize(function() {
			//console.log("aaaaa");
		});

	});

	// 가사의 UTC 날자로 실제 날의 가져올다.
	function getDataByUtc(pjtCode, phaseSeqDtUtc) {
		var dataRaw = responseData.dataRaw;
		for (var i = 0; i < dataRaw.length; i++) {
			var data = dataRaw[i];
			if (data.PJT_NAME == pjtCode && data.phaseSeqDtUTC == phaseSeqDtUtc)
				return data;//data.phaseSeqDt;
		}
		return 'error';
	}

	alasql.fn.mysplit = function(a, gubun) {
		var splits = [];
		var rtn = '';
		try {
			splits = a.split(gubun);

			if (splits.length > 0) {
				rtn = splits[0];
			} else
				rtn = a;
		} catch (e) {
			rtn = a;
		}
		return rtn;
	}

	Highcharts.setOptions({
		lang : {
			decimalPoint : '.',
			thousandsSep : ','
		},
		colors : [ '#058DC7', '#ED561B', '#DDDF00', '#24CBE5', '#64E572',
				'#FF9655', '#FFF263', '#6AF9C4' ]
	});

	function loaderShow() {
		parent.parent.$("#loader").show();
	}

	function loaderHide() {
		parent.parent.$("#loader").hide();
	}
</script>

<style type="text/css" title="main">
html, body, form {
	/* height: 100%; */
	width: 100%;
	padding: 0;
	margin: 0;
	/* overflow-y: auto; */
	/* overflow-x: hidden; */
	overflow: hidden;
	font-size: 11px;
}

.dashboard-div {
	/* position: relative;
			min-height: 1px;
			padding-left: 0;
			padding-right: 0; */
	width: 100%;
	/* margin-top: 10px; */
	/* height: 90%; */
}

.container {
	padding-right: 0px;
	padding-left: 0px;
}

.chartContainer {
	width: auto;
	height: auto;
	/* border: black; */
	/*  border: 3px solid orange; */
	border-width: 2px 2px 2px 2px;
	border-color: orange;
	border-style: solid;
	/* margin-top: 10px; */
}

.chartContainerSub {
	float: left;
}

.div-priority {
	/* width: 100%; */
	margin-left: 0;
	/* height: 20px; */
	display: block;
	font-size: 12px;
}

/* multi-select 관련  */
.ui-multiselect-checkboxes li label {
	font-size: 13px;
	line-height: 1.3em;
}

.ui-multiselect-checkboxes li label input[type="checkbox"] {
	margin: 0;
	padding: 0;
	vertical-align: middle;
}

ui-multiselect-menu a:link, a:visited, a:active {
	font-family: 'Malgun Gothic', arial, gulim, dotum;
	/* color: #000; */
	text-decoration: none;
}

.modern-p-form {
	font-size: 11px;
	font-family: inherit;
}

#loader {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 1;
	width: 150px;
	height: 150px;
	margin: -75px 0 0 -75px;
	border: 16px solid #f3f3f3;
	border-radius: 50%;
	border-top: 16px solid #3498db;
	width: 120px;
	height: 120px;
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
}

@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform
:
 
rotate
(360deg);
 
}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100%
{
transform
:
 
rotate
(360deg);
 
}
}

/* Add animation to "page content" */
.animate-bottom {
	position: relative;
	-webkit-animation-name: animatebottom;
	-webkit-animation-duration: 1s;
	animation-name: animatebottom;
	animation-duration: 1s
}

@
-webkit-keyframes animatebottom {from { bottom:-100px;
	opacity: 0
}

to {
	bottom: 0px;
	opacity: 1
}

}
@
keyframes animatebottom {from { bottom:-100px;
	opacity: 0
}

to {
	bottom: 0;
	opacity: 1
}

}
.btn_n2 {
	width: 100px;
}

.btn_n2:hover {
	width: 100px;
	cursor: pointer;
	text-decoration: none;
}

.btn_n2:active {
	width: 100px;
}

<%--
탭뷰-- %>a:hover, a:focus {
	text-decoration: none;
	outline: none;
	cursor: pointer;
}

.nav-tabs {
	border-bottom: 1px solid #e4e4e4;
}

.nav-tabs>li {
	margin-right: 1px;
}

.nav-tabs>li>a {
	border-radius: 0px;
	border: 1px solid #e4e4e4;
	border-right: 0px none;
	margin-right: 0px;
	padding: 8px 17px;
	color: #222222;
	transition: all 0.3s ease-in 0s;
}

.nav-tabs>li:last-child {
	border-right: 1px solid #ededed;
}

.nav-tabs>li>a {
	/* padding: 15px 30px; */
	/*  padding: 4px 6px; */
	border: 1px solid #ededed;
	border-right: 0px none;
	border-top: 2px solid #ededed;
	background: #ededed;
	color: #8f8f8f;
	font-weight: bold;
}

.nav-tabs>li>a:hover {
	border-bottom-color: #ededed;
	border-right: 0px none;
	background: #f1f1f1;
	color: #444;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	border-top: 2px solid #3498db;
	border-right: 0px none;
	color: #444;
}

.tab-content>.tab-pane {
	border: 1px solid #e4e4e4;
	border-top: 0px none;
	/* padding: 20px; */
	/*  padding: 20px; */
	line-height: 22px;
}

.tab-content>.tab-pane>h3 {
	margin-top: 0;
}

.table>tbody>tr>td {
	padding: 3px;
}

<%--
/* chart가 숨김시 작아지는 현상 없앰 */
.tab-content>.tab-pane, .pill-content>.pill-pane {
	display: block;
	height: 0;
	overflow-y: hidden;
}

.tab-content>.active, .pill-content>.active {
	height: auto;
}

--%>
.tab-content .ui-th-column {
	text-align: center;
}

.table-copy:before {
	content: "\e142";
}

/***  jqgrid Header   ***/
.ui-jqgrid-hdiv th {
	text-align: center;
}

.ui-jqgrid .ui-jqgrid-labels th.ui-th-column {
	background-color: #f5f5f5;;
	background-image: none
}

.ui-jqgrid .ui-jqgrid-htable th div {
	height: auto;
	overflow: hidden;
	padding-right: 4px;
	padding-top: 2px;
	position: relative;
	vertical-align: text-top;
	white-space: normal !important;
}

th.ui-th-column div {
	white-space: normal !important;
	height: auto !important;
	padding: 2px;
}

input[type="text"], input[type="password"] {
	height: 34px;
}

#tabContainer_host .tab_2depth {
	height: 19px;
	margin-left: 10px;
}

#tabContainer_host .tab_2depth .on {
	border: 1px solid #fb6c07;
	background: rgba(252, 132, 57, 0.67);
}

#tabContainer_host .tab_2depth li a {
	height: 15px;
	line-height: 16px;
}
</style>
</head>
<body">
	<form name="form" id="form" class="">
		<input type="hidden" id="sender" name="sender" value="${param.sender}" />
		<input type="hidden" name="cookieName" value="${param.cookieName}" />
		<input type="hidden" name="cookieToken" value="${param.cookieToken}" />
		<input type="hidden" id="userId" name="userId" value="${param.userId}" />
		<input type="hidden" id="pjtId" name="pjtId" value="${param.pjtId}" />

		<div id="searchCondition"></div>
		<div id="contentMain" style="margin-top: 10px; width: 100%;"></div>


		<div id="div1"></div>
		<div id="div2"></div>
		<div id="loader" style="display: none"></div>
		<div id="dialog-confirm"></div>
	</form>
	<script src="js/highcharts/themes/dashboard-simple.js"></script>
</body>
<div id="dialog-confirm"></div>
</html>