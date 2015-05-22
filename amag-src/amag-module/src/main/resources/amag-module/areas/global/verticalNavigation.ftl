[#include "../macros/navigationUL.ftl"/]

[#if model.navigation.showHorizontalNavigation]
	[#assign navigation = model.navigation.horizontalNavigation/]
	<div id="nav">
		<div id="nav-box">
			[@renderNavigation navigation=navigation renderAnyway=false/]
		</div><!-- end nav-box -->
	</div><!-- end nav -->
[/#if]

[#macro renderNavigation navigation renderAnyway]
	[#if navigation.items?has_content]

		[@renderULForNavigation navigation=navigation renderAnyway=renderAnyway ulType="startUL" navType="vertical"/]

		[#list navigation.items as item]
			[#assign hasSubElems = false]
			[#assign itemsChildren = item.getItems()!]

			[#if itemsChildren?size > 0]
				[#assign hasSubElems = true]
			[/#if]
			[#if item.open && item.selected]
				[#assign cssClass = "open on"]
			[#elseif item.open]
				[#assign cssClass = "open"]
			[#elseif item.selected]
				[#assign cssClass = "on"]
			[#else]
				[#assign cssClass = ""]
			[/#if]
			[#if hasSubElems]
				[#assign hasElemsCssClass = "has-subnav"]
			[#else]
				[#assign hasElemsCssClass = "no-subnav"]
			[/#if]

			[#if item.level > 1]
				<li class="${cssClass} ${hasElemsCssClass}">
					<a href="${item.href}">${item.navigationTitle}</a>

					[#if item.open]
						[@renderNavigation navigation=item renderAnyway=true/]
					[/#if]
				</li>
			[#elseif item.level == 1 && item.open]
				[@renderNavigation navigation=item renderAnyway=false/]
			[/#if]
		[/#list]

		[@renderULForNavigation navigation=navigation renderAnyway=renderAnyway ulType="endUL" navType="vertical"/]

	[/#if]
[/#macro]

