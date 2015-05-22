[#if def.header.branding.enabled]
	[#include def.header.branding.template]
[/#if]

<div id="header">
	<div class="inner">
	[#include def.navigation.horizontal.template]

	<div id="search-box">
		<h6>${i18n['accessibility.header.search']}</h6>
		<form action="${model.searchPageLink!}" >
		<div>
			<label for="searchbar">${i18n['accessibility.header.searchFor']}</label>
			<input id="searchbar" name="queryStr" type="text" value="${ctx.queryStr!?html}" placeholder="${i18n['button.label.search']}" />
			<input class="button" type="submit" value="${i18n['button.label.search']}" />
		</div>
		</form>
	</div><!-- end search-box -->

	[#if def.navigation.meta.enabled]
		[#include def.navigation.meta.template]
	[/#if]
	</div>
</div>

[#if def.header.stage.enabled]
	[#include def.header.stage.template]
[/#if]
		
[#if def.header.sectionHeader.enabled]
	[#include def.header.sectionHeader.template]
[/#if]


