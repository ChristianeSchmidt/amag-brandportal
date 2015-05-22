package ch.openinteractive.amag.pages;

import info.magnolia.cms.core.Content;
import info.magnolia.module.templating.RenderingModel;
import info.magnolia.module.templatingkit.templates.STKTemplate;
import info.magnolia.module.templatingkit.templates.STKTemplateModel;
import ch.openinteractive.amag.AmagModule;

@SuppressWarnings("rawtypes")
public class DefaultPageModel extends STKTemplateModel{

	@SuppressWarnings("unchecked")
	public DefaultPageModel(Content content, STKTemplate definition,
			RenderingModel parent) {
		super(content, definition, parent);
	}

	public String getLanguageNavigation() {
		return AmagModule.getLanguageNavigation();
	}
}
