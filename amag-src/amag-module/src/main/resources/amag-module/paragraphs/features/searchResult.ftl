
[#-------------- INCLUDE AND ASSIGN PART --------------]

[#-- Include: Global --]
[#include "../macros/pagination.ftl"]

[#-- Assigns: General --]
[#assign cms = JspTaglibs["cms-taglib"]]

[#-- Assigns: Get and check Search Results --]
[#assign result = model.result!]
[#assign hasResult = result?has_content]

[#-- Assigns: Macro for Item iteration --]
[#macro assignItemValues item]
	[#-- Assigns: Get Content from List Item --]
	[#assign itemTitle = item.title!item.@name]
	[#assign itemText = item.formattedText!]
	[#assign itemDate = item.date!]
	[#assign itemAuthor = item.author!]
	[#assign itemCategory = item.category!]
	[#assign itemLink = item.link!]

	[#-- Assigns: Is Content Available of Item --]
	[#assign hasText = itemText?has_content]
	[#assign hasDate = itemDate?has_content]
	[#assign hasAuthor = itemAuthor?has_content]
	[#assign hasCategory = itemCategory?has_content]
[/#macro]


[#-------------- RENDERING PART --------------]

[#-- Rendering: Search Results --]
[@cms.editBar  editLabel="${i18n['searchResult.editLabel.paragraph']}" moveLabel="" deleteLabel="" /]

<div class="text">
	<h1><em>${model.count!}</em> ${i18n['search.searchResultTitle']} <span class="search-term"><span>${i18n['search.searchResultFor']} </span>"${model.queryStr!?html}"</span></h1>
[#-- Macro: Pager --]
[@pagination model "top" /]
	<ol>
		[#if hasResult]
			[#list result as item]
				[#-- Macro: Item Assigns --]
				[@assignItemValues item=item/]

				[#-- Rendering: Item rendering --]
				<li>
					<h2><a href="${itemLink}" >${itemTitle}</a></h2>
					[#if hasDate || hasAuthor || hasCategory]
						<ul class="text-data">
							[#if hasDate]
								<li class="date">${itemDate?date?string("dd.MM.yyyy")}</li>
							[/#if]
							[#if hasAuthor]
								<li class="author">${itemAuthor!}</li>
							[/#if]
							[#if hasCategory]
								<li class="cat">${i18n['search.category']} ${itemCategory!}</li>
							[/#if]
						</ul>
					[/#if]
					<p>${itemText!}</p>
				</li>
			[/#list]
		[/#if]
	</ol>
</div><!-- end text -->


[#-- Macro: Pager --]
[@pagination model "bottom" /]


[#-- Rendering: New Search --]
<div class="form-wrapper new-search">
	<form action="${model.searchPageLink!}" >
		<fieldset>
			<h2>${i18n['search.newSearch']}</h2>
			<div>
				<label for="search">
					<span>${i18n['accessibility.header.searchFor']}</span>
				</label>
				<input id="search" name="queryStr" type="text" value="${ctx.queryStr!?html}"/>
				<input class="button" type="submit" value="${i18n['button.label.search']}"/>
			</div>
		</fieldset>
	</form>
</div>

