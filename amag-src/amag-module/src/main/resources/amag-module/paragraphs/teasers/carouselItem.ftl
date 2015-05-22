
[#-------------- INCLUDE AND ASSIGN PART --------------]

[#-- Include: Global --]
[#include "../teasers/init.inc.ftl"]

[#-- Assigns: General --]
[#assign cms=JspTaglibs["cms-taglib"]]

[#-- Assigns: Get and check Teaser Target --]
[#assign target = model.target!]
[#assign hasTarget = target?has_content]

[#-- Assigns: Get Content --]
[#assign carouselType = ctx.carouselType]

[#-- Assigns: Macro assigning Values --]
[#macro assignValues ]
	[#-- Assigns: Get Content --]
	[#assign title = content.teaserTitle!target.title!target.@name]
	[#assign text = content.teaserAbstract!target.abstract!]
	[#assign teaserLink = model.teaserLink!]
	[#assign showMovie = content.showMovie!false]
	[#assign isIFrame = false]
	[#if showMovie]
		[#assign showMovieCssClass = "show-movie"]
	[#else]
		[#assign showMovieCssClass = ""]
	[/#if]
	[#assign fontColor = content.fontColor!]
	[#if fontColor?has_content]
		[#assign fontColorCssClass = "font-color-" + fontColor]
	[#else]
		[#assign fontColorCssClass = ""]
	[/#if]
	[#assign logoColor = content.logoColor!]
	[#if logoColor?has_content]
		[#assign logoColorCssClass = "logo-color-" + logoColor]
	[#else]
		[#assign logoColorCssClass = ""]
	[/#if]
	[#if !hideTeaserImage]
		[#assign imageLink = (model.image!).link!]
	[/#if]

	[#-- Assigns: Is Content Available --]
	[#assign hasImageLink = imageLink?has_content]
	[#assign hasText = text?has_content]

	[#-- Assigns: Define alt for image tag --]
	[#if hasImageLink]
		[#assign imageAlt = title]
	[#else]
		[#assign imageAlt = "${i18n['image.resolveError']}"]
	[/#if]

	[#-- Assigns: Add " mod" to divClass if no image is available --]
	[#if !hasImageLink]
		[#assign divClass = divClass+" mod"]
	[/#if]
	
	[#if hasText]
		[#if text?index_of("iframe") > -1]
			[#assign text = stk.decode(content).teaserAbstract!stk.decode(target).abstract!]
			[#assign isIFrame = true]
			[#assign iframeCSSClass = "iframe"]
		[#else]
			[#assign text = stk.abbreviateString(text, 330)]
			[#assign text = "<p>" + text + "</p>"]
		[/#if]
	[/#if]
[/#macro]



[#-------------- RENDERING PART --------------]

[#-- Rendering: Stage Carousel Item --]

[#-- Macro: Value Assigns --]
[@assignValues /]

<div class="${divClass} ${showMovieCssClass!} ${fontColorCssClass!} ${logoColorCssClass!} ${iframeCSSClass!}">
	[#-- Rendering the switcher and slider carousel item --]
	[#if isIFrame]
		<div class="iframe-wrapper">
			[#if mgnl.editMode && hasText]
				[#assign text = content.teaserAbstract!target.abstract!]
				<h3 style="color: #555555">Folgendes HTML wird gerendert:</h3>
				<p>
					${text}
				</p>
			[#elseif hasText]
				${text}
			[/#if]
		</div>
	[#elseif carouselType=="switcher" || carouselType=="slider"]
		[@cms.editBar editLabel="${i18n['carouselItem.editLabel']}" deleteLabel="${i18n['carouselItem.deleteLabel']}"/]
		<${headingLevel}>[#if hasTarget]<a href="${teaserLink}">[/#if]${title}[#if hasTarget]</a>[/#if]</${headingLevel}>
		[#if hasImageLink][#if hasTarget]<a href="${teaserLink}">[/#if]<img src="${imageLink}" alt="${imageAlt}" />[#if hasTarget]</a>[/#if][/#if]
		[#if hasText]<p>${stk.abbreviateString(text, 270) + " "}<em class="more"><a href="${model.teaserLink}">${i18n['link.readon']} </a></em></p>[/#if]

	[#-- Rendering the paging carousel item --]
	[#elseif carouselType=="paging"]
		[@cms.editBar editLabel="${i18n['carouselItem.editLabel']}" moveLabel="" deleteLabel="${i18n['carouselItem.deleteLabel']}"/]

		<${headingLevel}>[#if hasTarget]<a href="${teaserLink}">[/#if]${title}[#if hasTarget]</a>[/#if]</${headingLevel}>
		[#if hasImageLink]<img src="${imageLink}" alt="${imageAlt}" />[/#if]
		[#if hasText]${text}[/#if]
	[/#if]

	<a href="/" class="${logoColorCssClass!}"></a>

	[#if mgnl.editMode]
		<div class="${divClass}">
			[@cms.editBar editLabel="${i18n['carouselItem.editLabel']}" /]
	
			<${headingLevel}><a href="javascript:alert('${i18n['teaser.internal.resolveError']?js_string}')">${i18n['teaser.internal.resolveError']}</a></${headingLevel}>
		</div><!-- end ${divClass} -->
	[/#if]

</div><!-- end ${divClass} -->
