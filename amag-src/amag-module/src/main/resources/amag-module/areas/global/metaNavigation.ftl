[#assign langNavigation = model.languageNavigation!]
[#assign metaNavigation = model.metaNavigation!]

<div id="nav-meta">
	<ul>
		[#if metaNavigation.exists]
			[@cms.contentNodeIterator items=metaNavigation.content?children]
				[@cms.includeTemplate noEditBars=metaNavigation.inherited/]
			[/@cms.contentNodeIterator]
		[/#if]

		[#if (!metaNavigation.exists || !metaNavigation.inherited) && mgnl.editMode]
			<li><div style="width:103px">[@cms.newBar contentNodeCollectionName="metaNavigation" newLabel="${i18n['link.newLabel']}" paragraph="${stk.asStringList(def.navigation.meta.paragraphs)}" /]</div></li>
		[/#if]

		[#if langNavigation?has_content]
			${langNavigation}
		[/#if]
	</ul>
</div><!-- end nav-meta -->