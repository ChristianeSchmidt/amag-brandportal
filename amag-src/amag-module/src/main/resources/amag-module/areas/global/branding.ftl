[#if mgnl.editMode]<!-- TODO: better solution for showing the edit and new bar if the service menu links in preview mode -->
    <br/>
    <br/>
[/#if]



[#assign inhContent = mgnl.inherit(content)]
[#assign siteTitle = model.siteTitle!model.homeTitle!model.homeName]
[#assign homeTitle = model.homeTitle!model.homeName]
[#assign logoImageLink = model.logoImageLink!]
[#assign printLogoImageLink = model.printLogoImageLink!logoImageLink]
[#assign logoAltText = inhContent.alternativeLogoText!siteTitle]


<div id="branding">
    <p class="skip"><a href="#main">${i18n['accessibility.header.mainContent']}</a></p>
    <div id="logo">
        <a href="${model.homeLink}" title="${i18n['logo.title']}">
            [#if printLogoImageLink?has_content]<img src="${printLogoImageLink}" alt="${logoAltText}" />[/#if]
            <strong>${logoAltText}</strong>
            [#if inhContent.slogan?has_content]<em>${inhContent.slogan}</em>[/#if]
            <span></span>
        </a>
    </div><!-- end logo -->
    

</div><!-- end branding -->