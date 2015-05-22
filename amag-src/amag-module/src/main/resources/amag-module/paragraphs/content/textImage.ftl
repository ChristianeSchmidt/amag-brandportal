[#assign cms=JspTaglibs["cms-taglib"]]
[#include "../macros/image.ftl"/]
[#include "/templating-kit/paragraphs/macros/tocMarkup.ftl"/]

[@tocMarkup model content /]

[#if mgnl.editMode]
  <div style="clear:both;">
      [@cms.editBar /]
  </div>
[/#if]

[#if content.subtitle?has_content]<h2 ${id}>${content.subtitle}</h2>[/#if]

[@image image=model.image! imageClass=model.imageClass/]

[#if content.text?has_content]
    ${stk.decode(content).text}
[/#if]