package ch.openinteractive.amag.components;

import info.magnolia.cms.core.Content;
import info.magnolia.cms.util.ContentUtil;
import info.magnolia.link.LinkUtil;
import info.magnolia.module.templating.RenderableDefinition;
import info.magnolia.module.templating.RenderingModel;
import info.magnolia.module.templating.RenderingModelImpl;

/**
 * 
 * @author eisele
 *
 */
@SuppressWarnings({"rawtypes", "unchecked"})
public class AudioModel extends RenderingModelImpl {

	private String linkToFile = "";

	public AudioModel(Content content, RenderableDefinition definition,
			RenderingModel parent) {
		super(content, definition, parent);
		try {
			String audioUUID = content.getNodeData("audioFile").getString();
			Content audioFile = ContentUtil.getContentByUUID("dms", audioUUID);
			String link = LinkUtil.createLink(audioFile);
			Boolean linkIsValid = checkFileFormat(link);

			if (linkIsValid) {
				setLinkToFile(LinkUtil.createLink(audioFile));
			}
		}catch(Exception e) {
			// well do nothing? yea!
			System.out.println(AudioModel.class + " ERROR: Could not load Audiofile!");
			e.printStackTrace();
		}
	}

	private Boolean checkFileFormat(String link) {
		Boolean isValid = false;

		if (link.indexOf(".mp3") > -1) {
			isValid = true;
		}

		return isValid;
	}
	
	public String getLinkToFile() {
		return linkToFile;
	}

	public void setLinkToFile(String linkToFile) {
		this.linkToFile = linkToFile;
	}
}
