
[#-------------- INCLUDE AND ASSIGN PART --------------]

[#include "/templating-kit/paragraphs/macros/image.ftl"/]

[#-- Assigns: General --]
[#assign cms = JspTaglibs["cms-taglib"]]

[#-- Assigns: Get Content --]
[#assign title = content.subtitle!]
[#assign isExtended = content.isExtended!false]
[#assign headingLevel = def.headingLevel!]
[#assign text = stk.decode(content).text!]
[#assign index = ctx.index!]
[#assign useIndex = ctx.useIndex!false]
[#assign indexString = ('"'+(ctx.indexString!)+'"')?eval]
[#assign itemID = def.divIDPrefix+"-"+index]
[#assign divID = def.divID]

[#-- Assigns: Is Content Available --]
[#assign hasText = text?has_content]

[#if isExtended]
	[#assign extendCssClass = "extended"]
[/#if]

[#-------------- RENDERING PART --------------]

[#-- Rendering: FAQ item --]
<div class="accordion-entry ${extendCssClass!}">
	[@cms.editBar editLabel="${i18n['faqItem.editLabel.paragraph']}"/]
	<${headingLevel}>
	    <a href="#${itemID}">
	        [#if useIndex] ${indexString} [/#if]
	        ${title}
	    </a>
	</${headingLevel}>
	<div id="${divID}">
	  <div id="${itemID}">
	      [@image image=model.image! imageClass=model.imageClass/]
	      [#if hasText]
	          ${text}
	      [/#if]
	    </div>
	</div><!-- end ${divID} -->
</div>
