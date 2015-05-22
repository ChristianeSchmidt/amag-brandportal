package ch.openinteractive.amag.components;

import info.magnolia.cms.core.Content;
import info.magnolia.cms.core.NodeData;
import info.magnolia.cms.util.ContentUtil;
import info.magnolia.module.templating.RenderableDefinition;
import info.magnolia.module.templating.RenderingModel;
import info.magnolia.module.templatingkit.dam.Asset;
import info.magnolia.module.templatingkit.dam.AssetNotFoundException;
import info.magnolia.module.templatingkit.dam.DAMException;
import info.magnolia.module.templatingkit.dam.handlers.DMSDAMHandler;
import info.magnolia.module.templatingkit.paragraphs.ImageModel;
import info.magnolia.module.templatingkit.util.STKUtil;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 
 * @author eisele
 *
 */
@SuppressWarnings("rawtypes")
public class GaleryModel extends ImageModel {

	//private static Logger log = LoggerFactory.getLogger(STKUtil.class);

	public GaleryModel(Content content, RenderableDefinition definition,
			RenderingModel parent) {
		super(content, definition, parent);
	}

	public List<Map<String, Object>> getGalleryImages(String uuidOfGallery) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		try {
			Content gallery = ContentUtil.getContentByUUID("dms", uuidOfGallery);
			Collection<Content> children = gallery.getChildren("mgnl:contentNode");

			for (Content child : children) {
				String uuidOfChild = child.getUUID();
				Map<String, Object> imageData = dmsNodeToAsset(uuidOfChild, child);

				if (imageData.size() != 0) {
					result.add(imageData);
				}
			}
		}
		catch(Exception e) {
			System.out.println(GaleryModel.class + " COULD NOT FIND GALLERY");
			e.printStackTrace();
		}

		return result;
	}

	private static Map<String, Object> dmsNodeToAsset(String uuidOfNode, Content node) {
		DMSDAMHandler handler = new DMSDAMHandler();
		Map<String, Object> result = new HashMap<String, Object>();
		Asset asset = null;
		String link = null;

		try {
			asset = handler.getAssetByKey(uuidOfNode);
		} catch (AssetNotFoundException e) {
			e.printStackTrace();
		} catch (DAMException e) {
			e.printStackTrace();
		}

		try {
			NodeData imageData = node.getNodeData("document");
			link = STKUtil.createImageLink(imageData, "gallery-image");
		} catch(Exception e){
			e.printStackTrace();
			try {
				link = asset.getLink();
			} catch(Exception ex){
				e.printStackTrace();
			}
		}

		result.put("asset", asset);
		result.put("link", link);

		return result;
	}
}
