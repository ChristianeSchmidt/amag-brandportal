package ch.openinteractive.amag;

import info.magnolia.cms.gui.control.Control;
import info.magnolia.cms.gui.i18n.I18nAuthoringSupport;

/**
 * This class is optional and represents the configuration for the festo-module module.
 * By exposing simple getter/setter/adder methods, this bean can be configured via content2bean
 * using the properties and node from <tt>config:/modules/festo-module</tt>.
 * If you don't need this, simply remove the reference to this class in the module descriptor xml.
 */
public class AmagModule {
    /* you can optionally implement info.magnolia.module.ModuleLifecycle */

	public static String getLanguageNavigation() {
		String langNav = "";
		I18nAuthoringSupport langUtil = I18nAuthoringSupport.Factory.getInstance();
		Control langChooser = langUtil.getLanguageChooser();

		if (langChooser != null) {
			langNav = langChooser.getHtml();
			String url_de = "";
			String url_fr = "";
			String url_it = "";

			try {
				String[] splittedNav = langNav.split("option");

				for (String navElem : splittedNav) {

					//find label fr
					if (navElem.indexOf("/fr/") > -1 && navElem.indexOf("value=\"/") > -1 ) {
						url_fr = getUrl(navElem);
					}
					//find label it
					else if (navElem.indexOf("/it/") > -1 && navElem.indexOf("value=\"/") > -1 ) {
						url_it = getUrl(navElem);
					}
					//find label de
					else if (navElem.indexOf("value=\"/") > -1) {
						url_de = getUrl(navElem);
					}
				}

				langNav = "<li class=\"language first\"><a href=\"" + url_de + "\"><span>de</a></li>" +
						  "<li class=\"language\"><a href=\"" + url_fr + "\"><span>fr</a></li>" +
						  "<li class=\"language\"><a href=\"" + url_it + "\"><span>it</a></li>";
			}
			catch(Exception e) {
				langNav = langChooser.getHtml();
			}
		}

		return langNav;
	}

	private static String getUrl(String string) {
		String url = "";

		try {
			String[] puffer = string.split("\"");
			url = puffer[1];
		}
		catch(Exception e) {}

		return url;
	}
}
