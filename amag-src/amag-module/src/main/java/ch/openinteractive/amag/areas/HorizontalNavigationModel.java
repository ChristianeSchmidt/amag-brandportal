package ch.openinteractive.amag.areas;

import info.magnolia.cms.core.Content;
import info.magnolia.module.templatingkit.navigation.NavigationModel;

public class HorizontalNavigationModel extends NavigationModel {

	public HorizontalNavigationModel(Content root, Content selectedNode,
			int depth, boolean allOpen, boolean rootIsHome) {
		super(root, selectedNode, depth, allOpen, rootIsHome);
	}
}
