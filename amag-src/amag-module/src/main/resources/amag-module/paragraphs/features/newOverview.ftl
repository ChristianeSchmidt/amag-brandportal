
[#-------------- INCLUDE AND ASSIGN PART --------------]

[#-- Include: Global --]
[#include "../teasers/init.inc.ftl"]
[#include "../macros/pagination.ftl"]

[#-- Assigns: Get and check Latest News --]
[#assign pager = model.pager]
[#assign newsList = pager.pageItems!]
[#assign hasNewsList = newsList?has_content]

[#-- Assigns: Macro for Item iteration --]
[#macro assignItemValues item]
    [#-- Assigns: Get Content from List Item--]
    [#assign itemTitle = item.title!item.@name]
    [#assign itemText = stk.abbreviateString(item.abstract!, 100)]
    [#assign itemKicker = item.kicker!]
    [#assign itemDate = item.date]
    [#assign itemLink = mgnl.createLink(item)!]

    [#if !hideTeaserImage]
        [#assign itemImageLink = stk.getAssetLink(item, "image", model)!]
        [#-- Assigns: Define alt for image tag --]
        [#if itemImageLink?has_content]
            [#assign imageAlt = itemTitle]
        [#else]
            [#assign imageAlt = "${i18n['image.resolveError']}"]
        [/#if]
    [/#if]

    [#-- Assigns: Is Content Available of Item--]
    [#assign hasDate = itemDate?has_content]
    [#assign hasKicker = itemKicker?has_content]
    [#assign hasText = itemText?has_content]
    [#assign hasImageLink = itemImageLink?has_content]

    [#if hasImageLink]
      [#assign liClass = ""]
     [#else]
      [#assign liClass = "class='mod'"]
    [/#if]
[/#macro]



[#-------------- RENDERING PART --------------]


[#-- Rendering: Latest News --]
<div class="${divClass}" ${divID}>
    [@cms.editBar editLabel="${i18n['newsOverview.editLabel.paragraph']}" moveLabel="" deleteLabel="" /]

    [#-- Macro: Pager --]
    [@pagination pager "top" /]

    [#if hasNewsList]
        <ul>
        [#list newsList as item]
            [#-- Macro: Item Assigns --]
            [@assignItemValues item=item/]

            [#-- Rendering: Item rendering --]
            <li ${liClass}>
                [#if hasImageLink]<img src="${itemImageLink}" alt="${imageAlt}" />[/#if]
                <h3>
                    <a href="${itemLink}">
                        [#if hasKicker]<em>${itemKicker}</em>[/#if]
                        ${itemTitle}
                    </a>
                </h3>
                <p>[#if hasDate]<em class="date">${itemDate?date?string.medium}</em>[/#if] [#if hasText]${itemText}[/#if] <em class="more"><a href="${itemLink}">${i18n['link.readon']} <span> ${itemTitle}</span></a></em></p>
            </li>
        [/#list]
        </ul>
    [#else]
        <ul>
            <p>${i18n['newsList.noResults']}</p>
        </ul>
    [/#if]
</div><!-- end ${divClass} -->



[#-------------- ADDITIONAL MACROS --------------]

[#-- Macro: Pager --]
[@pagination pager "bottom" /]

