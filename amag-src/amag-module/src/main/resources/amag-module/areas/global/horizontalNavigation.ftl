[#assign cms=JspTaglibs["cms-taglib"]]
[#assign elemCounter = 1]
[#include "../macros/navigationUL.ftl"/]

[#if model.navigation.showHorizontalNavigation]
	[#assign navigation = model.navigation.horizontalNavigation/]
	[#if (model.navigation.horizontalLevel >1 && navigation.selectedItem??) && (navigation.selectedItem.level>1 || !navigation.selectedItem.leaf)]
		[#assign cssClass = "class=\"plus-navsub\""]
	[/#if]
	<div id="nav-global" ${cssClass!}>
		[@renderNavigation navigation=navigation /]
	</div><!-- end nav-global -->
[/#if]



[#macro renderNavigation navigation]
	[#if navigation.items?has_content]

		[@renderULForNavigation navigation=navigation renderAnyway=false ulType="startUL" navType="horizontal"/]

			[#list navigation.items as item]

				[#assign itemContent = item.getContent()!]
				[#assign itemID = itemContent.@uuid]
				[#assign itemID = itemID?split("-")]
				[#assign itemID = itemID[0] + itemID[1]]

				[#-------------------------------------------]
				[#-- HANDLE WIDE CLASS FOR SECOND LEVEL UL --]
				[#-------------------------------------------]
				[#assign setWideClass = false]

				[#if item.level == 1]
					[#list item.items as lvl2Item]
						[#list lvl2Item.items as lvl3Item]
							[#assign childItemContent = lvl3Item.getContent()!]
							[#assign showFlyoutOnChild = childItemContent.showFlyoutMenu!false]

							[#if showFlyoutOnChild]
								[#assign setWideClass = true]
							[/#if]
						[/#list]
					[/#list]
				[/#if]


				[#if setWideClass]
					[#assign cssWideClass = "has-subnav-wide"]
				[#else]
					[#assign cssWideClass = ""]
				[/#if]

				[#------------------------]
				[#-- ASSIGN CSS CLASSES --]
				[#------------------------]
				[#if item.open && item.selected]
					[#assign cssClass = " class=\"open on ${cssWideClass} elem-${itemID}\""]
				[#elseif item.open]
					[#assign cssClass = " class=\"open ${cssWideClass} elem-${itemID}\""]
				[#elseif item.selected]
					[#assign cssClass = " class=\"on ${cssWideClass} elem-${itemID}\""]
				[#else]
					[#assign cssClass = " class=\"${cssWideClass} elem-${itemID}\""]
				[/#if]

				[#if item.level == 1]
					[#assign id = " id=\"nav-sec-${item.id}\""]
				[#else]
					[#assign id = ""]
				[/#if]

				[#assign showFlyout = itemContent.showFlyoutMenu!false]

				[#if showFlyout || item.level == 1]
					<li${id}${cssClass}>
						<a href="${item.href}"><span>${item.navigationTitle}</span></a>
						[@renderNavigation navigation=item /]
					</li>
				[/#if]

				[#assign elemCounter = elemCounter + 1]
			[/#list]

		[@renderULForNavigation navigation=navigation renderAnyway=false ulType="endUL" navType="horizontal"/]
		
	[/#if]
[/#macro]

