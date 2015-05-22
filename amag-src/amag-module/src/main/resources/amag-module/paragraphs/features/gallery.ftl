[#include "../macros/image.ftl"/]

[#assign cmsUtil=JspTaglibs["cms-util-taglib"]]
[#assign cms=JspTaglibs["cms-taglib"]]
[#assign galleryImages = model.getGalleryImages(content.imgFolder!)!]


[#if mgnl.editMode]
	<div style="clear:both;">
		[@cms.editBar /]
	</div>
[/#if]


<div class="gallery">
	[#list galleryImages as data]
		[#assign image = data["asset"]]
		[#assign thumbLink = data["link"]]
		[#if image?has_content && thumbLink?has_content]
			<img src="${thumbLink}" data-org-src="${image.link}" class="gallery-image" alt="" title="" />
		[/#if]
	[/#list]
</div>