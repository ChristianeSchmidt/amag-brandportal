[#assign cms=JspTaglibs["cms-taglib"]]

[#assign linkToFile = model.linkToFile!]
[#assign description = stk.decode(content).text!]
[#assign labelForDownloadButton = content.labelForDownloadButton!"Download"]
[#assign showDownload = content.showDownload!false]

[#if mgnl.editMode]
	<div style="clear:both;">
		[@cms.editBar /]
	</div>
[/#if]
<div class="audio-wrapper">
	<div class="file">
		[#if linkToFile?has_content]
			<audio src="${linkToFile}" preload="auto" />
		[#else]
			<h2>No file found!</h2>
		[/#if]
	</div>
	<div class="meta">
		[#if description?has_content]
			<div class="description">
				${description}
			</div>
		[/#if]
		[#if showDownload && linkToFile?has_content]
			<a href="${linkToFile}" target="_blank">${labelForDownloadButton}</a>
		[/#if]
	</div>
</div>
