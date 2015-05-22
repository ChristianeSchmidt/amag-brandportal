<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
[#assign cms=JspTaglibs["cms-taglib"]]
[#assign cmsu=JspTaglibs["cms-util-taglib"]]

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="${model.language}" lang="${model.language}">

<head>
	[#include "htmlHeader.ftl"]
</head>

[#assign pageType = def.pageType!""]

[#if model.bodyClass?has_content]
	[#assign bodyClass = 'class="${model.bodyClass} ${pageType}"']
[#else]
	[#assign bodyClass = '${pageType}']
[/#if]

[#if def.bodyID?has_content]
	[#assign bodyID = 'id="${def.bodyID}"']
[#else]
	[#assign bodyID = '']
[/#if]

<body ${bodyID} ${bodyClass}>
	[#if def.dialog?has_content]
		[@cms.mainBar label="Page Info" dialog="${def.dialog!}" /]
	[#else]
		[@cms.mainBar label="" /]
	[/#if]

	<div id="wrapper">

		[#if def.header.enabled]	
			[#include def.header.template]
		[/#if]

		<div id="wrapper-2">

			[#include def.navigation.vertical.template]

			<div id="wrapper-3">
				[#----------------------------]
				[#-- LOAD CORRECT TEMPLATE ---]
				[#----------------------------]
				[#if pageType == "iframe"]
					[#include "pages/iframe.ftl"]
				[#else]
					[#include "pages/default.ftl"]
				[/#if]
			</div><!-- end wrapper-3 -->

			<!--
				CURRENTLY NOT USED?
			[#if def.promosArea.enabled]
				[#include def.promosArea.template]
			[/#if]
			[#if def.baseArea.enabled]
				[#include def.baseArea.template]
			[/#if]
			-->

		</div><!-- end wrapper-2 -->

		[#if def.breadcrumb.enabled]
			[#include def.breadcrumb.template]
		[/#if]

		[#include def.footer.template]
	</div><!-- end wrapper -->

	<iframe src="http://amag.brandmaker.com/tiles/navigationLinks/ExternalLinkIFrameTemplate.jsp?linkUrl=" width="0" height="0" name="keepalive" scrolling="no" marginheight="0" marginwidth="0" frameborder="0" id="keepaliveiframe"></iframe>

	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-45334604-1']);
		_gaq.push(['_setDomainName', 'brandmaker.com']);
		_gaq.push(['_trackPageview']);
	
		(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
	</script>

</body>
</html>