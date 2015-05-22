package ch.openinteractive.amag.pages;

import ch.openinteractive.amag.AmagModule;
import info.magnolia.cms.core.Content;
import info.magnolia.module.templating.RenderingModel;
import info.magnolia.module.templatingkit.templates.STKTemplate;
import info.magnolia.module.templatingkit.templates.SingletonParagraphTemplateModel;

public class SingleParagraphModel extends SingletonParagraphTemplateModel{

	@SuppressWarnings("rawtypes")
	public SingleParagraphModel(Content content, STKTemplate definition,
			RenderingModel parent) {
		super(content, definition, parent);
		// TODO Auto-generated constructor stub
	}

	public String getLanguageNavigation() {
		return AmagModule.getLanguageNavigation();
	}
}
