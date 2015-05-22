[#-- Definition: Pagination --]
[#macro pagination pager position]

	[#if pager?has_content && (pager.position?starts_with(position) || pager.position?starts_with("both"))]

		[#if pager.numPages > 1]
			<div class="pager">
				<h3>${i18n['search.title']}</h3>
				<ul>
				[#if pager.currentPage > 1]
					<li class="previous">
					  <a href="${pager.getPageLink(pager.currentPage -1)}">${i18n['search.previous']}</a>
					</li>
				[/#if]
				[#if pager.beginIndex > 1]
					<li><a href="${pager.getPageLink(1)}" title="${i18n['search.page']}">1</a></li>
					[#if pager.beginIndex > 2]
					  <li><span>...</span></li>
					[/#if]
				[/#if]
					[#list pager.beginIndex..pager.endIndex as i]
						[#if i != pager.currentPage]
							<li><a href="${pager.getPageLink(i)}" title="${i18n['search.page']}">${i}</a></li>
						[#else]
							<li><em>${i18n['search.current']}</em><strong>${i}</strong></li>
						[/#if]
					[/#list]
				[#if pager.endIndex < pager.numPages ]
				  [#if pager.endIndex < pager.numPages - 1]
					  <li><span>...</span></li>
					[/#if]
					<li><a href="${pager.getPageLink(pager.numPages)}" title="${i18n['search.page']}">${pager.numPages}</a></li>

				[/#if]
				[#if pager.currentPage < pager.numPages]
					<li class="next"><a href="${pager.getPageLink(pager.currentPage + 1)}" title="${i18n['search.page']}">${i18n['search.next']}</a></li>

				[/#if]
				</ul>
			</div><!-- end pager -->
		[/#if]
	[/#if]
[/#macro]