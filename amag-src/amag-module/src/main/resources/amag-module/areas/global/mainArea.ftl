[#if def.mainArea.intro.enabled]
    [#include def.mainArea.intro.template ]
[/#if]

[@cms.contentNodeIterator contentNodeCollectionName="main"]
    [@cms.includeTemplate /]
[/@cms.contentNodeIterator]

[#if mgnl.editMode]
    <div style="clear: both;padding-top: 20px;">
        [@cms.newBar contentNodeCollectionName="main" newLabel="${i18n['content.newLabel']}" paragraph="${stk.asStringList(def.mainArea.paragraphs)}" /]
    </div>
[/#if]
