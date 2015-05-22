[#assign cms=JspTaglibs["cms-taglib"]]

[#assign headingLevel = def.headingLevel]
[#assign hideTeaserImage = content.hideTeaserImage!false]
[#assign divClass = def.divClass]
[#assign divIDPrefix = def.divIDPrefix!]

[#-- Adding a prefix passed from the parent teaser-group --]
[#if ctx.divIdPrefix?? && divIDPrefix??]
    [#assign divIDPrefix = "${ctx.divIdPrefix}-${divIDPrefix}"]
[/#if]

[#-- Setting variable teaserCount for usage in the teaser-template --]
[#assign teaserCount = ctx.index!stk.count(divIDPrefix)]

[#if divIDPrefix?has_content]
    [#assign divID = 'id="${divIDPrefix}-${teaserCount}"']
[#elseif def.divID?has_content]
    [#assign divID = 'id="${def.divID}"']
[#else]
    [#assign divID = ""]
[/#if]

[#if hideTeaserImage]
    [#assign divClass = "${divClass} mod"]
[/#if]