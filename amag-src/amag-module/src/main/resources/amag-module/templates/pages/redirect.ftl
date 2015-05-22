[#assign cms=JspTaglibs["cms-taglib"]]
[@cms.mainBar dialog="amagRedirectProperties" /]

[#assign targetPath = content.path!]
[#assign pathIsValid = false]
[#assign pathIsInternal = true]

[#-- Check if path has content --]
[#if targetPath?has_content]

    [#-- Check if targetPath is internal --]
    [#if model.isInternalPath(targetPath)]

        [#-- Check if targetPath is resolvable to a target content node --]
        [#assign targetNode = mgnl.getContent(targetPath)!]
        [#if targetNode?has_content]
            [#assign pathIsValid = true]
        [/#if]
    [#else]
        [#-- TargetPath is external --]
        [#assign pathIsInternal = false]
    [/#if]
[/#if]

[#if mgnl.editMode]
    <p style="margin-top:40px">

        [#if targetPath?has_content]

                [#-- TargetPath is resolvable to a content node and is internal --]
                [#if pathIsValid && pathIsInternal]
                    [#assign targetLink= mgnl.createLink(targetNode)!]
                    <p>${i18n['redirect.target.success']} <a href="${targetLink}">${targetLink}</a> </p>

                [#-- TargetPath is an external URL --]
                [#elseif !pathIsInternal]
                    <p>${i18n['redirect.target.success']} <a href="${model.externalLink}">${model.externalLink}</a> </p>

                [#-- TargetPath is not external and internally not resolvable to a content node --]
                [#else]
                    <h1>${i18n['redirect.author.404onPublic']} </h1>
                    <p>${i18n['redirect.404.causeIntro']} </p>
                    <p>"${targetPath}" ${i18n['redirect.target.invalid']} </p>
                [/#if]

        [#else]
            ${i18n['redirect.target.fistChild']}

            [#assign childPath = model.redirectPathToFirstChild!]
            [#if childPath?has_content]
                <p>${i18n['redirect.target.childSuccess']} <a href="${childPath}">${childPath}</a> </p>
             [#else]
                <h1>${i18n['redirect.author.404onPublic']} </h1>
                <p>${i18n['redirect.404.causeIntro']} </p>
                <p>${i18n['redirect.target.noChild']} </p>
            [/#if]

        [/#if]

    </p>
[#elseif mgnl.authorInstance]

    <h1>${i18n['redirect.author.404onPublic']} </h1>
    <p>${i18n['redirect.404.causeIntro']} </p>
    [#if !targetPath?has_content]
        <p>${i18n['redirect.target.noChild']} </p>
    [#elseif !pathIsValid]
        <p>${targetPath} ${i18n['redirect.target.invalid']} </p>
    [/#if]

[/#if]